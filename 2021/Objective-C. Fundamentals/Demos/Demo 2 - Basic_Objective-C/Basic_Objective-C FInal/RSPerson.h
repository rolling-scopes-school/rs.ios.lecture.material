#import <Foundation/Foundation.h>

@interface RSPerson: NSObject  {
    NSString *_name;
}

- (instancetype)initWithName:(NSString *)name;
- (void)sayHello;

@end