---
layout: post
title:  "Fundamentals"
description: "The foundational information for data structures and algorithms."
---

# Data Structures

Data structures are a way to organise and manage data. 

Data structures are: 

* a collection of data values 
* the relationships between them
* functions/operations that can be applied to the data. 

# Complexity Analysis

Complexity is way of measuring the effectiveness of an algorithm. 

There are two ways of measuring the complexity of an algorithm:

* **Time complexity** - How quickly the algorithm completes the task
* **Space complexity** - How much memory the algorithm uses

# Memory

**Memory is bounded**, hence the importance of space complexity. 

Information is stored in memory in **base 2 (binary)**.

A **bit** is a single binary number.

A **byte** is 8 bits.

An **integer** data type is typically a fixed width integer, commonly made up of 32 bits or 64 bits. 

**The bits for a single instance of data need to be stored together**, so the length of data type (for e.g. 32 bits) needs to be known in advance.

A **pointer** is the address of an instance of data in memory, allowing data to be referenced instead of stored twice.

Accessing an instance of data is a **fast operation**.

# Big O Notation

Big O Notation is a method of expressing the complexity of an algorithm, usually in the worst case scenario. It helps understand how fast the algorithm runs as the size of the input increases.

It is common when describing complexity to simplify magnitudes (for e.g. 2n can be represented as just n).

Examples (in order of magnitude):

* O(1) = **Constant time complexity** - As the input size increases, the complexity is constant
* O(log(n)) = **Log of n time complexity** - n needs to double for complexity growth to increment by 1
* O(n) = **Linear time complexity** - As the input size increases, the complexity of the algorithm increases linearly
* O(nlog(n))
* O(n²), O(n³), O(n⁴)
* O(2ⁿ) = Complexity growth doubles for 1 increment of n
* O(n!)

Common practical uses:

* Binary search - O(log n)
* Simple search - O(n)
* Quicksort - O(n * log n)
* Selection sort - O(n²)
* Traveling salesperson - O(n!)
