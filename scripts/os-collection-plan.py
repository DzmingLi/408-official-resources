"""Manually classified OS questions, in the 2027 syllabus order.

Codes below name syllabus leaves, not keywords. Whole questions belong to the
last genuinely examined leaf; shared paper backgrounds are added by renderer.
"""

# (lecture, chapter, ordered syllabus leaves)
LECTURES = [
    ('操作系统的基本概念', '操作系统基础', ['操作系统的基本概念']),
    ('操作系统发展历程', '操作系统基础', ['操作系统发展历程']),
    ('程序运行环境', '操作系统基础', ['CPU运行模式', '中断和异常的处理', '系统调用', '程序的链接与装入', '程序运行时的内存映像与地址空间']),
    ('操作系统引导', '操作系统基础', ['操作系统引导']),
    ('进程与线程', '进程管理', ['进程与线程的基本概念', '进程/线程的状态与转换', '线程的实现', '进程与线程的组织与控制', '进程间通信']),
    ('CPU调度与上下文切换', '进程管理', ['调度的基本概念', '调度的目标', '调度的实现', 'CPU调度算法', '多处理机调度', '上下文及其切换机制']),
    ('同步与互斥', '进程管理', ['同步与互斥的基本概念', '基本的实现方法', '锁', '信号量', '条件变量', '经典同步问题']),
    ('死锁', '进程管理', ['死锁的基本概念', '死锁预防', '死锁避免', '死锁检测和解除']),
    ('内存管理基础', '内存管理', ['内存管理的基本概念', '连续分配管理方式', '页式管理', '段式管理', '段页式管理']),
    ('虚拟内存管理', '内存管理', ['虚拟内存的基本概念', '请求页式管理', '页框分配与回收', '页置换算法', '内存映射文件（memory-mapped files）', '虚拟存储器性能的影响因素及改进方法']),
    ('文件', '文件管理', ['文件的基本概念', '文件元数据和索引节点（inode）', '文件的操作', '文件的保护', '文件的逻辑结构', '文件的物理结构']),
    ('目录', '文件管理', ['目录的基本概念', '树形目录', '目录的操作', '硬链接和软链接']),
    ('文件系统', '文件管理', ['文件系统的全局结构（layout）', '外存空闲空间管理方法', '虚拟文件系统', '文件系统挂载（mounting）']),
    ('I／O管理基础', '输入输出管理', ['设备', 'I/O控制方式', 'I/O软件层次结构', '输入/输出应用程序接口']),
    ('设备独立软件', '输入输出管理', ['缓冲区管理', '设备分配与回收', '假脱机技术（SPOOLing）', '设备驱动程序接口']),
    ('外存管理', '输入输出管理', ['磁盘', '固态硬盘']),
]

# Explicit topic decisions, reviewed against the complete paper stems.
TOPICS = {
    'basic': ('操作系统的基本概念', 0), 'history': ('操作系统发展历程', 0),
    'mode': ('程序运行环境', 0), 'interrupt': ('程序运行环境', 1),
    'syscall': ('程序运行环境', 2), 'link': ('程序运行环境', 3),
    'boot': ('操作系统引导', 0),
    'process': ('进程与线程', 0), 'state': ('进程与线程', 1),
    'thread': ('进程与线程', 2), 'control': ('进程与线程', 3),
    'ipc': ('进程与线程', 4),
    'sched': ('CPU调度与上下文切换', 2), 'algorithm': ('CPU调度与上下文切换', 3),
    'switch': ('CPU调度与上下文切换', 5),
    'mutex': ('同步与互斥', 0), 'software': ('同步与互斥', 1),
    'semaphore': ('同步与互斥', 3), 'condition': ('同步与互斥', 4),
    'classic': ('同步与互斥', 5),
    'deadlock': ('死锁', 0), 'prevent': ('死锁', 1),
    'avoid': ('死锁', 2), 'detect': ('死锁', 3),
    'memory': ('内存管理基础', 0), 'partition': ('内存管理基础', 1),
    'paging': ('内存管理基础', 2), 'segment': ('内存管理基础', 3),
    'virtual': ('虚拟内存管理', 0), 'demand': ('虚拟内存管理', 1),
    'frames': ('虚拟内存管理', 2), 'replace': ('虚拟内存管理', 3),
    'performance': ('虚拟内存管理', 5),
    'inode': ('文件', 1), 'fileop': ('文件', 2), 'protect': ('文件', 3),
    'physical': ('文件', 5),
    'tree': ('目录', 1), 'dirop': ('目录', 2), 'links': ('目录', 3),
    'layout': ('文件系统', 0), 'free': ('文件系统', 1),
    'io': ('I／O管理基础', 1), 'driver': ('I／O管理基础', 2),
    'buffer': ('设备独立软件', 0), 'independent': ('设备独立软件', 1),
    'spool': ('设备独立软件', 2), 'disk': ('外存管理', 0),
}

