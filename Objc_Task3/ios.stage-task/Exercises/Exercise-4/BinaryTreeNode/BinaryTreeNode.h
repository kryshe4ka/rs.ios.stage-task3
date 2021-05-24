//
//  BinaryTreeNode.h
//  ios.stage-task
//
//  Created by Liza Kryshkovskaya on 23.05.21.
//

@interface BinaryTreeNode : NSObject
    
// указатели левого и правого дочерних узлов
@property BinaryTreeNode *left;
@property BinaryTreeNode *right;
@property NSNumber*  data;

-(BinaryTreeNode *)initWithData:(NSNumber *)data andLeftNode:(BinaryTreeNode *)left andNodeRight:(BinaryTreeNode *)right;
+(BinaryTreeNode*)initWithArray:(NSMutableArray *)array;
- (int)depth;

@end
