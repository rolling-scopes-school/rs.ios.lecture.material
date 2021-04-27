# ObjC: Fundamentals

## Shapes
1. Implement **abstract class** for geometric shape with methods for computing area and perimeter. Implement concrete classes Circle, Rectangle, Triangle inherited from this class. Use **instance variable** inside class extension for storing information about figure. Take care about comparing float numbers inside `isEqual`. 
```objc
@interface Shape: NSObject
- (instancetype)init NS_UNAVAILABLE; 
- (float)area; // return 0
- (float)perimeter; // return 0
- (NSString *)description; // return string with memory address, NSStringFromClass([self class]), area, perimeter
@end

@interface Circle: Shape
// provide init with radius, validate for negative value
// provide class method for create instance
- (BOOL)isEqualToCircle:(Circle *)other;
- (BOOL)isEqual:(id)other;
@end

@interface Rectangle: Shape 
// provide init with sides, validate for negative values
// provide class method for create instance
- (BOOL)isEqualToRectangle:(Rectangle *)other;
- (BOOL)isEqual:(id)other;
@end

@interface Triangle: Shape
// provide init with sides, return nil if a >= b + c ????, validate for negative values
// provide class method for create instance
- (BOOL)isEqualToTriangle:(Triangle *)other;
- (BOOL)isEqual:(id)other;
@end

```

2. Declare **protocol** for geometric shape with methods for computing area and perimeter. Implement concrete classes Circle, Rectangle, Triangle conforms to this protocol. Use **properties** inside class extension for storing information about the figure. Take care about comparing float numbers inside `isEqual`. Example of property for Circle class: `@property float radius;`

```objc 
@protocol ShapeType <NSObject>
- (float)area;
- (float)perimeter;
@end

@interface Circle: NSObject <ShapeType>
// provide init with radius, validate for negative value
// provide class method for create instance
@end

@interface Rectangle: NSObject <ShapeType>
// provide init with sides, validate for negative values
// provide class method for create instance
@end

@interface Triangle: NSObject <ShapeType>
// provide init with sides, return nil if a >= b + c, validate for negative values
// provide class method for create instance
@end

```

3. Create separate files for headers and implementations of classes. Create main.m with main function. Test created classes inside main function. For instances of protocol classes use `id<ShapeType>`. Compile sources with clang. 
```bash
clang -f-objc-arc -framework foundation main.m Shape.m Rectangle.m Circle.m Triangle.m -o shapes
```

4. Create Makefile and test every rule inside.

```makefile
build: main.m Shape.m Rectangle.m Circle.m Triangle.m
    @clang -f-objc-arc -framework foundation main.m Shape.m Rectangle.m Circle.m Triangle.m -o shapes
run:
    @./shapes
clean:
    @rm -f ./shapes
```

```bash
make
make build
make run
make clean
```

## NSString category
1. Create Command Line Tool in XCode.
2. Make a category for NSString with the following methods and read-only properties
```objc 
- (BOOL)isEmpty; 
- (NSString *)reversed;
- (NSUInteger)wordsCount; // space and newline separator 
```
3. Test this category inside main.

## Integer Type Information

- Print out information about integer types available in Objective-C - byte count, min value, max value.
- Test behavior when integer types overflow/underflow.

## NS_ENUM

- Create `NS_ENUM` for cardinal directions - *north, east, south, and west*.
- Implement a function that accepts the enum value and returns NSString for direction.

## Pass Argument by Reference

- Implement and test function:
```objc
- (BOOL)someUsefulFunction:(NSInteger)number error:(NSError **)error;
```
- Assign different errors for number < 0 and number > 10.
 