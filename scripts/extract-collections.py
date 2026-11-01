"""Emit an apply_patch for manually classified, source-faithful topic collections.

No file is written by this extractor. Apply --patch output with apply_patch;
--check verifies that checked-in collections still match the original papers.
"""
import argparse
import os
from pathlib import Path
import re
import runpy

MAX_YEAR = 2022
# Retain original papers, but omit questions dependent on removed syllabus items.
EXCLUDED_NETWORK_QUESTIONS = {(2013, 37): 'HDLC协议条目已从现行考纲移除'}
# Classification rule: keep each question whole and assign it to the last
# actually examined topic in syllabus order, not to background/distractor terms.
PLANS = {
    '数据链路层的功能': {
        'directory': '计算机网络/数据链路层/数据链路层的功能',
        'section_headings': False,
        'sections': {
            '数据链路层的功能': [(2022, 33)],
        },
    },
    '传输介质': {
        'directory': '计算机网络/物理层/传输介质',
        'sections': {
            '双绞线、同轴电缆、光纤与无线传输介质': [],
            '物理层接口的特性': [(2012, 34), (2018, 34)],
        },
    },
    '网络应用模型': {
        'directory': '计算机网络/应用层/网络应用模型',
        'sections': {
            '客户/服务器（C/S）模型': [],
            '对等（P2P）模型': [(2019, 40)],
        },
    },
    'DNS系统': {
        'directory': '计算机网络/应用层/DNS系统',
        'sections': {
            '层次域名空间': [],
            '域名服务器': [],
            '域名解析过程': [(2010, 40), (2016, 40), (2021, 47)],
        },
    },
    'FTP': {
        'directory': '计算机网络/应用层/FTP',
        'sections': {
            'FTP协议的工作原理': [],
            '控制连接与数据连接': [(2009, 40), (2017, 40)],
        },
    },
    '电子邮件': {
        'directory': '计算机网络/应用层/电子邮件',
        'sections': {
            '电子邮件系统的组成结构': [],
            '电子邮件格式与MIME': [],
            'SMTP协议与POP3协议': [(2012, 40), (2013, 40), (2018, 40)],
        },
    },
    'WWW': {
        'directory': '计算机网络/应用层/WWW',
        'sections': {
            'WWW的概念与组成结构': [],
            'HTTP协议': [(2011, 47), (2014, 40), (2015, 40), (2020, 40), (2022, 40)],
        },
    },
    '传输层提供的服务': {
        'directory': '计算机网络/传输层/传输层提供的服务',
        'paper_only': True,
        'sections': {
            '传输层的功能': [(2009, 33)],
            '传输层寻址与端口': [],
            '无连接服务与面向连接服务': [(2015, 33), (2018, 33)],
        },
    },
    'UDP协议': {
        'directory': '计算机网络/传输层/UDP协议',
        'paper_only': True,
        'sections': {
            'UDP数据报': [(2018, 39), (2021, 39)],
            'UDP校验': [(2014, 39)],
        },
    },
    'TCP协议': {
        'directory': '计算机网络/传输层/TCP协议',
        'paper_only': True,
        'sections': {
            'TCP段': [(2009, 38), (2013, 39), (2020, 39)],
            'TCP连接管理': [(2011, 39), (2019, 39), (2021, 38), (2022, 39)],
            'TCP可靠传输': [(2011, 40), (2019, 38), (2012, 47)],
            'TCP流量控制': [(2010, 39), (2021, 40)],
            'TCP拥塞控制': [(2009, 39), (2014, 38), (2015, 39), (2017, 39), (2020, 38), (2022, 38), (2016, 41)],
        },
    },
    '图的基本概念': {
        'directory': '数据结构/图/图的基本概念',
        'section_headings': False,
        'sections': {
            '顶点的度、边数与连通性': [(2009, 7), (2010, 7), (2017, 7), (2022, 6)],
            '图的基本性质与算法设计综合应用': [(2021, 41)],
        },
    },
    '图的存储及基本操作': {
        'directory': '数据结构/图/图的存储及基本操作',
        'sections': {
            '邻接矩阵': [(2011, 8), (2013, 7), (2015, 42)],
            '邻接表': [],
            '邻接多重表、十字链表': [],
        },
    },
    '图的遍历': {
        'directory': '数据结构/图/图的遍历',
        'sections': {
            '深度优先搜索': [(2015, 5), (2016, 6), (2020, 6)],
            '广度优先搜索': [(2012, 5), (2013, 8)],
        },
    },
    '图的基本应用': {
        'directory': '数据结构/图/图的基本应用',
        'sections': {
            '最小（代价）生成树': [(2012, 8), (2015, 6), (2017, 42), (2018, 42), (2020, 7)],
            '最短路径': [(2009, 41), (2012, 7), (2016, 8), (2021, 8), (2013, 9, 'sample')],
            '拓扑排序': [(2010, 8), (2012, 6), (2014, 7), (2016, 7), (2018, 7), (2021, 7), (2019, 6)],
            '关键路径': [(2011, 41), (2013, 9), (2019, 5), (2020, 8), (2022, 7)],
        },
    },
    '路由算法': {
        'directory': '计算机网络/网络层/路由算法',
        'sections': {
            '静态路由与动态路由': [],
            '距离-向量路由算法': [(2021, 37)],
            # OSPF is the setting here; the questions ask for an LSI data
            # structure and Dijkstra computation, not OSPF message operation.
            '链路状态路由算法': [(2014, 42)],
            '层次路由': [],
        },
    },
    'IPv4': {
        'directory': '计算机网络/网络层/IPv4',
        'sections': {
            'IPv4分组': [(2021, 36)],
            'IPv4地址与NAT': [(2016, 38), (2017, 36), (2020, 47)],
            '子网划分、路由聚集、子网掩码与CIDR': [(2010, 37), (2011, 38), (2012, 39), (2016, 39), (2017, 38), (2018, 38), (2018, 47), (2019, 37), (2021, 35), (2022, 35), (2022, 36)],
            'ARP协议、DHCP协议与ICMP协议': [(2010, 36), (2012, 33), (2012, 38), (2015, 47), (2022, 47)],
        },
    },
    '路由协议': {
        'directory': '计算机网络/网络层/路由协议',
        'sections': {
            '自治系统': [],
            '域内路由与域间路由': [],
            'RIP路由协议': [(2010, 35), (2016, 37)],
            'OSPF路由协议': [],
            # All three protocols are examined; BGP comes last in the syllabus.
            'BGP路由协议': [(2017, 37)],
        },
    },
    '网络层设备': {
        'directory': '计算机网络/网络层/网络层设备',
        'sections': {
            '路由器的组成和功能': [(2010, 38), (2012, 37), (2016, 33)],
            '路由表与分组转发': [(2009, 47), (2011, 37), (2013, 47), (2014, 43), (2015, 38), (2019, 47), (2013, 15, 'sample')],
        },
    },
    '网络层的功能': {
        'directory': '计算机网络/网络层/网络层的功能',
        'sections': {
            '异构网络互连': [],
            '路由与转发': [(2011, 33), (2021, 33)],
            'SDN基本概念': [(2022, 37)],
            '拥塞控制': [],
        },
    },
    '介质访问控制': {
        'directory': '计算机网络/数据链路层/介质访问控制',
        'sections': {
            '信道划分': [(2014, 37)],
            '随机访问': [(2009, 37), (2010, 47), (2011, 36), (2013, 36), (2015, 36), (2016, 36), (2018, 35), (2019, 36), (2020, 37), (2013, 7, 'sample')],
            '轮询访问': [],
        },
    },
    '局域网': {
        'directory': '计算机网络/数据链路层/局域网',
        'sections': {
            '局域网的基本概念与体系结构': [(2020, 35)],
            '以太网与IEEE 802.3': [(2012, 35), (2013, 34), (2018, 37), (2019, 34)],
            'IEEE 802.11无线局域网': [(2017, 35)],
            'VLAN基本概念与基本原理': [],
        },
    },
    '数据链路层设备': {
        'directory': '计算机网络/数据链路层/数据链路层设备',
        'sections': {
            '以太网交换机的工作原理': [(2009, 36), (2015, 37), (2016, 35)],
            '交换机自学习与帧转发': [(2014, 34)],
            '直通交换与转发时延': [(2013, 38)],
        },
    },
    '流量控制与可靠传输机制': {
        'directory': '计算机网络/数据链路层/流量控制与可靠传输机制',
        'sections': {
            '滑动窗口与信道利用率': [(2015, 35), (2019, 35)],
            '停止－等待协议': [(2018, 36), (2020, 36)],
            '后退N帧协议（GBN）': [(2009, 35), (2012, 36), (2014, 36), (2017, 47)],
            '选择重传协议（SR）': [(2011, 35), (2013, 8, 'sample')],
        },
    },
    '计算机网络概述': {
        'directory': '计算机网络/计算机网络概述',
        'sections': {
            '计算机网络的定义、组成与功能': [],
            '计算机网络的分类': [],
            '计算机网络的主要性能指标': [(2010, 34), (2017, 33)],
            '计算机网络分层结构': [(2010, 33)],
            '计算机网络协议、接口、服务等概念': [(2020, 33)],
            'ISO/OSI参考模型和TCP/IP参考模型': [(2013, 33), (2014, 33), (2019, 33)],
        },
    },
    '通信基础': {
        'directory': '计算机网络/物理层/通信基础',
        'sections': {
            '信道、信号、带宽、码元、波特、速率、信源与信宿等基本概念': [(2011, 34)],
            '奈奎斯特定理与香农定理': [(2016, 34), (2017, 34)],
            '编码与调制': [(2009, 34), (2014, 35), (2015, 34), (2021, 34), (2022, 34)],
            '电路交换、报文交换与分组交换': [(2013, 35)],
            '数据报与虚电路': [(2020, 34)],
        },
    },
}


