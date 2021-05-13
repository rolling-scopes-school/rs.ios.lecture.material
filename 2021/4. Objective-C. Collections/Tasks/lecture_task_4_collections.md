# Objective-C: Collections

## Iterate through NSArray

You have an array `@[@1, @2, @3, @4, @5]`;
- Iterate using c-style **for loop**.
- Iterate using NSEnumerator.
- Iterate using **forin**.
- Iterate using **block**.
- Iterate in reverse order using **forin**.
- Iterate dropping last/first element using **forin**.

## NSData

- Suppose that you receive data objects in chunks. Merge that data chunks into one object.

- Implement a function that receives an array of data chunks and returns merged data.

```objc
- (NSData *)mergeData:(NSArray<NSData *> *)array;
```

## Filter Array using NSPredicate

- Filter array of strings by case-insensitive contain a substring.

## NSDictionary

- Implement **class Person** with fields `firstName`, `lastName` . Make it dictionary key compliant.

## Remove Duplicates

- Implement a function that removes duplicate words from string and returns words **sorted in alphanumerical order** separated by space.

## Insertion Sort

- Implement **insertion sort** algorithm.
- Test implementation on NSNumber objects.

```objc
@interface NSArray (InsertionSort)
- (NSArray *)insertionSort;
@end
```
