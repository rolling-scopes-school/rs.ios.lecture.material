# Lecture Task
# Foundation. KVC.

## Remove Duplicate Spaces from String

- Implement a function that returns a string with any duplicated spaces replaced by one space.
**Input -> Output:**
```
@"      " -> @" "
@"one  two    three" -> @"one two three"
@"    one   two  " -> @" one two "
```

## Remove Repeated Characters from String

- Implement a function that returns a string with any repeated characters removed.
**Input -> Output:**
```
@"      " -> @" "
@"aaaa   bbbbbvvvv" -> @"a bv"
@"aabbaaavvv" -> @"abav"
```

## Longest Word

- Find the longest word in a string. (Space separator)
**Input -> Output:**
```
@"" -> nil
@"  " -> nil
@"one two three" -> @"three"
```
## Vowels

- Implement a function that returns the count of vowels in a string. 

**Input -> Output:**
```
@"a A" -> 2
@"three" -> 2
@"a  E  u  I  y o" -> 5 // y is not considered as vowel
```

## Writing/Reading **NSString** from File

- Write some text into a file using **NSString** API.
- To get the current directory path use the following:

```objc
NSFileManager.defaultManager.currentDirectoryPath
```

- Make sure the file was written. 
- Read contents of the written file using NSString API.

## Print Current Date

- Implement a function that prints the current date in format year-month-day. 
- Example: `2021-May-04`

## Print Day of the Week

- Implement a function that prints the day of the week for a given date. Follow up: return result in Russian.

```objc
// declare in NSDate category
@property (nonatomic, readonly) NSString *dayOfTheWeek;
```

## Hours Count

- Find the number of hours that have passed from March 17, 1995 to the current moment. 

```objc
- (NSUInteger)hoursFromMagicDate;
```
