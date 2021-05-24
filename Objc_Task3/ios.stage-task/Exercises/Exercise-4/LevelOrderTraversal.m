#import "LevelOrderTraversal.h"
#import "BinaryTreeNode/BinaryTreeNode.h"

BOOL printLevel(BinaryTreeNode *root, int level, NSMutableArray * obj) {
        
    // base case
            if (root == nil) {
                return NO;
            }
     
            if (level == 1)
            {
                //NSLog(@"%@", root.data);
                [obj addObject:root.data];
     
                // return true if at least one node is present at a given level
                return YES;
            }
     
            BOOL left = printLevel([root left], level - 1, obj);
            BOOL right = printLevel([root right], level - 1, obj);
     
            return left || right;
    return YES;
}

// Function to "print"(add to array) level order traversal of a given binary tree
NSMutableArray<NSMutableArray*>* levelOrderTraversal(BinaryTreeNode * root) {
    
    NSMutableArray<NSMutableArray*>* resultArray = [NSMutableArray new];
    NSMutableArray * obj = [NSMutableArray new];
    // start from level 1 — till the height of the tree
    int level = 1;
    // run till `printLevel()` returns false
    while (printLevel(root, level, obj)) {
        [resultArray addObject:obj];
        obj = [NSMutableArray new];
        level++;
    }
    return resultArray;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    if (tree == nil || tree.count == 0 || (tree.firstObject == [NSNull null])) {
            return @[];
    }
    
    BinaryTreeNode* newTree = [BinaryTreeNode initWithArray:[tree mutableCopy]];
    
    //высчитываем глубину дерева, она не пригодилась, но удалять жалко, раз уж работает
    //int count = [newTree depth];
    
    // Given a binary tree, "print"(add to array) its nodes level by level, i.e., "print" all nodes of level 1 first, followed by nodes of level 2 and so on… "Print" nodes for any level from left to right.
    return levelOrderTraversal(newTree);
}
