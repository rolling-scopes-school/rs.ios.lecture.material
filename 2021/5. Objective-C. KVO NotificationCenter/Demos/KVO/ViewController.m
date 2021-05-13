#import "ViewController.h"
#import "Account.h"
#import "Person.h"

@interface ViewController () <UITextFieldDelegate>

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // KVO
    Account * account = [[Account alloc] initWithName:12.4 interestRate:100];
    Person * person = [[Person alloc] initWith:account];
    
    [person subscribeOnAccountChanges];
    
    // Change properties using setters
    account.interestRate = 1000.0;
    account.ballance = 0;

    // Change properties using KVC
    [account setValue:@220 forKey:@"ballance"];
    [account setValue:@12.3 forKey:@"interestRate"];

    // Change properties without notifying
    [account changeWithoutNotifyingObservers:333.3 balance:333.3];

    // Change properties using (willChange: and didChange)
    [account changeAndNotify:0.0 balance:0.0];
    
    // NSNotificationCenter (Keyboard show/hide)
    self.textField.delegate = self;
    [self subscribeOnKeyboardEvents];
    // Uncomment this to remove subscribtion
    // [self unsubscribeFromKeyboardNorifications];
    
    // NSNotificationCenter (Person/Account)
    [person subscribeOnAccountChangesNotifications];
    [account postNotification];
    
    // NSNotificationQueue
    [person subscribeOnQueueNotifications];
    // Uncomment this to remove subscribtion
    // [person unsubscribeFromNotifications];
    [account postQueueNotification];
}


- (void)subscribeOnKeyboardEvents {
    // Keyboard will show
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
    // Keyboard will hide
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keybaordWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

- (void)unsubscribeFromKeyboardNorifications {
    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)keybaordWillShow:(NSNotification *)notification {
    NSLog(@"%@",notification);
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [self updateBottomContraintWith:rect.size.height - self.view.safeAreaInsets.bottom + 5];
}

- (void)keybaordWillHide:(NSNotification *)notification {
    NSLog(@"%@",notification);
    [self updateBottomContraintWith:0.0];
}

- (void)updateBottomContraintWith:(float) constant {
    self.bottomTextFieldContraints.constant = constant;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

// MARK: UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // This force keyboard to hide when you tap on 'return' button
    [self.view endEditing:true];
    return true;
}

@end
