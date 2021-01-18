---
layout: post
title:  "Linked Lists"
description: "A series of nodes, each containing a data value and a link to the next node."
---

Linked lists can be thought of as arrays with a different implementation.

Each value in the list is allocated a separate space in memory, with a pointer to the next value. This way, the data structure doesn't require contiguous memory allocation. 

A linked list is by default a dynamic data structure, and compared to a static array it uses more memory to store data, but wastes less memory in unused memory allocation.

Because inserting data at the head or tail of a linked list is a constant time operation, it is commonly used to represent stacks and queues.

# Complexity Implications

Getting a value using a linked list is not as efficient as for an array. When using an array it is easy to determine where a value is (index can be calculated because of contiguous memory allocation), but for a linked list, the list must be traversed to find a value. 

## Common operations

* **Get** - O(1) Space, O(n) Time
* **Set** - O(1) Space, O(n) Time
* **Initialise** - O(n) Space Time
* **Copy** - O(n) Space Time
* **Traverse** - O(1) Space, O(n) Time
* **Insert** - O(1) Space, O(1) to O(n) Time

Insertion complexity can vary depending on implementation and place of entry. Inserting at head or tail of linked list is O(1) Space Time. If the reference to where the insert should happen is known, it is also O(1), but if not the linked list needs to be traversed to reach that point, making it O(n) time.

# Common Uses

* Stack implementation
* Queue implementation
* Graph implementation

# Example Implementation

```python
class Node:
    def __init__(self, data, next=None):
        self.data = data
        self.next = next
    
    def __repr__(self):
        return self.data
        
class LinkedList:
  
    def __init__(self, nodes=None):
      
        self.head = None
        
        if nodes:
            node = Node(data=nodes.pop(0))
            self.head = node
            for element in nodes:
                node.next = Node(data=element)
                node = node.next

		def add_first(self, node):
      	node.next = self.head
        self.head = node
        
    def add_last(self, node):
      	if not self.head:
          	self.head = node
	          return
        else:
          	for current_node in self:
              	pass
             current_node.next = node
    
    def insert_after(self, target_node_data, new_node):
      	
        if not self.head:
          	raise Exception("List is empty")
            
        for node in self:
          	if node.data == target_node_data:
              	new_node.next = node.next
                node.next = new_node
                return
        raise Exception(f"Node with data '{target_node_data}' not found")
        
    def insert_before(self, target_node_data, new_node):
      
        if not self.head:
          	raise Exception("List is empty")
            
        if self.head.data == target_node_data:
          	return self.add_first(new_node)
            
        previous_node = self.head
        for node in self:
          	if node.data == target_node_data:
              	previous_node.next = new_node
                new_node.next = node
                return
            previous_node = node
        raise Exception(f"Node with data '{target_node_data}' not found")   
    
    def remove_node(self, target_node_data):
      
				if not self.head:
          	raise Exception("List is empty")
            
        if self.head.data == target_node_data:
          	self.head = self.head.next
            return
        
        previous_node = self.head
        for node in self:
          	if node.data == target_node_data:
              	previous_node.next = node.next
                return
            previous_node = node
        raise Exception(f"Node with data '{target_node_data}' not found")
    
	  def __iter__(self):
      	node = self.head
        while node:
          	yield node
            node = node.next
    
    def __repr__(self):
      
        node = self.head
        nodes = []
        
        while node:
            nodes.append(node.data)
            node = node.next
        nodes.append('None')
        
        return '->'.join(nodes)
      
```

# Example Use

Merge two sorted linked lists and return it as a **sorted** list. The list should be made by splicing together the nodes of the first two lists.

```python
Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]
```

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

def mergeTwoLists(l1: ListNode, l2: ListNode) -> ListNode:

  	head = ListNode()
    tail = head
    
    while l1 and l2:
        if l1.val <= l2.val:
        	  tail.next = l1
            l1 = l1.next
        elif l2.val < l1.val:
            tail.next = l2
            l2 = l2.next

        tail = tail.next

     if l1: tail.next = l1
     if l2: tail.next = l2

     return head.next
```



Head being defined and unused till the end is also called a dummy node, and is a common strategy to return the linked list from the start after traversing through.

# Advantages and Disadvantages

### Advantages

* **Dynamic Data Structure** - No need to decide on memory allocation at initialisation.
* **Easy Insertion and Deletion** - Only the node and immediately surrounding nodes need to be changed, no need to shift all elements.
* **No Memory Wastage** - Memory is allocated dynamically so no empty allocation.

### Disadvantages

* **Extra Memory Useage** - Each node requires extra memory to store the reference to the next node (increases depending on the structure e.g. more for doubly linked lists).
* **Traversal** - Because memory for the entire set of data is not allocated at initialisation, there's no way to create an index and access a position by reference. The linked list must be traversed manually to get to a data point.
* **Reverse Traversal** - Difficult to traverse through a linked list backwards without implementing a doubly linked list.

# Additional Information

There are variations of linked lists: 

* A **doubly linked list** consists of nodes with two links, one to the next node and one to the previous node.
* A **circular linked list** is a type of linked list in which the last node points back to the head of the list instead of pointing to None. They are commonly used for things like keeping track of player turn in a multiplayer game, managing the application life cycle of an operating system, and implementing a Fibonaccici heap.