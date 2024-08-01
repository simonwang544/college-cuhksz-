class Node:
    # idd = 0
    def __init__(self, element, pointer):
        self.element=element
        self.pointer=pointer

class SinglyLinkedList:
    def __init__(self):
        self.head=None
        self.tail=None
        self.size=0

    def insert(self, data):
        node = Node(data, None)
        if self.size==0:
            self.head=self.tail=node
        else:
            self.tail.pointer=node
            self.tail=node
        self.size+=1
    def quick_sort(self, node):
        if self.size<=1:
            return
        L1 = SinglyLinkedList()
        L2 = SinglyLinkedList()
        key = node.element
        node = node.pointer
        while node!=None:
            if node.element <= key:
                L1.insert(node.element)
            if node.element > key:
                L2.insert(node.element)
            node = node.pointer
        L1.quick_sort(L1.head)
        L2.quick_sort(L2.head)
        L1.insert(key)
        L1.tail.pointer = L2.head
        L1.size += L2.size
        if L2.tail!=None:
            L1.tail = L2.tail
        self.head = L1.head
        self.tail = L1.tail
        self.size = L1.size
#q2的检验代码
# text2 = SinglyLinkedList()
# nums = [4, 2, 3, 1, 0, -1]
# len_nums = len(nums)
# for i in range(len_nums):
#     text2.insert(nums[i])
# text2.quick_sort(text2.head)
# node_text = text2.head
# print(node_text.element)
# while node_text.pointer != None:
#     i = i + 1
#     node_text = node_text.pointer
#     print(node_text.element)



#q1的检验代码#
#text1 = SinglyLinkedList()
#for i in range(4):
#   text1.insert(i)
#print(text1.recursive_count(text1.head))