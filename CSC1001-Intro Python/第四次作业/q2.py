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
    def quick_sort(self, node):
        if self.size ==0 :
            return
        elif self.size == 1:
            return self
        else:
            small = SinglyLinkedList()
            large = SinglyLinkedList()
            newElement = node.element
            newNode = node.pointer
            while newNode != None:
                if newNode.element > newElement:
                    large.insert(newNode.element)
                else :
                    small.insert(newNode.element)
                newNode = newNode.pointer
            small.quick_sort(small.head)
            large.quick_sort(large.head)
            small.insert(newElement)
            small.tail.pointer = large.head
            if large.tail != None:
                small.tail = large.tail
            self.head = small.head
            self.tail = small.tail