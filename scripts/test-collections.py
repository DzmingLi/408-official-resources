"""Regression checks for source identity, classification and reserved papers."""
from pathlib import Path
import runpy
import tempfile
import unittest
from unittest.mock import patch

MODULE = runpy.run_path(str(Path(__file__).with_name('extract-collections.py')))
ROOT = Path(__file__).resolve().parent.parent


class CollectionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        builder = runpy.run_path(str(ROOT / 'scripts/build-collections.py'))
        builder['generate_previews'](ROOT)

    def test_collection_release_downloads_cover_all_subjects_in_syllabus_order(self):
        publisher = runpy.run_path(str(ROOT / 'scripts/publish-release.py'))
        groups = publisher['collection_plan']()
        self.assertEqual({g['subject']: len(g['rows']) for g in groups}, {
            '数据结构': 31, '计算机组成原理': 28, '操作系统': 15, '计算机网络': 16})
        ds = groups[0]['rows']
        self.assertEqual(list(dict.fromkeys(r['chapter'] for r in ds)),
                         ['基本概念', '线性表', '栈、队列和数组', '树与二叉树', '图', '查找', '排序'])
        self.assertEqual(next(r for r in ds if r['chapter'] == '树与二叉树')['title'], '树的基本概念')
        for group in groups:
            names = [r[key] for r in group['rows'] for key in ('question_name', 'answer_name')]
            self.assertEqual(len(names), len(set(names)))
            self.assertTrue(all(name.isascii() and name.endswith('.pdf') for name in names))
            notes = publisher['collection_notes'](group, 'commit', 'owner/repo')
            for row in group['rows']:
                self.assertIn(row['title'], notes)
                self.assertIn('/' + row['question_name'] + ')', notes)
                self.assertIn('/' + row['answer_name'] + ')', notes)

    def test_collection_release_rejects_partial_or_unexpected_builds(self):
        publisher = runpy.run_path(str(ROOT / 'scripts/publish-release.py'))
        groups = publisher['collection_plan']()
        with tempfile.TemporaryDirectory() as tmp:
            directory = Path(tmp)
            files = [directory / row[key] for group in groups for row in group['rows']
                     for key in ('question', 'answer')]
            for path in files:
                path.parent.mkdir(parents=True, exist_ok=True)
                path.touch()
            self.assertEqual(len(publisher['collection_release_files'](directory)), 4)
            files[-1].unlink()
            with self.assertRaisesRegex(ValueError, 'Collection PDF mismatch'):
                publisher['collection_release_files'](directory)
            files[-1].touch()
            (directory / 'unexpected.pdf').touch()
            with self.assertRaisesRegex(ValueError, 'Collection PDF mismatch'):
                publisher['collection_release_files'](directory)

    def test_collection_upload_failure_keeps_previous_assets(self):
        publisher = runpy.run_path(str(ROOT / 'scripts/publish-release.py'))
        calls = []

        def failing_upload(*args):
            calls.append(args)
            if args[:2] == ('release', 'upload'):
                path, label = args[3].split('#')
                self.assertEqual(Path(path).name, 'ds-01-01-questions.pdf')
                self.assertEqual(label, '算法的基本概念-题目.pdf')
                self.assertEqual(Path(path).read_bytes(), b'complete PDF')
                raise RuntimeError('Upload failed')
            return ''

        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp) / '算法的基本概念-题目.pdf'
            source.write_bytes(b'complete PDF')
            assets = {'ds-01-01-questions.pdf': (source, source.name)}
            with patch.dict(publisher['publish_assets'].__globals__, gh=failing_upload):
                with self.assertRaisesRegex(RuntimeError, 'Upload failed'):
                    publisher['publish_assets']('collection-数据结构', '数据结构分类汇编', 'notes',
                                                assets, 'commit', 'owner/repo', set(), latest=False)
        self.assertFalse(any(call[:2] == ('release', 'delete-asset') for call in calls))
        self.assertIn('--latest=false', calls[0])

    def test_complete_ds_coverage_and_exact_syllabus_leaves(self):
        ds = runpy.run_path(str(ROOT / 'scripts/ds-collection-plan.py'))
        plans = {t: p for t, p in MODULE['PLANS'].items()
                 if p['directory'].startswith('数据结构/')}
        actual = [e for p in plans.values() for entries in p['sections'].values() for e in entries]
        expected = {(y, n) for y in range(2009, 2023)
                    for n in range(1, 11 if y == 2009 else 12)}
        expected.update((y, n) for y in range(2009, 2023)
                        for n in ((41,) if y == 2014 else (42, 43) if y == 2016 else (41, 42)))
        self.assertEqual(len(expected), 180)
        self.assertEqual({e for e in actual if len(e) == 2}, expected)
        self.assertEqual(len(actual), len(set(actual)))
        self.assertEqual({e for e in actual if len(e) == 3},
                         {(2013, n, 'sample') for n in (1, 2, 9, 10)})
        syllabus = (ROOT / '考试大纲/数据结构.org').read_text()
        for _, _, leaves in ds['LECTURES']:
            for leaf in leaves:
                self.assertIn(leaf, syllabus)
        graph = {e for p in plans.values() if p['directory'].startswith('数据结构/图/')
                 for entries in p['sections'].values() for e in entries if len(e) == 2}
        designated = {(y, n) for y, codes in ds['YEAR_TOPICS'].items()
                      for n, code in enumerate(codes.split(), 1) if code == 'graph'}
        designated.update((y, n) for y, entries in ds['COMPOSITES'].items()
                          for n, code in entries.items() if code == 'graph')
        self.assertEqual(graph, designated)
        self.assertIn((2014, 41), plans['二叉树']['sections']['二叉树的遍历'])
        self.assertNotIn((2014, 41), plans['树与二叉树的应用']['sections']['哈夫曼（Huffman）树和哈夫曼编码'])

    def test_all_papers_have_complete_coverage_across_subjects(self):
        actual = {e for p in MODULE['PLANS'].values()
                  for entries in p['sections'].values() for e in entries if len(e) == 2}
        # Hamming codes remain in the networking syllabus; subject-level
        # exclusions must not be mistaken for exclusions from all collections.
        excluded = {(2013, 37), (2013, 20)}
        expected = {(y, n) for y in range(2009, 2023) for n in range(1, 48)}
        self.assertEqual(len(expected - excluded), 656)
        self.assertEqual(actual, expected - excluded)
        self.assertEqual(MODULE['PLANS']['差错控制']['sections']['纠错编码'], [(2013, 15)])
        for entry, owner in (((2013, 15), '差错控制'), ((2009, 11), '指令执行过程'),
                             ((2016, 47), '文件'), ((2019, 43), '同步与互斥')):
            self.assertEqual([t for t, p in MODULE['PLANS'].items()
                              for entries in p['sections'].values() if entry in entries], [owner])

    def test_complete_coa_coverage_and_exact_syllabus_leaves(self):
        coa = runpy.run_path(str(ROOT / 'scripts/coa-collection-plan.py'))
        actual = [entry for plan in coa['PLANS'].values()
                  for entries in plan['sections'].values() for entry in entries]
        papers = {entry for entry in actual if len(entry) == 2}
        expected = {(year, number) for year in range(2009, 2023)
                    for number in (*range(12, 23), 43, 44)}
        expected.difference_update({(2014, 43), (2016, 43), (2019, 43), (2019, 44)})
        expected.update({(2014, 45), (2016, 45), (2019, 45)})
        expected.difference_update(MODULE['EXCLUDED_COA_QUESTIONS'])
        expected.add((2009, 11))
        self.assertEqual(len(expected), 180)
        self.assertEqual(papers, expected)
        self.assertEqual(len(actual), len(set(actual)))
        self.assertEqual({entry for entry in actual if len(entry) == 3},
                         {(2013, n, 'sample') for n in (3, 4, 11, 12)})
        syllabus = (ROOT / '考试大纲/计算机组成原理.org').read_text()
        for _, _, leaves in coa['LECTURES']:
            for leaf in leaves:
                self.assertIn(leaf, syllabus)
        for plan in coa['PLANS'].values():
            self.assertTrue(any(plan['sections'].values()))

    def test_coa_shared_background_includes_diagram_and_program(self):
        for year, number, title, evidence in (
                (2014, 45, '异常和中断机制', '程序段'),
                (2017, 44, '高级语言程序与机器级代码之间的对应', 'float')):
            _, text, _ = MODULE['render'](ROOT, title, MODULE['PLANS'][title])
            body = text.split(f'#question(label: n => [{year} {number}])', 1)[1]
            self.assertIn('共用背景（不含小问）', body)
            self.assertIn(evidence, body)
        _, control, _ = MODULE['render'](ROOT, '控制器的功能和工作原理',
                                          MODULE['PLANS']['控制器的功能和工作原理'])
        self.assertLess(control.index('[2015 43]'), control.index('[2015 44]'))
        self.assertEqual(control.count('let port(x, y, tx, ty, body)'), 1)
        for entry, owner in (((2014, 44), '指令流水线'),
                             ((2019, 45), '异常和中断机制'),
                             ((2020, 44), '高速缓冲存储器（Cache）'),
                             ((2022, 44), 'I／O方式')):
            owners = [title for title, plan in MODULE['PLANS'].items()
                      if plan['directory'].startswith('计算机组成原理/')
                      for entries in plan['sections'].values() if entry in entries]
            self.assertEqual(owners, [owner])

    def test_coa_supplemented_official_answers_are_available(self):
        module = runpy.run_path(str(ROOT / 'scripts/extract-collection-answers.py'))
        for year, number, evidence in ((2016, 44, '25070000'),
                                       (2017, 43, '4B7F FFFFH'),
                                       (2017, 44, '96个字节')):
            source, items = module['answers'](ROOT, year)
            self.assertEqual(source, ROOT / f'历年真题+参考解答/{year}/{year}-答案.typ')
            self.assertEqual(set(items), set(range(1, 48)))
            self.assertIn(evidence, items[number])

    def test_complete_os_coverage_and_exact_syllabus_leaves(self):
        os_plans = {title: plan for title, plan in MODULE['PLANS'].items()
                    if plan['directory'].startswith('操作系统/')}
        actual = [entry for plan in os_plans.values()
                  for entries in plan['sections'].values() for entry in entries]
        papers = {entry for entry in actual if len(entry) == 2}
        expected = {(year, number) for year in range(2009, 2023)
                    for number in (*range(23, 33), 45, 46)}
        expected.remove((2019, 45))  # Pure COA question, not the OS continuation.
        expected.update({(2019, 43), (2019, 44), (2014, 47), (2016, 47)})
        self.assertEqual(len(expected), 171)
        self.assertEqual(papers, expected)
        self.assertEqual(len(actual), len(set(actual)))
        self.assertEqual({entry for entry in actual if len(entry) == 3},
                         {(2013, n, 'sample') for n in (5, 6, 13, 14)})
        syllabus = (ROOT / '考试大纲/操作系统.org').read_text()
        for plan in os_plans.values():
            for leaf in plan['sections']:
                self.assertIn(leaf, syllabus)

    def test_os_shared_background_is_self_contained(self):
        for year, number, title in ((2014, 45, '虚拟内存管理'),
                                    (2017, 45, '虚拟内存管理'),
                                    (2018, 45, '虚拟内存管理'),
                                    (2019, 46, '内存管理基础')):
            _, text, _ = MODULE['render'](ROOT, title, MODULE['PLANS'][title])
            self.assertIn('共用背景（不含小问）', text)
            self.assertIn(f'[{year} {number}]', text)

    def test_long_sample_program_answer_can_paginate(self):
        module = runpy.run_path(str(ROOT / 'scripts/extract-collection-answers.py'))
        output = dict(module['outputs'](ROOT))
        target = ROOT / '分类汇编/操作系统/进程管理/同步与互斥/同步与互斥-answers.typ'
        sample = output[target].split('=== 旧版题型示例', 1)[1]
        self.assertNotIn('#block(breakable: false)', sample)

    def test_2010_delay_question_is_network_performance(self):
        plans = MODULE['PLANS']
        self.assertIn((2010, 34), plans['计算机网络概述']['sections']['计算机网络的主要性能指标'])
        self.assertNotIn((2010, 34), plans['通信基础']['sections']['电路交换、报文交换与分组交换'])

    def test_2011_baud_rate_question_is_basic_concepts(self):
        sections = MODULE['PLANS']['通信基础']['sections']
        self.assertIn((2011, 34), sections['信道、信号、带宽、码元、波特、速率、信源与信宿等基本概念'])
        self.assertNotIn((2011, 34), sections['编码与调制'])

    def test_network_overview_mac_and_communication_use_syllabus_headings(self):
        expected = {
            '计算机网络概述': ['计算机网络的定义、组成与功能', '计算机网络的分类',
                '计算机网络的主要性能指标', '计算机网络分层结构',
                '计算机网络协议、接口、服务等概念', 'ISO/OSI参考模型和TCP/IP参考模型'],
            '介质访问控制': ['信道划分', '随机访问', '轮询访问'],
            '通信基础': ['信道、信号、带宽、码元、波特、速率、信源与信宿等基本概念',
                '奈奎斯特定理与香农定理', '编码与调制', '电路交换、报文交换与分组交换',
                '数据报与虚电路'],
        }
        for title, headings in expected.items():
            self.assertEqual(list(MODULE['PLANS'][title]['sections']), headings)

    def test_early_answers_use_syllabus_except_2013(self):
        import hashlib
        for year in (2009, 2010, 2011, 2012, 2014):
            text = (ROOT / f'历年真题+参考解答/{year}/{year}-答案.typ').read_text()
            self.assertIn('// 按考纲录入', text)
            self.assertNotIn('评分说明', text)
            self.assertEqual(text.count('【答案要点】'), 7)
        sample = ROOT / '历年真题+参考解答/2013/2013-答案.typ'
        self.assertEqual(hashlib.sha256(sample.read_bytes()).hexdigest(),
                         'a880b6d3729f8cf76c3127522e2eab12f9d7ad842f5b67ce0b338654970233ad')
        old = (ROOT / '历年真题+参考解答/2009/2009-答案.typ').read_text()
        self.assertIn('举例说明（略）。', old)
        self.assertNotIn('page-117-img-12.jpg', old)
        code = (ROOT / '历年真题+参考解答/2012/2012-答案.typ').read_text()
        self.assertIn('let schedule =', code)
        self.assertIn('table.cell(colspan: 17)[时间单元]', code)

    def test_fast_ethernet_question_moves_to_lan_and_physical_merges(self):
        for entry in ((2019, 34), (2013, 34)):
            owners = [title for title, plan in MODULE['PLANS'].items()
                      for entries in plan['sections'].values() if entry in entries]
            self.assertEqual(owners, ['局域网'])
            self.assertIn(entry, MODULE['PLANS']['局域网']['sections']['以太网与IEEE 802.3'])
        self.assertEqual(list(MODULE['PLANS']['局域网']['sections']), [
            '局域网的基本概念与体系结构', '以太网与IEEE 802.3',
            'IEEE 802.11无线局域网', 'VLAN基本概念与基本原理'])
        preview = ROOT / '分类汇编/preview/物理层分类汇编-题目.typ'
        builder = runpy.run_path(str(ROOT / 'scripts/build-collections.py'))
        inputs, chapter = builder['collection_inputs'](preview, ROOT / '分类汇编')
        self.assertEqual(chapter, ('计算机网络', '物理层'))
        self.assertEqual([p.stem for p in inputs], ['通信基础-题目', '传输介质-题目'])
        for name in ('通信基础', '传输介质'):
            self.assertFalse((ROOT / f'分类汇编/preview/{name}-题目.typ').exists())
            self.assertFalse((ROOT / f'分类汇编/answers-preview/{name}-answers.typ').exists())

    def test_mcq_answers_have_no_explanations(self):
        module = runpy.run_path(str(ROOT / 'scripts/extract-collection-answers.py'))
        for year in range(2009, 2023):
            _, items = module['answers'](ROOT, year)
            for number in range(1, 41):
                self.assertIn(items[number], ('A', 'B', 'C', 'D'), (year, number))
        _, sample = module['answers'](ROOT, 2013, sample=True)
        for number in range(1, 9):
            self.assertIn(sample[number], ('A', 'B', 'C', 'D'))
        for year in range(2009, 2015):
            text = (ROOT / f'历年真题+参考解答/{year}/{year}-答案.typ').read_text()
            choices, solutions = text.split('= 二、综合应用题', 1)
            self.assertNotIn('解析：', choices)
            self.assertIn('【答案要点】', solutions)

    def test_answers_are_complete_and_reproducible(self):
        module = runpy.run_path(str(ROOT / 'scripts/extract-collection-answers.py'))
        outputs = list(module['outputs'](ROOT))
        self.assertEqual(len(outputs), len(MODULE['PLANS']))
        for target, content in outputs:
            self.assertEqual(target.read_text(), content, str(target))
        for title, plan in MODULE['PLANS'].items():
            target = ROOT / '分类汇编' / plan['directory'] / (title + '-answers.typ')
            expected = [entry for entries in plan['sections'].values() for entry in entries]
            actual = [line for line in target.read_text().splitlines() if line.startswith('=== ')]
            self.assertEqual(len(actual), len(expected), title)
            for entry, label in zip(expected, actual):
                self.assertEqual(label.split('：')[0], '=== 旧版题型示例' if len(entry) == 3
                                 else f'=== {entry[0]} {entry[1]}')

    def test_answer_previews_preserve_question_merges(self):
        builder = runpy.run_path(str(ROOT / 'scripts/build-collections.py'))
        for question in (ROOT / '分类汇编/preview').glob('*-题目.typ'):
            answer = ROOT / '分类汇编/answers-preview' / question.name.replace('-题目', '-answers')
            question_inputs, chapter = builder['collection_inputs'](question, ROOT / '分类汇编')
            answer_inputs, answer_chapter = builder['collection_inputs'](answer, ROOT / '分类汇编')
            self.assertEqual(chapter, answer_chapter)
            self.assertEqual(answer_inputs, [p.with_name(p.name.replace('-题目', '-answers'))
                                             for p in question_inputs])
            self.assertIn('solutions: true', answer.read_text())

    def test_official_previews_cover_each_lecture_once_and_merges_stay_in_chapter(self):
        builder = runpy.run_path(str(ROOT / 'scripts/build-collections.py'))
        expected_merges = {
            '操作系统的基本概念与发展历程-题目': ('操作系统的基本概念', '操作系统发展历程'),
            '物理层分类汇编-题目': ('通信基础', '传输介质'),
            '传输层提供的服务与UDP协议-题目': ('传输层提供的服务', 'UDP协议'),
            'FTP与电子邮件-题目': ('FTP', '电子邮件'),
            '流量控制与可靠传输机制-题目': ('数据链路层的功能', '差错控制', '流量控制与可靠传输机制'),
            'DNS系统-题目': ('网络应用模型', 'DNS系统'),
        }
        self.assertEqual(builder['MERGED_COLLECTIONS'], expected_merges)
        self.assertEqual(builder['SINGLE_PAGE_MERGES'],
                         {'传输层提供的服务与UDP协议-题目', 'FTP与电子邮件-题目', '操作系统的基本概念与发展历程-题目'})
        expected = {MODULE['render'](ROOT, title, plan)[0].resolve()
                    for title, plan in MODULE['PLANS'].items()}
        actual = []
        previews = ROOT / '分类汇编/preview'
        for source in previews.glob('*.typ'):
            if source.name == 'template.typ':
                continue
            inputs, _ = builder['collection_inputs'](source, ROOT / '分类汇编')
            actual.extend(inputs)
        self.assertEqual(set(actual), expected)
        self.assertEqual(len(actual), len(expected))
        for title in ('FTP', '电子邮件', '传输层提供的服务', 'UDP协议', '数据链路层的功能', '网络应用模型'):
            self.assertFalse((previews / (title + '-题目.typ')).exists())

    def test_no_generic_network_comprehensive_bucket(self):
        self.assertFalse(any('综合' in title for title, plan in MODULE['PLANS'].items()
                             if plan['directory'].startswith('计算机网络/')))
        self.assertIn((2022, 47), MODULE['PLANS']['IPv4']['sections']['ARP协议、DHCP协议与ICMP协议'])
        self.assertIn((2010, 47), MODULE['PLANS']['介质访问控制']['sections']['随机访问'])
        _, ip, _ = MODULE['render'](ROOT, 'IPv4', MODULE['PLANS']['IPv4'])
        self.assertIn('若 H4 向 H5 发送一个 IP 分组 P', ip)
        self.assertIn('DHCP 动态获取 IP 地址', ip)

    def test_osi_questions_follow_actually_examined_layers(self):
        for entry, owner in (((2016, 33), '网络层设备'), ((2022, 33), '数据链路层的功能')):
            locations = [title for title, plan in MODULE['PLANS'].items()
                         for entries in plan['sections'].values() if entry in entries]
            self.assertEqual(locations, [owner])
        _, text, _ = MODULE['render'](ROOT, '网络层设备', MODULE['PLANS']['网络层设备'])
        self.assertIn('2016/official-images/q33-41.png', text)

    def test_printed_subheadings_include_only_nonempty_sections(self):
        for title, plan in MODULE['PLANS'].items():
            _, text, _ = MODULE['render'](ROOT, title, plan)
            actual = [line[3:] for line in text.splitlines() if line.startswith('== ')]
            expected = ([section for section, entries in plan['sections'].items() if entries]
                        if plan.get('section_headings', True) else [])
            self.assertEqual(actual, expected, title)

    def test_complete_network_paper_coverage_through_2022(self):
        actual = set()
        samples = set()
        for plan in MODULE['PLANS'].values():
            if not plan['directory'].startswith('计算机网络/'):
                continue
            for entries in plan['sections'].values():
                for entry in entries:
                    (actual if len(entry) == 2 else samples).add(entry)
        expected = {(year, n) for year in range(2009, 2023) for n in range(33, 41)}
        expected |= {(year, 47) for year in range(2009, 2023) if year not in (2014, 2016)}
        expected |= {(2014, 42), (2014, 43), (2016, 41)}
        expected.add((2013, 15))
        expected -= MODULE['EXCLUDED_NETWORK_QUESTIONS'].keys()
        self.assertEqual(len(expected), 127)
        self.assertEqual(actual, expected)
        self.assertEqual(samples, {(2013, 7, 'sample'), (2013, 8, 'sample'), (2013, 15, 'sample')})
        self.assertEqual(list(MODULE['PLANS']['传输介质']['sections']),
                         ['双绞线、同轴电缆、光纤与无线传输介质', '物理层接口的特性'])
        original = MODULE['questions'](ROOT / '历年真题+参考解答/2013/2013.typ')[36]
        self.assertIn('#strike[HDLC协议]', original)
        self.assertIn('编注', original)
        self.assertNotIn('组帧', MODULE['PLANS'])

    def test_application_lectures_follow_syllabus_and_keep_cross_layer_questions(self):
        expected = {
            '网络应用模型': (1, ['客户/服务器（C/S）模型', '对等（P2P）模型']),
            'DNS系统': (3, ['层次域名空间', '域名服务器', '域名解析过程']),
            'FTP': (2, ['FTP协议的工作原理', '控制连接与数据连接']),
            '电子邮件': (3, ['电子邮件系统的组成结构', '电子邮件格式与MIME', 'SMTP协议与POP3协议']),
            'WWW': (5, ['WWW的概念与组成结构', 'HTTP协议']),
        }
        for title, (count, headings) in expected.items():
            plan = MODULE['PLANS'][title]
            self.assertEqual(list(plan['sections']), headings)
            _, text, actual = MODULE['render'](ROOT, title, plan)
            self.assertEqual(actual, count)
            self.assertNotIn('旧版题型示例', text)
        for entry, owner in (((2011, 47), 'WWW'), ((2021, 47), 'DNS系统')):
            locations = [title for title, plan in MODULE['PLANS'].items()
                         for entries in plan['sections'].values() if entry in entries]
            self.assertEqual(locations, [owner])
        _, dns, _ = MODULE['render'](ROOT, 'DNS系统', MODULE['PLANS']['DNS系统'])
        self.assertIn('2016/official-images/q33-41.png', dns)
        self.assertIn('若 S 的交换表结构为', dns)
        _, www, _ = MODULE['render'](ROOT, 'WWW', MODULE['PLANS']['WWW'])
        self.assertIn('题47-b图', www)
        self.assertIn('题47-d图', www)

    def test_mac_stop_wait_question_is_in_mac_collection(self):
        locations = [title for title, plan in MODULE['PLANS'].items()
                     for entries in plan['sections'].values() if (2010, 47) in entries]
        self.assertEqual(locations, ['介质访问控制'])

    def test_only_requested_lectures_exist(self):
        self.assertEqual(len(MODULE['PLANS']), 97)
        self.assertEqual(MODULE['MAX_YEAR'], 2022)

    def test_no_reserved_or_duplicate_questions(self):
        seen = set()
        for plan in MODULE['PLANS'].values():
            for ids in plan['sections'].values():
                for entry in ids:
                    year, number = entry[:2]
                    kind = entry[2] if len(entry) == 3 else 'paper'
                    # Cross-subject questions can be reused, not repeated within
                    # the same subject's lecture collections.
                    key = (plan['directory'].split('/')[0], kind, year, number)
                    self.assertLessEqual(year, 2022)
                    self.assertNotIn(key, seen)
                    seen.add(key)

    def test_generated_content_matches_original_sources(self):
        for title, plan in MODULE['PLANS'].items():
            target, content, count = MODULE['render'](ROOT, title, plan)
            self.assertEqual(target.read_text(), content)
            self.assertEqual(content.count('#question(label:'), count)
            self.assertNotIn('#missing', content)

    def test_old_examples_have_only_the_requested_label(self):
        for title in ('介质访问控制', '流量控制与可靠传输机制', '图的基本应用'):
            _, content, _ = MODULE['render'](ROOT, title, MODULE['PLANS'][title])
            self.assertIn('#question(label: n => [旧版题型示例])', content)
            self.assertNotIn('2013考纲', content)

    def test_shared_network_context_is_preserved(self):
        _, content, _ = MODULE['render'](ROOT, '介质访问控制', MODULE['PLANS']['介质访问控制'])
        self.assertIn('原卷题33～41共用下图', content)
        self.assertIn('2016/official-images/q33-41.png', content)

    def test_network_layer_scope_and_shared_context(self):
        self.assertEqual(set(MODULE['PLANS']['网络层的功能']['sections']),
                         {'异构网络互连', '路由与转发', 'SDN基本概念', '拥塞控制'})
        self.assertEqual(list(MODULE['PLANS']['IPv4']['sections']),
                         ['IPv4分组', 'IPv4地址与NAT', '子网划分、路由聚集、子网掩码与CIDR',
                          'ARP协议、DHCP协议与ICMP协议'])
        self.assertEqual(list(MODULE['PLANS']['网络层设备']['sections']),
                         ['路由器的组成和功能', '路由表与分组转发'])
        _, content, _ = MODULE['render'](ROOT, '网络层设备', MODULE['PLANS']['网络层设备'])
        self.assertIn('题42表', content)
        self.assertIn('题42图', content)
        self.assertNotIn('针对题42表中的内容，设计合理的链式存储结构', content)

    def test_routing_algorithms_keep_source_and_scope(self):
        plan = MODULE['PLANS']['路由算法']
        self.assertEqual(plan['sections']['距离-向量路由算法'],
                         [(2021, 37)])
        self.assertEqual(plan['sections']['链路状态路由算法'], [(2014, 42)])
        _, content, count = MODULE['render'](ROOT, '路由算法', plan)
        self.assertEqual(count, 2)
        self.assertIn('针对题42表中的内容，设计合理的链式存储结构', content)
        self.assertNotIn('#question(label: n => [旧版题型示例])', content)

    def test_network_questions_use_last_actual_syllabus_topic(self):
        plans = MODULE['PLANS']
        protocol = plans['路由协议']['sections']
        self.assertEqual(list(protocol), ['自治系统', '域内路由与域间路由',
                                        'RIP路由协议', 'OSPF路由协议', 'BGP路由协议'])
        self.assertEqual(protocol['RIP路由协议'], [(2010, 35), (2016, 37)])
        self.assertEqual(protocol['BGP路由协议'], [(2017, 37)])
        ip = plans['IPv4']['sections']
        self.assertIn((2018, 47), ip['子网划分、路由聚集、子网掩码与CIDR'])
        self.assertIn((2012, 33), ip['ARP协议、DHCP协议与ICMP协议'])
        device = plans['网络层设备']['sections']['路由表与分组转发']
        self.assertIn((2011, 37), device)
        self.assertIn((2019, 47), device)
        _, content, count = MODULE['render'](ROOT, '路由协议', plans['路由协议'])
        self.assertEqual(count, 3)
        self.assertIn('2016/official-images/q33-41.png', content)

    def test_graph_lectures_follow_four_syllabus_headings(self):
        titles = {'图的基本概念', '图的存储及基本操作', '图的遍历', '图的基本应用'}
        self.assertEqual({title for title, plan in MODULE['PLANS'].items()
                          if plan['directory'].startswith('数据结构/图/')}, titles)
        expected = {'图的基本概念': 5, '图的存储及基本操作': 3,
                    '图的遍历': 5, '图的基本应用': 22}
        for title, count in expected.items():
            _, _, actual = MODULE['render'](ROOT, title, MODULE['PLANS'][title])
            self.assertEqual(actual, count)
        sample_locations = [title for title, plan in MODULE['PLANS'].items()
                            for entries in plan['sections'].values()
                            if (2013, 9, 'sample') in entries]
        self.assertEqual(sample_locations, ['图的基本应用'])
        locations = [title for title, plan in MODULE['PLANS'].items()
                     for entries in plan['sections'].values() if (2014, 42) in entries]
        self.assertEqual(locations, ['路由算法'])

    def test_graph_concepts_have_no_subheadings_and_storage_owns_2011_q8(self):
        _, content, _ = MODULE['render'](ROOT, '图的基本概念', MODULE['PLANS']['图的基本概念'])
        self.assertFalse(any(line.startswith('== ') for line in content.splitlines()))
        locations = [title for title, plan in MODULE['PLANS'].items()
                     for entries in plan['sections'].values() if (2011, 8) in entries]
        self.assertEqual(locations, ['图的存储及基本操作'])

    def test_graph_subheadings_match_syllabus(self):
        self.assertEqual(list(MODULE['PLANS']['图的存储及基本操作']['sections']),
                         ['邻接矩阵', '邻接表', '邻接多重表、十字链表'])
        self.assertEqual(list(MODULE['PLANS']['图的遍历']['sections']),
                         ['深度优先搜索', '广度优先搜索'])
        self.assertEqual(list(MODULE['PLANS']['图的基本应用']['sections']),
                         ['最小（代价）生成树', '最短路径', '拓扑排序', '关键路径'])


    def test_transport_lectures_match_syllabus_and_use_only_papers(self):
        expected = {
            '传输层提供的服务': (3, ['传输层的功能', '传输层寻址与端口', '无连接服务与面向连接服务']),
            'UDP协议': (3, ['UDP数据报', 'UDP校验']),
            'TCP协议': (19, ['TCP段', 'TCP连接管理', 'TCP可靠传输', 'TCP流量控制', 'TCP拥塞控制']),
        }
        for title, (count, headings) in expected.items():
            plan = MODULE['PLANS'][title]
            self.assertEqual(list(plan['sections']), headings)
            self.assertTrue(plan['paper_only'])
            self.assertTrue(all(len(entry) == 2 for entries in plan['sections'].values() for entry in entries))
            _, text, actual = MODULE['render'](ROOT, title, plan)
            self.assertEqual(actual, count)
            self.assertNotIn('#question(label: n => [旧版题型示例])', text)
        _, text, _ = MODULE['render'](ROOT, 'TCP协议', MODULE['PLANS']['TCP协议'])
        self.assertIn('2016/official-images/q33-41.png', text)
        self.assertIn('题47-a表', text)


    def test_collections_have_no_editorial_preambles(self):
        for title, plan in MODULE['PLANS'].items():
            _, content, _ = MODULE['render'](ROOT, title, plan)
            for phrase in ('真题范围：', '本讲仅收录真题', '同时收录相关旧版题型示例',
                           '本条为考纲列项', '保留完整题干、选项及图表'):
                self.assertNotIn(phrase, content)

    def test_tcp_combined_questions_use_last_examined_topic(self):
        sections = MODULE['PLANS']['TCP协议']['sections']
        self.assertIn((2012, 47), sections['TCP可靠传输'])
        self.assertIn((2016, 41), sections['TCP拥塞控制'])
        self.assertIn((2015, 39), sections['TCP拥塞控制'])
        for entry in ((2012, 47), (2016, 41)):
            locations = [title for title, plan in MODULE['PLANS'].items()
                         for entries in plan['sections'].values() if entry in entries]
            self.assertEqual(locations, ['TCP协议'])


if __name__ == '__main__':
    unittest.main()
