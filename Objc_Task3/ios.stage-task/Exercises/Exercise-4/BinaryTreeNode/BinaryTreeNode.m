//
//  BinaryTreeNode.m
//  ios.stage-task
//
//  Created by Liza Kryshkovskaya on 23.05.21.
//

#import <Foundation/Foundation.h>
#import "BinaryTreeNode.h"

// Класс BinaryTreeNode представляет один узел двоичного дерева. Он содержит ссылки на левое и правое поддеревья (если поддерева нет, ссылка имеет значение null), данные узла и метод IComparable.CompareTo для сравнения узлов. Он пригодится для определения, в какое поддерево должен идти данный узел.

@implementation BinaryTreeNode

-(BinaryTreeNode *)initWithData:(NSNumber*)data andLeftNode:(BinaryTreeNode*)left andNodeRight:(BinaryTreeNode*)right {
    self = [super init];
    if (self) {
        _data = data;
        _left = left;
        _right = right;
    }
    return self;
}

+(BinaryTreeNode*)initWithArray:(NSMutableArray *)array {
    if (array.count == 0) {
        return nil;
    }
    
    if (array.firstObject == [NSNull null]) {
        [array removeObjectAtIndex:0];
        return nil;
    }
    
    NSNumber *num = array.firstObject;
    [array removeObjectAtIndex:0];
    
    BinaryTreeNode *node = [[BinaryTreeNode alloc] initWithData:num andLeftNode:[BinaryTreeNode initWithArray:array] andNodeRight:[BinaryTreeNode initWithArray:array]];
    
    return node;
}

// Нахождение глубины бинарного дерева
// Добавляем себя +1 к результатам, полученным в листьях дерева. Они продолжают складываться до тех пор, пока не произойдет выход из всех рекурсивных вызовов функции и мы не доберемся до корневого узла.
 -(int)depth {
     if (self == nil) {
         return 0;
     } else {
         int lchild = [[self left] depth];
         int rchild = [[self right] depth];
         if (lchild <= rchild) {
              return rchild+1;
         } else {
              return lchild+1;
         }
     }
 }

@end
