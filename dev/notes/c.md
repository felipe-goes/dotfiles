# How to extract the numbers and operators from this string "12+12\*3/4" using c programming language?

To extract the numbers and operators from a string such as "12+12\*3/4" in C,
we need to parse the string character by character, distinguishing between
numeric characters and operator characters. Here's a sample code to achieve
this:

```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void extractNumbersAndOperators(const char *str) {
    int i = 0;
    int len = strlen(str);
    while (i < len) {
        // If the current character is a digit, extract the whole number
        if (isdigit(str[i])) {
            int numStart = i;
            while (i < len && isdigit(str[i])) {
                i++;
            }
            // Extract the number as a substring
            char number[20];
            strncpy(number, str + numStart, i - numStart);
            number[i - numStart] = '\0'; // Null-terminate the substring
            printf("Number: %s\n", number);
        } else if (strchr("+-*/", str[i])) {
            // If the character is an operator, simply print it
            printf("Operator: %c\n", str[i]);
            i++;
        } else {
            // Move to the next character
            i++;
        }
    }
}

int main() {
    const char *expression = "12+12*3/4";
    printf("Expression: %s\n", expression);
    extractNumbersAndOperators(expression);
    return 0;
}
```

Explanation:

1. Initialization and Looping:
   • We initialize an index i and calculate the length of the input string.
   • We loop through each character of the string.
2. Extracting Numbers:
   • If the current character is a digit, we mark the start of the number,
   then continue until we find a non-digit character.
   • Use strncpy to copy the substring representing the number into the
   number array.
   • Null-terminate the number string and print it.
3. Handling Operators:
   • If the current character is one of + , - , \* , or / , it is
   recognized as an operator. We simply print it.
4. Main Function:
   • We define and pass the expression string to the
   extractNumbersAndOperators function for processing.

This approach separates the numbers and operators and prints them
accordingly. Adjust buffer sizes and error-handling as needed for more
complex or varied inputs.

# Write a function in c programming language that try to insert a new leaf on a binary tree on the most left node otherwise go for the right node.

Certainly! Below is a C function that inserts a new leaf node into a binary
tree at the most left available position. If it finds that a left child node
is already occupied, it recursively attempts the same insert operation on
the left subtree first, then goes to the right subtree if the left subtree
is fully occupied.

Firstly, let's define the structure of a Tree Node and the function
signature:

```
#include <stdio.h>
#include <stdlib.h>

// Definition for a binary tree node.
struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

// Function to create a new tree node
struct TreeNode* createNode(int value) {
    struct TreeNode* newNode = (struct TreeNode*)malloc(sizeof(struct
                TreeNode));
    newNode->val = value;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

// Function to insert a new node in the most left position, if occupied go
to the right node
void insertLeftMost(struct TreeNode **root, int value) {
    if (*root == NULL) {
        *root = createNode(value);
    } else {
        if ((*root)->left == NULL) {
            (*root)->left = createNode(value);
        } else if ((*root)->right == NULL) {
            (*root)->right = createNode(value);
        } else {
            // Recursively try to insert in the left sub-tree
            insertLeftMost(&((*root)->left), value);
        }
    }
}

// Function to print tree inorder for testing purpose
void inOrder(struct TreeNode* node) {
    if (node == NULL)
        return;
    inOrder(node->left);
    printf("%d ", node->val);
    inOrder(node->right);
}

int main() {
    struct TreeNode *root = NULL;

    // Insert nodes in the binary tree
    insertLeftMost(&root, 1);
    insertLeftMost(&root, 2);
    insertLeftMost(&root, 3);
    insertLeftMost(&root, 4);

    // Inorder traversal of the binary tree
    printf("Inorder Traversal of the constructed binary tree is: ");
    inOrder(root);

    // Free the allocated memory (Not implemented here for simplicity's
    sake)
        // It is important to free the memory once done to avoid memory leaks.

        return 0;
}
```

## Explanation of the Code:

1. TreeNode Struct: Defines the structure of a binary tree node with an
   integer value and two child pointers ( left and right ).
2. createNode Function: Allocates memory for a new node and initializes its
   value and children to NULL .
3. insertLeftMost Function: Recursively tries to insert the new node at the
   leftmost available position.
   • Base Case: If the current root is NULL , it creates a new node and
   assigns it to the root.
   • If the left child is NULL , it inserts the new node there.
   • If the left child is occupied, it checks for the right child.
   • If both children are occupied, it recurses down the left subtree.
4. inOrder Function: For testing purposes, it performs an inorder traversal
   to print the values of the nodes in the tree.
5. main Function: Demonstrates the usage of insertLeftMost by creating a
   binary tree and then printing its inorder traversal.

This example should provide a clear understanding of the insertion logic and
the recursive approach needed to find the leftmost available spot in a
binary tree.

# Write a function in c programming language that prints the binary tree contents from bottom left up

To print a binary tree's contents from the bottom left up, we need to
perform a level order traversal in reverse. This means we'll need a queue to
process the nodes level by level, and a stack to reverse the order of nodes
after processing the levels. Here's how you can implement such a function:

```
#include <stdio.h>
#include <stdlib.h>

// Definition of the binary tree node
typedef struct Node {
    int data;
    struct Node* left;
    struct Node* right;
} Node;

// Node creation function
Node* createNode(int data) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    newNode->data = data;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// Function to print the stack elements in reverse order
void printStack(int* stack, int top) {
    for (int i = top; i >= 0; i--) {
        printf("%d ", stack[i]);
    }
}

// Function to print the binary tree contents from bottom left up
void printBottomLeftUp(Node* root) {
    if (root == NULL) {
        return;
    }

    // Maximum height of the tree will limit the queue size needed
    int maxNodes = 100;

    // Queue for level order traversal
    Node** queue = (Node**)malloc(maxNodes * sizeof(Node*));
    int front = 0, rear = 0;

    // Stack to store the nodes in reverse order
    int* stack = (int*)malloc(maxNodes * sizeof(int));
    int stackTop = -1;

    // Enqueue root
    queue[rear++] = root;

    while (front < rear) {
        // Dequeue a node from the front
        Node* current = queue[front++];

        // Push the current node's data on the stack
        stack[++stackTop] = current->data;

        // Enqueue right child first
        if (current->right != NULL) {
            queue[rear++] = current->right;
        }

        // Enqueue left child
        if (current->left != NULL) {
            queue[rear++] = current->left;
        }
    }

    // Print the stack to get the nodes from bottom left up
    printStack(stack, stackTop);

    // Free allocated memory
    free(queue);
    free(stack);
}

// Test the function
int main() {
    // Creating a binary tree
    Node* root = createNode(1);
    root->left = createNode(2);
    root->right = createNode(3);
    root->left->left = createNode(4);
    root->left->right = createNode(5);
    root->right->left = createNode(6);
    root->right->right = createNode(7);

    // Print the binary tree contents from bottom left up
    printf("Contents of the binary tree from bottom left up: ");
    printBottomLeftUp(root);

    return 0;
}
```

## Explanation:

1. Node Structure: A basic node structure with data , left , and right
   pointers is defined.
2. Queue and Stack: We use a queue for level-order traversal and a stack to
   store and print nodes in reverse order.
3. Traversal Logic:
   • Enqueue the root and process the nodes level by level.
   • For each node, we enqueue its right child first and then the left child
   to ensure that when we reverse the order using the stack, we get the
   leftmost nodes at the bottom.
4. Printing: Finally, we print the stack which contains the nodes in the
   desired order.

You might need to adjust the maximum node capacity ( maxNodes ) according to
the tree size you're working with.
