"""Collection grouping and target metadata; no PDF compilation."""
from pathlib import Path
import re
import unicodedata


COLLECTION_SUBJECTS = {'数据结构': 'ds', '计算机组成原理': 'coa', '操作系统': 'os', '计算机网络': 'cn'}


MERGED_COLLECTIONS = {
    '操作系统的基本概念与发展历程-题目': ('操作系统的基本概念', '操作系统发展历程'),
    '物理层真题分类汇编-题目': ('通信基础', '传输介质'),
    '传输层提供的服务与UDP协议-题目': ('传输层提供的服务', 'UDP协议'),
    'FTP与电子邮件-题目': ('FTP', '电子邮件'),
    '流量控制与可靠传输机制-题目': ('数据链路层的功能', '差错控制', '流量控制与可靠传输机制'),
    'DNS系统-题目': ('网络应用模型', 'DNS系统'),
}


def collection_catalog(root, plans):
    """Describe native Nix targets and stable release names from the classification."""
    merges = MERGED_COLLECTIONS
    merged = {title: name for name, titles in merges.items() for title in titles}
    rows = {}
    for title, plan in plans.items():
        name = merged.get(title, title + '-题目')
        if name in rows:
            continue
        members = merges.get(name, (title,))
        directory = Path(plan['directory'])
        subject, chapter = directory.parts[:2]
        question = directory.parent / (name + '.pdf')
        answer = question.with_name(name.replace('-题目', '-answers') + '.pdf')
        rows[name] = dict(subject=subject, chapter=chapter, title=name.removesuffix('-题目'),
                          question=question, answer=answer, members=members)
    groups = []
    for subject, prefix in COLLECTION_SUBJECTS.items():
        normalize = lambda text: unicodedata.normalize('NFKC', text).replace(' ', '').replace('／', '/')
        syllabus = (root / '考试大纲' / (subject + '.org')).read_text()
        headings = [re.sub(r'^(?:[一二三四五六七八九十]+、|\([一二三四五六七八九十]+\))', '', normalize(line))
                    for line in re.findall(r'^\*+\s+(.+)', syllabus, re.MULTILINE)]

        def position(name):
            name = {'输入输出管理': '输入/输出(I/O)管理'}.get(name, name)
            name = normalize(name)
            return headings.index(name) if name in headings else len(headings)

        def order(row):
            topics = [topic for title in row['members'] for topic in (title, *plans[title]['sections'])]
            return position(row['chapter']), min(position(topic) for topic in topics)

        selected = sorted((r for r in rows.values() if r['subject'] == subject), key=order)
        chapters = list(dict.fromkeys(row['chapter'] for row in selected))
        numbers = {}
        for row in selected:
            chapter = row['chapter']
            numbers[chapter] = numbers.get(chapter, 0) + 1
            code = f'{prefix}-{chapters.index(chapter) + 1:02d}-{numbers[chapter]:02d}'
            row['question_name'] = code + '-questions.pdf'
            row['answer_name'] = code + '-answers.pdf'
        for row in selected:
            row['code'] = row['question_name'].removesuffix('-questions.pdf')
            heading = row['title'].replace('／', '/')
            if row['title'] == '物理层真题分类汇编':
                heading = '物理层'
            elif subject == '计算机网络' and heading != '计算机网络概述':
                heading = row['chapter'] + ' · ' + ('设备' if heading == '数据链路层设备' else heading)
            elif subject == '数据结构' and row['chapter'] == '图':
                heading = '图 · ' + heading
            row['heading'] = heading
            row['question'] = str(row['question'])
            row['answer'] = str(row['answer'])
            row['members'] = [dict(title=title, directory=plans[title]['directory'],
                                   years=sorted({entry[0] for entries in plans[title]['sections'].values() for entry in entries}),
                                   historical='（历史考点）' in title)
                              for title in row['members']]
        groups.append(dict(subject=subject, prefix=prefix, tag='collection-' + subject,
                           title=subject + '真题分类汇编', rows=selected))
    return groups
