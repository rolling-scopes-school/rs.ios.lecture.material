# Blocks
# Lecture Task 

- Why you need copy blocks?

## Create under MRC:
- `__NSStackBlock__`
- `__NSMallocBlock__`
- `__NSGlobalBlock__`

- Describe capturing behaviour of block. How to change some variable inside a block?

## Incrementer

Implement function that returns block with following type: `typedef NSInteger(^IncrementerType)(void);`. 
```objc
/// Returns incrementer block
/// @param amount to increment
- (IncrementerType)makeIncrementerForIncrementAmount:(NSInteger)amount
```
Test it in following way:
```objc

IncrementerType inc = [self makeIncrementerForIncrementAmount:3];
IncrementerType inc1 = [self makeIncrementerForIncrementAmount:1];
for (int i = 0; i < 10; i++) {
    NSLog(@"by 3: %ld", (long)inc());
    NSLog(@"by 1: %ld", (long)inc1());
}
] 
// sample output
// by 3: 3
// by 1: 1
// by 3: 6
// by 1: 2
// by 3: 9
// by 1: 3
// by 3: 12
// by 1: 4
// by 3: 15
// by 1: 5
// by 3: 18
// by 1: 6
// by 3: 21
// by 1: 7
// by 3: 24
// by 1: 8
// by 3: 27
// by 1: 9
// by 3: 30
```