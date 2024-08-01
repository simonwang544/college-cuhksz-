def HanoiTower(n):
    if n == 1:
        targetStack.append(Node('A', 'B', 'C', n))
    if n > 1 :
        targetStack.append(Node('B', 'A', 'C', n - 1))
        targetStack.append(Node('A', 'B', 'C', 1))
        targetStack.append(Node('A', 'C', 'B', n - 1))
    while len(targetStack) > 0:
        Inspect()
class Node:
    def __init__(self, A, B, C, H):
        self.a = A
        self.b = B
        self.c = C
        self.height = H
targetStack = []
def Inspect():
    newNode = targetStack.pop()
    if newNode.height == 1:
        print(newNode.a + "->" + newNode.c)
    else:
        targetStack.append(Node(newNode.b, newNode.a, newNode.c, newNode.height - 1))
        targetStack.append(Node(newNode.a, newNode.b, newNode.c, 1))
        targetStack.append(Node(newNode.a, newNode.c, newNode.b, newNode.height - 1))
n = int(input("Enter a positive integer n:"))
HanoiTower(n)