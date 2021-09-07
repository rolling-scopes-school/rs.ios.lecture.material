//
//  RSStudentFormViewController.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSStudentFormViewController.h"
#import "RSStudent.h"
#import "SQLiteManager.h"

@interface RSStudentFormViewController ()

@property (nonatomic, copy) void(^completion)(RSStudent *);
@property (nonatomic, strong) RSStudent *student;

@property (nonatomic, strong) UITextField *firstNameTextField;
@property (nonatomic, strong) UITextField *lastNameTextField;
@property (nonatomic, strong) UITextField *locationTextField;
@property (nonatomic, strong) UITextField *progressTextField;
@property (nonatomic, strong) UITextField *mentorTextField;

@end

@implementation RSStudentFormViewController

- (instancetype)initWithStudent:(RSStudent *)student completion:(void (^)(RSStudent *))completion {
    self = [super init];
    if (self) {
        _firstNameTextField = [UITextField new];
        _lastNameTextField = [UITextField new];
        _locationTextField = [UITextField new];
        _progressTextField = [UITextField new];
        _mentorTextField = [UITextField new];

        if (student) {
            _firstNameTextField.text = student.firstName;
            _lastNameTextField.text = student.lastName;
            _locationTextField.text = student.location;
            _progressTextField.text = [NSString stringWithFormat:@"%.2f", student.progress];
            _mentorTextField.text = [NSString stringWithFormat:@"%lu", student.mentor.mentorId];
            _student = student;
        }

        _completion = [completion copy];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

#pragma mark - Handlers

- (void)doneTapped {
    NSString *firstName = self.firstNameTextField.text;
    NSString *lastName = self.lastNameTextField.text;
    NSString *location = self.locationTextField.text;
    NSString *progress = self.progressTextField.text;
    NSString *mentorId = self.mentorTextField.text;

    RSStudent *student = [[RSStudent alloc] initWithId:self.student ? self.student.studentId : 0
                                             firstName:firstName
                                              lastName:lastName
                                              location:location
                                              progress:[progress doubleValue]
                                                mentor:[[RSMentor alloc] initWithId:[mentorId integerValue]
                                                                          firstName:self.student.mentor.firstName
                                                                           lastName:self.student.mentor.lastName]];

    [self dismissViewControllerAnimated:YES completion:^{
        if (self.completion) {
            self.completion(student);
        }
    }];
}

- (void)closeTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private methods

- (void)setupViews {
    self.view.backgroundColor = UIColor.whiteColor;

    self.title = @"Student form";

    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"xmark.circle"]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(closeTapped)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"checkmark.circle"]
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(doneTapped)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;

    [self setupControls];
}

- (void)setupControls {

    UIScrollView *scrollView = [UIScrollView new];
    scrollView.bounces = YES;
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:scrollView];
    [NSLayoutConstraint activateConstraints:@[
        [scrollView.frameLayoutGuide.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [scrollView.frameLayoutGuide.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [scrollView.frameLayoutGuide.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [scrollView.frameLayoutGuide.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];

    UIView *containerView = [UIView new];
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addSubview:containerView];
    [NSLayoutConstraint activateConstraints:@[
        [containerView.leadingAnchor constraintEqualToAnchor:scrollView.contentLayoutGuide.leadingAnchor],
        [containerView.topAnchor constraintEqualToAnchor:scrollView.contentLayoutGuide.topAnchor],
        [containerView.trailingAnchor constraintEqualToAnchor:scrollView.contentLayoutGuide.trailingAnchor],
        [containerView.bottomAnchor constraintEqualToAnchor:scrollView.contentLayoutGuide.bottomAnchor],
        [containerView.widthAnchor constraintEqualToAnchor:scrollView.widthAnchor]
    ]];

    UIStackView *commonStackView = [[UIStackView alloc] init];
    commonStackView.axis = UILayoutConstraintAxisVertical;
    commonStackView.spacing = 20.0;
    commonStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [containerView addSubview:commonStackView];
    [NSLayoutConstraint activateConstraints:@[
        [commonStackView.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor constant:20.0],
        [commonStackView.topAnchor constraintEqualToAnchor:containerView.topAnchor constant:20.0],
        [commonStackView.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor constant:-20.0],
        [commonStackView.bottomAnchor constraintEqualToAnchor:containerView.bottomAnchor constant:-20.0],
    ]];


    UIStackView *namesStackView = [[UIStackView alloc] init];
    namesStackView.distribution = UIStackViewDistributionFillEqually;
    namesStackView.spacing = 20.0;
    namesStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [commonStackView addArrangedSubview:namesStackView];

    self.firstNameTextField.placeholder = @"First name";
    [self setupTextField:self.firstNameTextField];
    self.lastNameTextField.placeholder = @"Last name";
    [self setupTextField:self.lastNameTextField];
    [namesStackView addArrangedSubview:self.firstNameTextField];
    [namesStackView addArrangedSubview:self.lastNameTextField];

    self.locationTextField.placeholder = @"Location";
    [self setupTextField:self.locationTextField];
    [commonStackView addArrangedSubview:self.locationTextField];

    self.progressTextField.placeholder = @"Progess (0...1)";
    self.progressTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self setupTextField:self.progressTextField];
    [commonStackView addArrangedSubview:self.progressTextField];

    self.mentorTextField.placeholder = @"Mentor ID";
    self.mentorTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self setupTextField:self.mentorTextField];
    [commonStackView addArrangedSubview:self.mentorTextField];

    [NSLayoutConstraint activateConstraints:@[
        [self.firstNameTextField.heightAnchor constraintEqualToConstant:50.0],
        [self.lastNameTextField.heightAnchor constraintEqualToConstant:50.0],
        [self.locationTextField.heightAnchor constraintEqualToConstant:50.0],
        [self.progressTextField.heightAnchor constraintEqualToConstant:50.0],
        [self.mentorTextField.heightAnchor constraintEqualToConstant:50.0],
    ]];
}

- (void)setupTextField:(UITextField *)textField {
    textField.layer.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:234.0/255.0 alpha:200.0/255.0].CGColor;
    textField.layer.cornerRadius = 8.0;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 20.0, 0.0)];
    leftView.backgroundColor = UIColor.clearColor;
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;

}

@end
