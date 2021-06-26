//
//  ViewController.m
//  UIElements
//
//  Created by Dzmitry Tarelkin on 3/22/20.
//  Copyright © 2020 Dzmitry Tarelkin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

// Constraints
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomContraint;

@end

// MARK: - Keyboard category
@interface ViewController (KeyboardHandling)
- (void)subscribeOnKeyboardEvents;
- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant;
- (void)hideWhenTappedAround;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Setup textView
    self.commentTextView.layer.borderWidth = 1.0;
    self.commentTextView.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.commentTextView.layer.cornerRadius = 5.0;
    self.commentTextView.contentInset = UIEdgeInsetsMake(5, 5, 5, 5);

    // Setup save button
    self.saveButton.layer.borderWidth = 1.0;
    self.saveButton.backgroundColor = UIColor.blackColor;
    [self.saveButton setTitleColor: UIColor.whiteColor forState: UIControlStateNormal];
    self.saveButton.layer.cornerRadius = self.saveButton.frame.size.height / 2;

    // Add tarrget and selection for event
    [self.saveButton addTarget:self
                        action:@selector(saveButtonTapped:)
              forControlEvents:UIControlEventTouchUpInside];

    // Setup textField button
    /*
    UIImage *image = [UIImage imageNamed:@"user-512px"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    self.usernameTextField.leftView = imageView;
    self.usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    */

    // Subscrube on keyboard events
    [self subscribeOnKeyboardEvents];
    [self hideWhenTappedAround];

    // Set delegates
    self.usernameTextField.delegate = self;
    self.commentTextView.delegate = self;
}


- (void)saveButtonTapped:(UIButton *)sender {
    NSString * text = self.usernameTextField.text;
    if (text.length >= 1) {
        self.usernameLabel.text = text;
    }
    NSLog(@"Save tapped");
}

// MARK: - Delegates

// TextField
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [self.commentTextView becomeFirstResponder];
}

// TextView
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    return ![text containsString:@"a"];
}

@end


// MARK: - Keyboard category

@implementation ViewController (KeyboardHandling)

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

- (void)hideWhenTappedAround {
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                               action:@selector(hide)];
    [self.view addGestureRecognizer:gesture];
}

- (void)hide {
    [self.view endEditing:true];
}

- (void)keybaordWillShow:(NSNotification *)notification {
    CGRect rect = [(NSValue *)notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    [self updateTopContraintWith:15.0 andBottom:rect.size.height - self.view.safeAreaInsets.bottom + 15.0];
}

- (void)keybaordWillHide:(NSNotification *)notification {
    [self updateTopContraintWith:200.0 andBottom:0.0];
}

- (void)updateTopContraintWith:(CGFloat) constant andBottom:(CGFloat) bottomConstant {
    // Change your constraint constants
    self.topContraint.constant = constant;
    self.bottomContraint.constant = bottomConstant;
    [UIView animateWithDuration:0.2 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
