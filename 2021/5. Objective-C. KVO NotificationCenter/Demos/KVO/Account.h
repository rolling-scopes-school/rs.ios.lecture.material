#import <Foundation/Foundation.h>

@protocol Observable <NSObject>
@required
@property(readonly, nonatomic) NSArray<NSString*> * observingKeys;

@end

@interface Account : NSObject <Observable>

@property (nonatomic, assign) double ballance;
@property (nonatomic, assign) double interestRate;
@property (readonly, nonatomic) NSArray<NSString*> * observingKeys;

- (instancetype)initWithName:(double)ballance interestRate: (double)interestRate;

// MARK: Force notify Using willChange: didChange:
- (void)changeWithoutNotifyingObservers:(double) interestRate balance:(double) balance;
- (void)changeAndNotify:(double) interestRate balance:(double) balance;

// MARK: Account Notifications
- (void)postNotification;
- (void)postQueueNotification;
@end
