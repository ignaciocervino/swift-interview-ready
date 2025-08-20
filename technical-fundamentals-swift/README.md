# Swift Coding Challenges

Swift implementation of coding challenges from Cracking the Coding Interview. This package provides a comprehensive test suite with visual feedback and individual problem testing capabilities.

## Getting Started

1. Clone or download the repository.
2. Navigate to the Swift project directory:
   ```bash
   cd technical-fundamentals-swift
   ```
3. Run the complete test suite:
   ```bash
   swift test
   ```

## Testing Interface

### Visual Dashboard 🎯
Get a comprehensive overview of all your test results with our visual dashboard:

```bash
./swift-dashboard.sh
```


### Run All String Problems
Execute all string-related challenges at once:

```bash
./swift-strings.sh
```

### Run All LinkedList Problems
Execute all linked list challenges at once:

```bash
./swift-linkedlist.sh
```

### Run All Stacks and Queues Problems
Execute all stack and queue challenges at once:

```bash
./swift-stacks-queues.sh
```

### Run All Trees and Graphs Problems
Execute all trees and graphs challenges at once:

```bash
./swift-trees-graphs.sh
```

### Run Individual Problems
Test specific problems by name:

```bash
  ./swift-test.sh <problem_name>
```

**Example:**
```bash
  ./swift-test.sh isUnique
```

## Available Problems

### Arrays and Strings (Problems 1-9)
1. **isUnique** - Determine if a string has all unique characters
2. **checkPermutations** - Check if one string is a permutation of another
3. **urlify** - Replace spaces with '%20' in a string
4. **palindromePermutation** - Check if string is a permutation of a palindrome
5. **oneAway** - Check if strings are one edit away
6. **stringCompression** - Compress string using counts of repeated characters
7. **rotateMatrix** - Rotate NxN matrix by 90 degrees
8. **zeroMatrix** - Set entire row and column to 0 if element is 0
9. **stringRotation** - Check if one string is a rotation of another

### Linked Lists (Problems 10-19)
10. **linkedListNode** - Node class and helper functions
11. **removeDups** - Remove duplicates from an unsorted linked list
12. **kthToLast** - Find the kth to last element of a singly linked list
13. **deleteMiddleNode** - Delete a node in the middle of the list
14. **partition** - Partition linked list around a value x
15. **sumLists** - Add two numbers represented as linked lists (reverse order)
16. **sumListsForwardOrder** - Add two numbers in forward order
17. **palindrome** - Check if a linked list is a palindrome
18. **intersection** - Determine if two linked lists intersect
19. **loopDetection** - Detect if a linked list has a loop

### Stacks and Queues (Problems 21-26)
21. **threeStacks** - Implement three stacks using a single array
22. **stackMin** - Stack with min() function that operates in O(1) time
23. **stackOfPlates** - Set of stacks that creates new stack when capacity exceeded
24. **queueViaStacks** - Implement a queue using two stacks
25. **sortStack** - Sort a stack with smallest items on top
26. **animalShelter** - Animal shelter operating on FIFO with dog/cat preferences

### Trees and Graphs (Problems 30-39)
30. **trees** - Basic tree algorithms: Depth-first search and Breadth-first search
31. **hasRouteBetweenNodes** - Find route between two nodes in directed graph
32. **minimalTree** - Create binary search tree with minimal height from sorted array
33. **listOfDepths** - Create linked list of nodes at each depth level
34. **checkBalanced** - Check if binary tree is balanced
35. **validateBST** - Validate if binary tree is a binary search tree
36. **successor** - Find in-order successor of given node in BST
37. **buildOrder** - Find build order for projects with dependencies
38. **firstCommonAncestor** - Find first common ancestor of two nodes
39. **bstSequences** - Generate all possible arrays that could create given BST

## Quick Test Commands

```bash
# Test all problems
swift test

# Test all string problems
./swift-strings.sh

# Test all linked list problems  
./swift-linkedlist.sh

# Test all stacks and queues problems
./swift-stacks-queues.sh

# Test all trees and graphs problems
./swift-trees-graphs.sh

# Test individual problems
./swift-test.sh isUnique
./swift-test.sh removeDups
./swift-test.sh threeStacks
./swift-test.sh trees
./swift-test.sh validateBST
```