PLANS.update(runpy.run_path(str(Path(__file__).with_name('os-collection-plan.py')))['PLANS'])
COA = runpy.run_path(str(Path(__file__).with_name('coa-collection-plan.py')))
PLANS.update(COA['PLANS'])
EXCLUDED_COA_QUESTIONS = COA['EXCLUDED_COA_QUESTIONS']
DS = runpy.run_path(str(Path(__file__).with_name('ds-collection-plan.py')))
PLANS.update(DS['PLANS'])


def questions(source, expected=47, command='question'):
    """Read complete top-level #question bodies, respecting strings and raw code."""
    text = source.read_text()
    result = []
    for match in re.finditer(r'^#' + re.escape(command) + r'\[', text, re.MULTILINE):
        start = i = match.end()
        depth = 1
        while i < len(text):
            c = text[i]
            if c == '\\':
                i += 2
                continue
            if text.startswith('//', i):
                end = text.find('\n', i)
                i = len(text) if end < 0 else end + 1
                continue
            if c == '`':
                ticks = len(text[i:]) - len(text[i:].lstrip('`'))
                end = text.find('`' * ticks, i + ticks)
                if end < 0:
                    raise ValueError(f'{source}: unterminated raw block')
                i = end + ticks
                continue
            if c == '"':
                i += 1
                while i < len(text):
                    if text[i] == '\\':
                        i += 2
                    elif text[i] == '"':
                        i += 1
                        break
                    else:
                        i += 1
                continue
            if c == '[':
                depth += 1
            elif c == ']':
                depth -= 1
                if depth == 0:
                    result.append(text[start:i])
                    break
            i += 1
        else:
            raise ValueError(f'{source}: unclosed question')
    if len(result) != expected:
        raise ValueError(f'{source}: expected {expected} questions, got {len(result)}')
    return result


