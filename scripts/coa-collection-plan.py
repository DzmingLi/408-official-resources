"""Whole COA questions classified by the 2027 syllabus, through 2022.

Only actually examined leaves count; background and distractors do not.
Keep empty syllabus leaves in this plan, but do not publish empty lectures.
"""

LECTURES = [
    ('计算机系统层次结构', '计算机系统概述', ['计算机系统的基本组成', '计算机硬件的基本结构', '计算机软件和硬件的关系', '计算机系统的工作原理']),
    ('计算机性能指标', '计算机系统概述', ['吞吐量、响应时间；CPU时钟周期、主频、CPI、CPU执行时间；MIPS、MFLOPS、GFLOPS、TFLOPS、PFLOPS、EFLOPS、ZFLOPS。']),
    ('数制与编码', '数据的表示和运算', ['进位计数制及其数据之间的相互转换', '定点数的编码表示']),
    ('运算方法和运算电路', '数据的表示和运算', ['基本运算部件', '加/减运算', '乘/除运算']),
    ('整数的表示和运算', '数据的表示和运算', ['无符号整数的表示和运算', '带符号整数的表示和运算']),
    ('浮点数的表示和运算', '数据的表示和运算', ['浮点数的表示', '浮点数的加/减运算']),
    ('存储器的分类', '存储器层次结构', ['存储器的分类']),
    ('层次化存储器的基本结构', '存储器层次结构', ['层次化存储器的基本结构']),
    ('半导体随机存取存储器', '存储器层次结构', ['SRAM存储器', 'DRAM存储器', 'Flash存储器']),
    ('主存储器', '存储器层次结构', ['DRAM芯片和内存条', '多模块存储器', '主存和CPU之间的连接']),
    ('外部存储器', '存储器层次结构', ['磁盘存储器', '固态硬盘（SSD）']),
    ('高速缓冲存储器（Cache）', '存储器层次结构', ['Cache的基本原理', 'Cache和主存之间的映射方式', 'Cache中主存块的替换算法', 'Cache写策略']),
    ('虚拟存储器', '存储器层次结构', ['虚拟存储器的基本概念', '页式虚拟存储器', '段式虚拟存储器的基本原理', '段页式虚拟存储器的基本原理']),
    ('指令系统的基本概念', '指令系统', ['指令系统的基本概念']),
    ('指令格式', '指令系统', ['指令格式']),
    ('寻址方式', '指令系统', ['寻址方式']),
    ('数据的对齐和大／小端存放方式', '指令系统', ['数据的对齐和大/小端存放方式']),
    ('CISC和RISC的基本概念', '指令系统', ['CISC和RISC的基本概念']),
    ('高级语言程序与机器级代码之间的对应', '指令系统', ['编译器、汇编器和链接器的基本概念', '选择结构语句的机器级表示', '循环结构语句的机器级表示', '过程（函数）调用对应的机器级表示']),
    ('CPU的功能和基本结构', '中央处理器（CPU）', ['CPU的功能和基本结构']),
    ('指令执行过程', '中央处理器（CPU）', ['指令执行过程']),
    ('数据通路的功能和基本结构', '中央处理器（CPU）', ['数据通路的功能和基本结构']),
    ('控制器的功能和工作原理', '中央处理器（CPU）', ['控制器的功能和工作原理']),
    ('异常和中断机制', '中央处理器（CPU）', ['异常和中断的基本概念', '异常和中断的分类', '异常和中断的检测与响应']),
    ('指令流水线', '中央处理器（CPU）', ['指令流水线的基本概念', '指令流水线的基本实现', '结构冒险、数据冒险和控制冒险的处理', '超标量和动态流水线的基本概念']),
    ('多处理器基本概念', '中央处理器（CPU）', ['SISD、SIMD、MIMD、向量处理器的基本概念', '硬件多线程的基本概念', '多核（multi-core）处理器的基本概念', '共享内存多处理器（SMP）的基本概念']),
    ('总线', '总线和输入／输出系统', ['总线的基本概念', '总线的组成及性能指标', '总线事务和定时']),
    ('I／O接口（I／O控制器）', '总线和输入／输出系统', ['I/O接口的功能和基本结构', 'I/O端口及其编址']),
    ('I／O方式', '总线和输入／输出系统', ['程序查询方式', '程序中断方式', 'DMA方式']),
]

