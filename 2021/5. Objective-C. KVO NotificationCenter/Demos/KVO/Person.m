#import "Person.h"

static void * PersonObservingDetailsContext = &PersonObservingDetailsContext;

@implementation Person

- (instancetype)initWith:(NSObject<Observable> *) observable {
    self = [super init];
       if (self) {
           _observable = observable;
       }
       return self;
}

- (void)subscribeOnAccountChanges {
    for (NSString* keypath in self.observable.observingKeys) {
         [self.observable addObserver: self forKeyPath:keypath
                              options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                              context: &PersonObservingDetailsContext];
    }
}

- (void)unsubscribeFromCurrentAccount {
    for (NSString* keypath in self.observable.observingKeys) {
        [self.observable removeObserver: self forKeyPath:keypath];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if (context == PersonObservingDetailsContext) {
        if ([keyPath isEqualToString:@"ballance"]) {
            NSLog(@"The ballance was changed.");
            NSLog(@"%@", change);
        }
        if ([keyPath isEqualToString:@"interestRate"]) {
            NSLog(@"The interestRate was changed.");
            NSLog(@"%@", change);
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)subscribeOnAccountChangesNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(observeAccountNotifications:)
                                                 name:@"AccountChanged"
                                               object:nil];
}

- (void)subscribeOnQueueNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(observeQueueNotification:)
                                                 name:@"AccountChanged_with_NSPostNow"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(observeQueueNotification:)
                                                 name:@"AccountChanged_with_NSPostASAP"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(observeQueueNotification:)
                                                    name:@"AccountChanged_with_NSPostWhenIdle"
                                                  object:nil];
}

- (void)unsubscribeFromNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)observeAccountNotifications:(NSNotification *) notification {
    NSLog(@"Notification %@", notification);
}

- (void)observeQueueNotification:(NSNotification *) notification {
    NSLog(@"Current Thread %@",NSThread.currentThread);
    NSLog(@"Queue notification %@", notification);
}

@end
