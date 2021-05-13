# KVO

## Observe Computed Property

- You have following class:
```objc
@interface PostAccount: NSObject 
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *streetAddress;
@property (nonatomic, copy) NSString *locality;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, assign) NSInteger postalCode;
@property (nonatomic, readonly) NSString *address; // computed property, returns string describing public interface.
- (instancetype)initWithFirstName:(NSString *)firstName
                         lastName:(NSString *)lastName
                    streetAddress:(NSString *)streetAddress
                         locality:(NSString *)locality
                       postalCode:(NSInteger)postalCode;
@end
```

- Implement observing address property. The observer should be notified when any property is changed.
- Test observing in `main` function.

## Post Notifications

- Implement class RSBroadcaster

```objc
@interface RSBroadcaster : NSObject
- (void)post;
@end
```

- Implement class Listener

```objc
@interface Listener : NSObject
@property (nonatomic, copy) NSString *name;
- (instancetype)initWithName:(NSString *)name;
- (void)handle; //  NSLog(@"%@ received notification", _name);
@end
```
- Instances of class Listener should call `handle` when instance of RSBroadcaster `post`. Example: 
```objc
RSBroadcaster *b = [RSBroadcaster new];
Listener *l1 = [[Listener alloc] initWithName:@"listener one"];
Listener *l2 = [[Listener alloc] initWithName:@"listener two"];
Listener *l3 = [[Listener alloc] initWithName:@"listener three"];
[b post];
Listener *l4 = [[Listener alloc] initWithName:@"listener four"];
[b post];
//listener one received notification
//listener two received notification
//listener three received notification
//listener one received notification
//listener two received notification
//listener three received notification
//listener four received notification
```
