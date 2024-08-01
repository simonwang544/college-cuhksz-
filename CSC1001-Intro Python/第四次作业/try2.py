class CalcNode:
    def __init__(self, aa, bb, cc, hh):
        self.a = aa
        self.b = bb
        self.c = cc
        self.height = hh
targetStack = []
def Inspect():
    nowCalc = targetStack.pop()
    if nowCalc.height == 1:
        print(nowCalc.a + "->" + nowCalc.c)
    else:
        targetStack.append(CalcNode(nowCalc.b, nowCalc.a, nowCalc.c, nowCalc.height - 1))
        targetStack.append(CalcNode(nowCalc.a, nowCalc.b, nowCalc.c, 1))
        targetStack.append(CalcNode(nowCalc.a, nowCalc.c, nowCalc.b, nowCalc.height - 1))
def Hanoi(n):
    if n == 1:
        targetStack.append(CalcNode('A', 'B', 'C', n))
    else:
        targetStack.append(CalcNode('B', 'A', 'C', n - 1))
        targetStack.append(CalcNode('A', 'B', 'C', 1))
        targetStack.append(CalcNode('A', 'C', 'B', n - 1))

    while len(targetStack) > 0:
        Inspect()
Hanoi(5)
