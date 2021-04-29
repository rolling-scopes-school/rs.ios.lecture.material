# Objective-C. Memory Management. MRC. ARC. Autorelease Pool

## Reference Cycles
- Recreate situation where **retain cycle** occurs. Make sure that objects are not deallocated. For this purpose implement `dealloc` method.

## Object Deallocation
- Find ways to determine if an object of class `NSString` created by calling method `stringWithFormat:` was deallocated. What about strings that are created with **literal syntax**?

## Delegate Pattern

- Implement delegate pattern for following protocol. Take care of reference cycles. **(MRC and ARC)**
- As an example object will call the delegate method inside some property setter. Test calling delegate method and that objects are properly deallocated.

```objc
@protocol DelegateType <NSObject>
- (void)delegateMethod;
@end
```

## Property Attributes

- Provide implemetation of getter and setter for properties under **MRC**:
```objc
@property (nonatomic, retain) id object1;
@property (nonatomic) id object2;
@property (nonatomic, copy) NSMutableArray *array;
@property (atomic, retain) NSNumber *number;
@property NSUInteger balance;
```

## Binary Tree Data Structure
- Design **binary tree** for integer values under **MRC**.
```objc
@interface TreeNode : NSObject 
// property of type NSInteger
// property for left node
// property for right node
// init with value
// class method for creating instance with value
@end
```
- Provide description method, which prints preorder traversal of the tree.

- Design **binary tree** for generic values under **MRC**.
```objc
@interface TreeNode<Item> : NSObject 
// similar interface to node with integer value
@end
```