# First ten entries correspond exactly to paper questions 23 through 32.
YEAR_TOPICS = {
    2009: 'basic algorithm prevent memory segment physical disk protect links independent',
    2010: 'syscall control semaphore algorithm software partition paging physical tree interrupt',
    2011: 'algorithm mode process driver avoid demand performance link buffer mutex',
    2012: 'mode interrupt virtual driver avoid syscall algorithm sched process disk',
    2013: 'dirop physical driver physical buffer syscall boot demand algorithm avoid',
    2014: 'algorithm prevent mode state free performance fileop replace ipc paging',
    2015: 'interrupt mode state detect replace buffer physical frames free disk',
    2016: 'history algorithm deadlock replace software segment frames mutex spool condition',
    2017: 'algorithm syscall partition physical sched history disk protect links io',
    2018: 'basic switch mutex avoid state condition interrupt disk disk semaphore',
    2019: 'thread state syscall free algorithm segment replace detect paging partition',
    2020: 'fileop physical interrupt algorithm avoid performance process independent inode mutex',
    2021: 'mode control algorithm disk sched replace paging dirop prevent syscall',
    2022: 'history boot algorithm avoid mode state demand performance syscall driver',
}

COMPOSITES = {
    2009: {45: 'classic', 46: 'performance'},
    2010: {45: 'disk', 46: 'replace'},
    2011: {45: 'classic', 46: 'physical'},
    2012: {45: 'frames', 46: 'physical'},
    2013: {45: 'semaphore', 46: 'paging'},
    2014: {45: 'demand', 46: 'physical', 47: 'classic'},
    2015: {45: 'classic', 46: 'paging'},
    2016: {45: 'performance', 46: 'algorithm', 47: 'physical'},
    2017: {45: 'demand', 46: 'semaphore'},
    2018: {45: 'replace', 46: 'physical'},
    2019: {43: 'classic', 44: 'disk', 46: 'paging'},
    2020: {45: 'semaphore', 46: 'demand'},
    2021: {45: 'semaphore', 46: 'disk'},
    2022: {45: 'physical', 46: 'semaphore'},
}


def plans():
    result = {title: {
        'directory': f'操作系统/{chapter}/{title.replace("/", "")}',
        'section_headings': len(leaves) > 1,
        'sections': {leaf: [] for leaf in leaves},
    } for title, chapter, leaves in LECTURES}

    def add(code, entry):
        title, index = TOPICS[code]
        leaf = list(result[title]['sections'])[index]
        result[title]['sections'][leaf].append(entry)

    for year, codes in YEAR_TOPICS.items():
        assert len(codes.split()) == 10
        for number, code in enumerate(codes.split(), 23):
            add(code, (year, number))
        for number, code in COMPOSITES[year].items():
            add(code, (year, number))
    for code, number in [('state', 5), ('prevent', 6), ('replace', 13), ('classic', 14)]:
        add(code, (2013, number, 'sample'))
    for plan in result.values():
        for entries in plan['sections'].values():
            entries.sort(key=lambda entry: (len(entry) == 3, entry[0], entry[1]))
    return result


PLANS = plans()