def rebase_images(body, source, target):
    def replace(match):
        path = match.group(2)
        if path.startswith(('/', 'http:', 'https:')):
            raise ValueError(f'Unexpected image path: {path}')
        absolute = (source.parent / path).resolve()
        relative = os.path.relpath(absolute, target.parent)
        return match.group(1) + relative + '"'
    return re.sub(r'(\bimage\s*\(\s*")([^"\n]+)"', replace, body)


def render(root, title, plan):
    target = root / '分类汇编' / plan['directory'] / (title + '-题目.typ')
    template = os.path.relpath(root / 'template.typ', target.parent)
    lines = [
        '// 自动提取完整题干；分类由 scripts/extract-collections.py 人工维护。',
        f'#import "{template}": choices, subquestions, statements, inline-node',
        '#import "@preview/ezexam:0.3.1": question, answer-state',
        '#import "@preview/cetz:0.5.2" as cetz',
        '#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge',
        '#answer-state.update(false)',
        '#let emphasis = underline.with(stroke: (thickness: 0.07em, dash: (array: (0pt, 1em), phase: 0.5em), cap: "round"), offset: 0.16em)',
        f'= 分类汇编：{title.replace("／", "/")}',
        '',
    ]
    if plan['directory'].startswith('数据结构/'):
        lines += ['#let exam-diagram = diagram.with(node-stroke: 0.065em, node-fill: white, edge-stroke: 0.065em)', '']
    seen = set()
    for section, ids in plan['sections'].items():
        if not ids:
            continue
        if plan.get('section_headings', True):
            lines += [f'== {section}', '']
        for entry in ids:
            year, number = entry[:2]
            kind = entry[2] if len(entry) == 3 else 'paper'
            if kind not in ('paper', 'sample'):
                raise ValueError(f'Invalid question kind: {kind}')
            if not 2009 <= year <= MAX_YEAR or (kind, year, number) in seen:
                raise ValueError(f'Invalid/duplicate classification: {year}-{number}')
            seen.add((kind, year, number))
            if kind == 'sample':
                source = root / '题型示例' / '旧版' / '2013-题型示例.typ'
                body = questions(source, expected=15)[number - 1]
                label = '旧版题型示例'
            else:
                source = root / '历年真题+参考解答' / str(year) / f'{year}.typ'
                body = questions(source)[number - 1]
                label = f'{year} {number}'
            if year == 2014 and number == 43 and kind == 'paper':
                background = questions(source)[41].split('请回答下列问题。')[0]
                background = re.sub(r'^\s*（10分）', '', background)
                body = ('\n原卷第42题的共用背景（仅附题干与图表，不收录其小问）：\n\n'
                        + background + '\n' + body)
            if year == 2016 and kind == 'paper' and 33 <= number <= 41:
                # The original has a shared stem outside question 33.
                body = ('\n原卷题33～41共用下图，本题仍依据该图回答。\n\n'
                        '#figure(image("official-images/q33-41.png",width:29em),'
                        'caption:[2016年题33～41图],kind:image)\n' + body)
            if plan['directory'].startswith('操作系统/') and kind == 'paper':
                shared = {(2014, 45): (44,), (2017, 45): (43, 44),
                          (2018, 45): (44,), (2019, 46): (45,)}
                if (year, number) in shared:
                    stems = questions(source)
                    backgrounds = []
                    for previous in shared[year, number]:
                        background = stems[previous - 1].split('#subquestions')[0]
                        background = re.sub(r'^\s*（\d+分）', '', background)
                        background = re.sub(r'(?:请回答|根据题44图回答)[^\n]*', '', background)
                        backgrounds.append(f'原卷第{previous}题共用背景（不含小问）：\n\n' + background)
                    body = '\n' + '\n\n'.join(backgrounds) + '\n\n' + body
            if plan['directory'].startswith('计算机组成原理/') and kind == 'paper':
                shared = {(2014, 45): 44, (2015, 44): 43, (2017, 44): 43}
                if ((year, number) in shared
                        and ('paper', year, shared[year, number]) not in seen):
                    previous = shared[year, number]
                    original = questions(source)[previous - 1]
                    background = original.split('#subquestions')[0]
                    # The 2015 datapath drawing is placed inside q43's second
                    # subquestion in the source. Include the drawing alone.
                    if (year, number) == (2015, 44):
                        drawing = original[original.index('#align(center, cetz.canvas'):]
                        background += drawing.split('\n+ 控制信号SRout')[0]
                    background = re.sub(r'^\s*（\d+分）', '', background)
                    background = re.sub(r'请回答下列问题[。．]?', '', background)
                    body = (f'\n原卷第{previous}题共用背景（不含小问）：\n\n'
                            + background + '\n\n' + body)
            body = rebase_images(body, source, target)
            if title == '网络层设备' and year == 2014 and number == 43:
                # The shared LSI table and topology fit with this question on
                # a fresh page; avoid the table reaching into the footer.
                lines += ['#pagebreak(weak: true)', '']
            if (kind == 'paper' and (
                    (title == '控制器的功能和工作原理' and (year, number) in ((2015, 44), (2022, 43)))
                    or (title == '虚拟存储器' and (year, number) == (2018, 44)))):
                # Keep a large figure's opening stem on the same page as the
                # figure, rather than leaving a lone introduction at the foot.
                lines += ['#pagebreak(weak: true)', '']
            if ((plan['directory'].startswith('操作系统/') and (kind == 'sample' or number <= 40))
                    or (plan['directory'].startswith(('计算机组成原理/', '数据结构/'))
                        and ((kind == 'paper' and number <= 40)
                             or (kind == 'sample' and number <= 8)))):
                lines += [f'#block(breakable: false)[#question(label: n => [{label}])[{body}]]', '']
            elif ((title == 'WWW' and year == 2014 and number == 40)
                    or (title == '网络层设备' and year == 2015 and number == 38)
                    or (title == '介质访问控制' and year == 2020 and number == 37)):
                # Keep these short MCQs' options with their stems and tables.
                lines += [f'#block(breakable: false)[#question(label: n => [{label}])[{body}]]', '']
            elif title == '图的基本概念' and year == 2021 and number == 41:
                # This complete short algorithm-design question fits on a page;
                # keep its last one-line requirement from forming a lone page.
                lines += [f'#block(breakable: false)[#question(label: n => [{label}])[{body}]]', '']
            elif title == '图的基本应用' and kind == 'sample':
                # Keep the single-paragraph graph exercise together; long math
                # sets otherwise stretch the surrounding Chinese justification.
                lines += [f'#block(breakable: false)[#question(label: n => [{label}])[#set par(justify: false)\n{body}]]', '']
            else:
                lines += [f'#question(label: n => [{label}])[{body}]', '']
    return target, '\n'.join(lines).rstrip() + '\n', len(seen)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parent.parent)
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument('--patch', action='store_true')
    mode.add_argument('--check', action='store_true')
    args = parser.parse_args()
    root = args.root.resolve()
    if args.patch:
        print('*** Begin Patch')
    for title, plan in PLANS.items():
        target, text, count = render(root, title, plan)
        if args.check:
            if not target.exists() or target.read_text() != text:
                raise SystemExit(f'{target}: collection needs regeneration')
            print(f'{title}: {count} questions, cutoff {MAX_YEAR}')
        elif not target.exists():
            print(f'*** Add File: {target}')
            for line in text.splitlines():
                print('+' + line)
        elif target.read_text() != text:
            import difflib
            print(f'*** Update File: {target}')
            for line in list(difflib.unified_diff(target.read_text().splitlines(), text.splitlines(), n=3))[2:]:
                print('@@' if line.startswith('@@') else line)
    if args.patch:
        print('*** End Patch')


if __name__ == '__main__':
    main()
