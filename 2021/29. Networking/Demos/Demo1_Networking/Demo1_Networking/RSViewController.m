//
//  RSViewController.m
//  Demo1_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSViewController.h"
#import "RSLoader.h"

@interface RSViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) RSLoader *loader;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loader = [RSLoader new];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self performLoadingWithPOSTRequest];
}

- (void)perfromLoadingWithGETRequest {
    [self.loader performGetRequestForUrl:@"https://postman-echo.com/get"
                               arguments:@{@"foo1": @"bar1", @"foo2": @"bar2"}
                              completion:^(NSDictionary *dictionary, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                self.textView.text = [NSString stringWithFormat:@"Error: %@", error];
                return;
            }

            self.textView.text = [NSString stringWithFormat:@"%@", dictionary];
        });
    }];
}

- (void)performLoadingWithPOSTRequest {
    [self.loader performPostRequestForUrl:@"https://postman-echo.com/post"
                                arguments:@{@"foo1": @"bar1", @"foo2": @"bar2"}
                               completion:^(NSDictionary *dictionary, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                self.textView.text = [NSString stringWithFormat:@"Error: %@", error];
                return;
            }

            self.textView.text = [NSString stringWithFormat:@"%@", dictionary];
        });
    }];
}

@end
