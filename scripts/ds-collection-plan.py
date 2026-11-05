"""Additional DS collections, in the 2027 syllabus order.

The existing four graph collections retain their independently reviewed plan.
The 'graph' entries below must already occur there; coverage tests check this.
Whole questions are classified, never their individual subquestions.
"""

LECTURES = [
    ('数据结构的基本概念', '基本概念', ['数据结构的基本概念']),
    ('算法的基本概念', '基本概念', ['算法的基本概念']),
    ('线性表的基本概念', '线性表', ['线性表的基本概念']),
    ('线性表的实现', '线性表', ['顺序存储', '链式存储']),
    ('线性表的应用', '线性表', ['线性表的应用']),
    ('栈和队列的基本概念', '栈、队列和数组', ['栈和队列的基本概念']),
    ('栈和队列的顺序存储结构', '栈、队列和数组', ['栈和队列的顺序存储结构']),
    ('栈和队列的链式存储结构', '栈、队列和数组', ['栈和队列的链式存储结构']),
    ('多维数组的存储', '栈、队列和数组', ['多维数组的存储']),
    ('特殊矩阵的压缩存储', '栈、队列和数组', ['特殊矩阵的压缩存储']),
    ('栈、队列和数组的应用', '栈、队列和数组', ['栈、队列和数组的应用']),
    ('树的基本概念', '树与二叉树', ['树的基本概念']),
    ('二叉树', '树与二叉树', ['二叉树的定义及其主要特性', '二叉树的顺序存储结构和链式存储结构', '二叉树的遍历', '线索二叉树的基本概念和构造']),
    ('树、森林', '树与二叉树', ['树的存储结构', '森林与二叉树的转换', '树和森林的遍历']),
    ('树与二叉树的应用', '树与二叉树', ['哈夫曼（Huffman）树和哈夫曼编码', '并查集及其应用', '堆及其应用']),
    ('查找的基本概念', '查找', ['查找的基本概念']),
    ('顺序查找法', '查找', ['顺序查找法']),
    ('分块查找法', '查找', ['分块查找法']),
    ('折半查找法', '查找', ['折半查找法']),
    ('树形查找', '查找', ['二叉搜索树', '平衡二叉树', '红黑树']),
    ('B树及其基本操作、B⁺树的基本概念', '查找', ['B树及其基本操作、\\(B^+\\)树的基本概念']),
    ('散列（hash）表', '查找', ['散列（hash）表']),
    ('字符串模式匹配', '查找', ['字符串模式匹配']),
    ('查找算法的分析及应用', '查找', ['查找算法的分析及应用']),
    ('排序的基本概念', '排序', ['排序的基本概念']),
    ('直接插入排序', '排序', ['直接插入排序']),
    ('折半插入排序', '排序', ['折半插入排序']),
    ('起泡排序', '排序', ['起泡排序（bubble sort）']),
    ('简单选择排序', '排序', ['简单选择排序']),
    ('希尔排序', '排序', ['希尔排序（shell sort）']),
    ('快速排序', '排序', ['快速排序']),
    ('堆排序', '排序', ['堆排序']),
    ('二路归并排序', '排序', ['二路归并排序（merge sort）']),
    ('基数排序', '排序', ['基数排序']),
    ('外部排序', '排序', ['外部排序']),
    ('排序算法的分析与应用', '排序', ['排序算法的分析与应用']),
]

TOPICS = {
    'algorithm': ('算法的基本概念', 0),
    'linked': ('线性表的实现', 1), 'linearapp': ('线性表的应用', 0),
    'stackqueue': ('栈和队列的基本概念', 0),
    'arrayqueue': ('栈和队列的顺序存储结构', 0),
    'linkedqueue': ('栈和队列的链式存储结构', 0),
    'array': ('多维数组的存储', 0), 'matrix': ('特殊矩阵的压缩存储', 0),
    'stackapp': ('栈、队列和数组的应用', 0),
    'tree': ('树的基本概念', 0), 'binary': ('二叉树', 0),
    'binstore': ('二叉树', 1), 'traverse': ('二叉树', 2), 'threaded': ('二叉树', 3),
    'forest': ('树、森林', 1), 'forestorder': ('树、森林', 2),
    'huffman': ('树与二叉树的应用', 0), 'heap': ('树与二叉树的应用', 2),
    'bisect': ('折半查找法', 0), 'bst': ('树形查找', 0), 'avl': ('树形查找', 1),
    'btree': ('B树及其基本操作、B⁺树的基本概念', 0),
    'hash': ('散列（hash）表', 0), 'kmp': ('字符串模式匹配', 0),
    'searchanalysis': ('查找算法的分析及应用', 0),
    'binaryinsert': ('折半插入排序', 0), 'bubble': ('起泡排序', 0),
    'shell': ('希尔排序', 0), 'quick': ('快速排序', 0),
    'merge': ('二路归并排序', 0), 'radix': ('基数排序', 0),
    'external': ('外部排序', 0), 'sortanalysis': ('排序算法的分析与应用', 0),
}

