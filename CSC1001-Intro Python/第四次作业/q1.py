class Node:
    def __init__(self,element,pointer):
        self.element = element
        self.pointer = pointer

class SinglyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0
    def insert(self,date):
        newest = Node(date,None)
        if self.size >0:
            self.tail.pointer = newest
        else:
            self.head = newest
        self.tail = newest
        self.size = self.size +1
    def recursive_count(self,node):
        if node==None:
            return 0
        elif node.pointer==None:
            return 1
        else:
            a = self.recursive_count(node.pointer) + 1
            return a