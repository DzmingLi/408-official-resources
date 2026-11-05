"""Reviewed additions for 2023–2026 and retained historical syllabus topics.

Each token below describes a complete question, in original question order.
Backgrounds and distractors do not determine ownership. Codes refer to the
existing lecture/leaf order; new lectures keep the official syllabus wording.
"""

NEW_LECTURES = {
    '分块查找法': ('数据结构/查找/分块查找法', ['分块查找法']),
    '直接插入排序': ('数据结构/排序/直接插入排序', ['直接插入排序']),
    '操作系统结构': ('操作系统/操作系统基础/操作系统结构', ['操作系统结构']),
    '虚拟机': ('操作系统/操作系统基础/虚拟机', ['虚拟机']),
    'IPv6': ('计算机网络/网络层/IPv6', ['IPv6的主要特点', 'IPv6地址']),
    'HDLC协议（历史考点）': ('计算机网络/数据链路层/HDLC协议（历史考点）', ['HDLC协议（历史考点）']),
    'RAID（历史考点）': ('计算机组成原理/存储器层次结构/RAID（历史考点）', ['RAID（历史考点）']),
    '微指令设计（历史考点）': ('计算机组成原理/中央处理器（CPU）/微指令设计（历史考点）', ['微指令设计（历史考点）']),
}

TOPICS = {
    'seq': ('线性表的实现', 0), 'linked': ('线性表的实现', 1),
    'linearapp': ('线性表的应用', 0), 'algorithm': ('算法的基本概念', 0),
    'matrix': ('特殊矩阵的压缩存储', 0), 'stack': ('栈和队列的基本概念', 0),
    'stackapp': ('栈、队列和数组的应用', 0), 'binstore': ('二叉树', 1),
    'traverse': ('二叉树', 2), 'forest': ('树、森林', 1),
    'huffman': ('树与二叉树的应用', 0), 'heap': ('树与二叉树的应用', 2),
    'graph': ('图的基本概念', 0), 'matrixgraph': ('图的存储及基本操作', 0),
    'adjlist': ('图的存储及基本操作', 1), 'multilist': ('图的存储及基本操作', 2),
    'shortest': ('图的基本应用', 1), 'topological': ('图的基本应用', 2),
    'critical': ('图的基本应用', 3), 'bisect': ('折半查找法', 0),
    'bst': ('树形查找', 0), 'avl': ('树形查找', 1),
    'btree': ('B树及其基本操作、B⁺树的基本概念', 0),
    'hash': ('散列（hash）表', 0), 'kmp': ('字符串模式匹配', 0),
    'blocksearch': ('分块查找法', 0), 'sortanalysis': ('排序算法的分析与应用', 0),
    'quick': ('快速排序', 0), 'merge': ('二路归并排序', 0),
    'external': ('外部排序', 0), 'insert': ('直接插入排序', 0),
    'radix': ('基数排序', 0), 'shell': ('希尔排序', 0),
    'principle': ('计算机系统层次结构', 2), 'performance': ('计算机性能指标', 0),
    'integer': ('整数的表示和运算', 1), 'float': ('浮点数的表示和运算', 0),
    'floatop': ('浮点数的表示和运算', 1), 'flags': ('运算方法和运算电路', 1),
    'multiply': ('运算方法和运算电路', 2), 'connect': ('主存储器', 2),
    'interleave': ('主存储器', 1), 'address': ('寻址方式', 0),
    'datapath': ('数据通路的功能和基本结构', 0), 'control': ('控制器的功能和工作原理', 0),
    'hazard': ('指令流水线', 2), 'timing': ('总线', 2),
    'bandwidth': ('总线', 1), 'response': ('异常和中断机制', 2),
    'exceptclass': ('异常和中断机制', 1),
    'dma': ('I／O方式', 2), 'interruptio': ('I／O方式', 1),
    'paging': ('虚拟存储器', 1), 'hierarchy': ('层次化存储器的基本结构', 0),
    'isa': ('指令系统的基本概念', 0), 'execute': ('指令执行过程', 0),
    'endian': ('数据的对齐和大／小端存放方式', 0), 'risc': ('CISC和RISC的基本概念', 0),
    'pipeimpl': ('指令流水线', 1), 'mapping': ('高速缓冲存储器（Cache）', 1),
    'loop': ('高级语言程序与机器级代码之间的对应', 2),
    'structure': ('操作系统结构', 0), 'virtualmachine': ('虚拟机', 0),
    'interrupt': ('程序运行环境', 1), 'syscall': ('程序运行环境', 2),
    'mode': ('程序运行环境', 0), 'state': ('进程与线程', 1),
    'thread': ('进程与线程', 2), 'processcontrol': ('进程与线程', 3),
    'pagingos': ('内存管理基础', 2), 'partition': ('内存管理基础', 1),
    'virtual': ('虚拟内存管理', 0), 'replace': ('虚拟内存管理', 3),
    'frames': ('虚拟内存管理', 2), 'mmap': ('虚拟内存管理', 4),
    'vmperformance': ('虚拟内存管理', 5), 'demand': ('虚拟内存管理', 1),
    'schedule': ('CPU调度与上下文切换', 3), 'schedimpl': ('CPU调度与上下文切换', 2),
    'switch': ('CPU调度与上下文切换', 5), 'fileop': ('文件', 2),
    'dirop': ('目录', 2), 'free': ('文件系统', 1), 'vfs': ('文件系统', 2),
    'layout': ('文件系统', 0), 'disk': ('外存管理', 0),
    'independent': ('设备独立软件', 1), 'driver': ('I／O管理基础', 2),
    'driverinterface': ('设备独立软件', 3), 'mutex': ('同步与互斥', 0),
    'software': ('同步与互斥', 1), 'semaphore': ('同步与互斥', 3),
    'overview': ('计算机网络概述', 2), 'layers': ('计算机网络概述', 3),
    'nyquist': ('通信基础', 1), 'modulation': ('通信基础', 2),
    'switching': ('通信基础', 3), 'sr': ('流量控制与可靠传输机制', 3),
    'mac': ('介质访问控制', 1), 'crc': ('差错控制', 0),
    'ecc': ('差错控制', 1), 'nat': ('IPv4', 1), 'subnet': ('IPv4', 2),
    'dhcp': ('IPv4', 3), 'ipv6': ('IPv6', 0),
    'wireless': ('局域网', 2), 'vlan': ('局域网', 3),
    'tcpconnect': ('TCP协议', 1), 'tcpcongestion': ('TCP协议', 4),
    'udpcheck': ('UDP协议', 1), 'transportservice': ('传输层提供的服务', 2),
    'http': ('WWW', 1), 'ftp': ('FTP', 1), 'mail': ('电子邮件', 2),
    'bgp': ('路由协议', 4), 'ospf': ('路由协议', 3),
    'routingtable': ('网络层设备', 1),
}