TOPICS = {
    'principle': ('计算机系统层次结构', 3), 'binary': ('计算机系统层次结构', 1),
    'performance': ('计算机性能指标', 0),
    'flags': ('运算方法和运算电路', 1),
    'unsigned': ('整数的表示和运算', 0), 'integer': ('整数的表示和运算', 1),
    'float': ('浮点数的表示和运算', 0), 'floatop': ('浮点数的表示和运算', 1),
    'memclass': ('存储器的分类', 0), 'hierarchy': ('层次化存储器的基本结构', 0),
    'dram': ('半导体随机存取存储器', 1), 'flash': ('半导体随机存取存储器', 2),
    'module': ('主存储器', 0), 'interleave': ('主存储器', 1), 'connect': ('主存储器', 2),
    'disk': ('外部存储器', 0),
    'cache': ('高速缓冲存储器（Cache）', 0), 'mapping': ('高速缓冲存储器（Cache）', 1),
    'replace': ('高速缓冲存储器（Cache）', 2), 'write': ('高速缓冲存储器（Cache）', 3),
    'paging': ('虚拟存储器', 1),
    'isa': ('指令系统的基本概念', 0), 'format': ('指令格式', 0), 'address': ('寻址方式', 0),
    'endian': ('数据的对齐和大／小端存放方式', 0), 'risc': ('CISC和RISC的基本概念', 0),
    'compile': ('高级语言程序与机器级代码之间的对应', 0),
    'loop': ('高级语言程序与机器级代码之间的对应', 2),
    'cpu': ('CPU的功能和基本结构', 0), 'execute': ('指令执行过程', 0),
    'datapath': ('数据通路的功能和基本结构', 0), 'control': ('控制器的功能和工作原理', 0),
    'exceptclass': ('异常和中断机制', 1), 'response': ('异常和中断机制', 2),
    'pipeline': ('指令流水线', 0), 'pipeimpl': ('指令流水线', 1),
    'hazard': ('指令流水线', 2), 'superscalar': ('指令流水线', 3),
    'smp': ('多处理器基本概念', 3),
    'bus': ('总线', 0), 'bandwidth': ('总线', 1), 'timing': ('总线', 2),
    'interface': ('I／O接口（I／O控制器）', 0), 'port': ('I／O接口（I／O控制器）', 1),
    'query': ('I／O方式', 0), 'interruptio': ('I／O方式', 1), 'dma': ('I／O方式', 2),
}

# Exactly questions 12 through 22; '-' denotes an explicit exclusion below.
YEAR_TOPICS = {
    2009: 'integer floatop mapping connect address risc pipeimpl control bandwidth cache exceptclass',
    2010: 'performance integer floatop connect memclass paging cpu hazard bus interruptio module',
    2011: 'performance float memclass cpu address flags hazard execute bus interruptio query',
    2012: 'performance unsigned float endian flash replace - timing bus bus interruptio',
    2013: 'performance float integer - paging address pipeline interface - disk dma',
    2014: 'performance integer float module hazard address - bandwidth timing port interruptio',
    2015: 'principle integer floatop write paging dram interleave timing disk port response',
    2016: 'compile integer endian mapping connect address cpu hazard control timing exceptclass',
    2017: 'performance endian hierarchy address format superscalar control pipeimpl timing port interruptio',
    2018: 'binary integer float endian integer dram address flags pipeimpl timing interruptio',
    2019: 'principle integer response endian execute control hazard bandwidth disk interruptio dma',
    2020: 'cpu float endian paging address superscalar exceptclass bandwidth exceptclass interruptio dma',
    2021: 'performance integer float connect write cpu datapath bus interface response interruptio',
    2022: 'performance integer float paging mapping module isa format compile interruptio smp',
}

EXCLUDED_COA_QUESTIONS = {
    (2012, 18): '依据考纲细则变化、教材覆盖深度和后续真题推断不属现行考查范围：微指令字段直接编码计算',
    (2013, 15): '海明码已移出组成原理考纲，转入计算机网络的纠错编码',
    (2013, 20): 'RAID已从现行考纲移除',
    (2014, 18): '依据考纲细则变化、教材覆盖深度和后续真题推断不属现行考查范围：微指令下址字段位数计算',
}

COMPOSITES = {
    2009: {43: 'dma', 44: 'datapath'},
    2010: {43: 'cpu', 44: 'mapping'},
    2011: {43: 'integer', 44: 'paging'},
    2012: {43: 'dma', 44: 'hazard'},
    2013: {43: 'timing', 44: 'datapath'},
    2014: {44: 'hazard', 45: 'response'},
    2015: {43: 'control', 44: 'control'},
    2016: {44: 'interruptio', 45: 'paging'},
    2017: {43: 'floatop', 44: 'loop'},
    2018: {43: 'dma', 44: 'paging'},
    # 2019 q44 examines disk scheduling and drivers and belongs to OS only.
    2019: {45: 'response'},
    2020: {43: 'control', 44: 'write'},
    2021: {43: 'cpu', 44: 'paging'},
    2022: {43: 'control', 44: 'dma'},
}


def plans():
    result = {title: {
        'directory': f'计算机组成原理/{chapter}/{title}',
        'section_headings': len(leaves) > 1,
        'sections': {leaf: [] for leaf in leaves},
    } for title, chapter, leaves in LECTURES}

    def add(code, entry):
        title, index = TOPICS[code]
        leaf = list(result[title]['sections'])[index]
        result[title]['sections'][leaf].append(entry)

    for year, codes in YEAR_TOPICS.items():
        assert len(codes.split()) == 11
        for number, code in enumerate(codes.split(), 12):
            if code == '-':
                assert (year, number) in EXCLUDED_COA_QUESTIONS
            else:
                add(code, (year, number))
        for number, code in COMPOSITES[year].items():
            add(code, (year, number))
    add('execute', (2009, 11))
    for code, number in [('cpu', 3), ('integer', 4), ('write', 11), ('datapath', 12)]:
        add(code, (2013, number, 'sample'))
    for plan in result.values():
        for entries in plan['sections'].values():
            entries.sort(key=lambda entry: (len(entry) == 3, entry[0], entry[1]))
    return {title: plan for title, plan in result.items()
            if any(plan['sections'].values())}


PLANS = plans()
