#import <Foundation/Foundation.h>
#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property(nonatomic,strong) NSObject<Observable> * observable;

- (instancetype)initWith:(NSObject<Observable> *) observable;

// MARK: Subscription methods KVO
- (void)subscribeOnAccountChanges;
- (void)unsubscribeFromCurrentAccount;

// MARK: Subscription methods NSNotificationCenter
- (void)subscribeOnAccountChangesNotifications;
- (void)unsubscribeFromNotifications;

// MARK: NSNotificationQueue
- (void)subscribeOnQueueNotifications;

@end

NS_ASSUME_NONNULL_END