# q1–11, q12–22, q23–32, q33–40, q41–47. These are decisions from
# reading the complete stems, including all subquestions and shared context.
YEARS = {
    2023: (
        'seq linked matrix huffman traverse shortest btree bisect hash sortanalysis quick',
        'performance integer float connect flags address datapath hazard timing response dma',
        'structure interrupt pagingos syscall state virtual schedule pagingos fileop independent',
        'overview nyquist sr mac crc nat subnet ipv6',
        'matrixgraph external paging loop software driver ftp',
    ),
    2024: (
        'linked stackapp traverse multilist bisect kmp bst quick heap merge external',
        'integer execute float multiply hierarchy paging paging hazard bandwidth interruptio dma',
        'interrupt processcontrol switch free partition thread fileop schedule driver disk',
        'overview modulation dhcp wireless sr tcpconnect udpcheck http',
        'topological hash control loop demand semaphore bgp',
    ),
    2025: (
        'algorithm stackapp binstore forest huffman graph blocksearch btree hash sortanalysis shell',
        'integer float flags endian isa risc pipeimpl control bandwidth dma exceptclass',
        'switch virtualmachine schedimpl replace frames vfs dirop mmap free disk',
        'switching ecc mac dhcp udpcheck tcpcongestion tcpconnect mail',
        'linearapp critical paging response semaphore driver subnet',
    ),
    2026: (
        'seq linked traverse forest huffman adjlist graph avl insert radix external',
        'principle integer floatop interleave isa execute mapping paging datapath isa interruptio',
        'mode interrupt thread semaphore mutex pagingos vmperformance pagingos driverinterface driver',
        'layers nyquist wireless vlan routingtable ospf subnet http',
        'bst stack loop control schedule free tcpcongestion',
    ),
}

HISTORICAL = {
    (2013, 37): 'HDLC协议（历史考点）',
    (2013, 20): 'RAID（历史考点）',
    (2012, 18): '微指令设计（历史考点）',
    (2014, 18): '微指令设计（历史考点）',
}


def extend(plans):
    for title, (directory, leaves) in NEW_LECTURES.items():
        plans[title] = dict(directory=directory, section_headings=len(leaves) > 1,
                            sections={leaf: [] for leaf in leaves})
    for year, groups in YEARS.items():
        assert [len(group.split()) for group in groups] == [11, 11, 10, 8, 7]
        for number, code in enumerate(' '.join(groups).split(), 1):
            title, index = TOPICS[code]
            leaf = list(plans[title]['sections'])[index]
            plans[title]['sections'][leaf].append((year, number))
    for entry, title in HISTORICAL.items():
        next(iter(plans[title]['sections'].values())).append(entry)
    for plan in plans.values():
        for entries in plan['sections'].values():
            entries.sort(key=lambda e: (len(e) == 3, e[0], e[1]))
