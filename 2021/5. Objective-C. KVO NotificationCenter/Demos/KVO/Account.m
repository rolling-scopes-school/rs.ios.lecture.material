#import "Account.h"

@implementation Account

- (instancetype)initWithName:(double)ballance interestRate: (double)interestRate
{
    self = [super init];
    if (self) {
        _ballance = ballance;
        _interestRate = interestRate;
        _observingKeys = @[@"ballance",@"interestRate"];
    }

    return self;
}

- (void)changeWithoutNotifyingObservers:(double) interestRate balance:(double) balance {
    _ballance = balance;
    _interestRate = interestRate;
}

- (void)changeAndNotify:(double) interestRate balance:(double) balance {
    [self willChangeValueForKey:@"ballance"];
    [self willChangeValueForKey:@"interestRate"];
    _ballance = balance;
    _interestRate = interestRate;
    [self didChangeValueForKey:@"ballance"];
    [self didChangeValueForKey:@"interestRate"];
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"ballance: %f, interestRate: %f", self.ballance, self.interestRate];
}

- (void)postNotification {
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    // Emit notification
    [center postNotificationName:@"AccountChanged"object:self];
}

- (void)postQueueNotification {
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    NSNotificationQueue * queue = [[NSNotificationQueue alloc] initWithNotificationCenter:center];
    
    NSNotification * notification1 = [[NSNotification alloc] initWithName:@"AccountChanged_with_NSPostNow"
                                                                   object:self
                                                                 userInfo:nil];
    NSNotification * notification2 = [[NSNotification alloc] initWithName:@"AccountChanged_with_NSPostASAP"
                                                                   object:self
                                                                 userInfo:nil];
    NSNotification * notification3 = [[NSNotification alloc] initWithName:@"AccountChanged_with_NSPostWhenIdle"
                                                                   object:self
                                                                 userInfo:nil];
    
    [queue enqueueNotification:notification1 postingStyle:NSPostNow];
    [queue enqueueNotification:notification2 postingStyle:NSPostASAP];
    [queue enqueueNotification:notification3 postingStyle:NSPostWhenIdle];
}

@end