# 2009 has ten DS MCQs; q11 is a COA instruction-cycle question.
YEAR_TOPICS = {
    2009: 'stackqueue stackqueue traverse avl binary forest graph btree heap merge',
    2010: 'stackqueue stackqueue threaded avl tree huffman graph graph bisect quick bubble',
    2011: 'algorithm stackqueue arrayqueue binary traverse forest bst graph hash quick heap',
    2012: 'algorithm stackapp traverse avl graph graph graph graph btree sortanalysis binaryinsert',
    2013: 'linked stackqueue avl huffman threaded bst graph graph graph btree radix',
    2014: 'algorithm stackapp arrayqueue threaded forest huffman graph hash btree shell quick',
    2015: 'stackapp traverse huffman avl graph graph bisect kmp radix heap shell',
    2016: 'linked linked stackapp matrix tree graph graph graph searchanalysis btree external',
    2017: 'algorithm stackapp matrix traverse traverse huffman graph bisect btree sortanalysis sortanalysis',
    2018: 'stackapp stackqueue matrix binary huffman bst graph btree hash shell heap',
    2019: 'algorithm forestorder huffman avl graph graph sortanalysis hash kmp quick external',
    2020: 'matrix stackqueue binstore forestorder bst graph graph graph heap btree sortanalysis',
    2021: 'linked stackqueue array forest huffman avl graph graph btree radix heap',
    2022: 'algorithm stackqueue traverse tree huffman graph graph btree hash merge sortanalysis',
}

COMPOSITES = {
    2009: {41: 'graph', 42: 'linearapp'},
    2010: {41: 'hash', 42: 'linearapp'},
    2011: {41: 'graph', 42: 'linearapp'},
    2012: {41: 'external', 42: 'linearapp'},
    2013: {41: 'linearapp', 42: 'searchanalysis'},
    # q41 computes WPL on an arbitrary given tree; no optimal Huffman tree
    # construction or encoding is examined, so it belongs to tree traversal.
    2014: {41: 'traverse'},
    2015: {41: 'linearapp', 42: 'graph'},
    2016: {42: 'tree', 43: 'quick'},
    2017: {41: 'traverse', 42: 'graph'},
    2018: {41: 'linearapp', 42: 'graph'},
    2019: {41: 'linearapp', 42: 'linkedqueue'},
    2020: {41: 'linearapp', 42: 'huffman'},
    2021: {41: 'graph', 42: 'sortanalysis'},
    2022: {41: 'bst', 42: 'sortanalysis'},
}


def plans():
    result = {title: {
        'directory': f'数据结构/{chapter}/{title}',
        'section_headings': len(leaves) > 1,
        'sections': {leaf: [] for leaf in leaves},
    } for title, chapter, leaves in LECTURES}

    def add(code, entry):
        if code == 'graph':
            return
        title, index = TOPICS[code]
        leaf = list(result[title]['sections'])[index]
        result[title]['sections'][leaf].append(entry)

    for year, codes in YEAR_TOPICS.items():
        assert len(codes.split()) == (10 if year == 2009 else 11)
        for number, code in enumerate(codes.split(), 1):
            add(code, (year, number))
        for number, code in COMPOSITES[year].items():
            add(code, (year, number))
    for plan in result.values():
        for entries in plan['sections'].values():
            entries.sort(key=lambda entry: (len(entry) == 3, entry[0], entry[1]))
    return {title: plan for title, plan in result.items()
            if any(plan['sections'].values())}


PLANS = plans()
