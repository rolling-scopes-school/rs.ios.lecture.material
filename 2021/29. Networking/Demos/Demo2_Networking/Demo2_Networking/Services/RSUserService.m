//
//  RSUserService.m
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSUserService.h"
#import "RSParserProtocol.h"
#import "RSImageDownloadOperation.h"
#import "RSJSONParser.h"
#import "RSXMLParser.h"

@interface RSUserService ()

@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) id<RSParserProtocol> parser;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) NSMutableDictionary<NSString *, NSArray<NSOperation *> *> *operations;

@end

@implementation RSUserService

- (instancetype)initWithParser:(id<RSParserProtocol>)parser {
    self = [super init];
    if (self) {
        _parser = parser;
        _queue = [NSOperationQueue new];
        _operations = [NSMutableDictionary new];
    }
    return self;
}

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return _session;
}

- (void)loadUsers:(void (^)(NSArray<RSUser *> *, NSError *))completion {
    NSURL *url = [NSURL URLWithString:@"https://postman-echo.com/post"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";

    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request
                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }

        [self.parser parseUsers:data completion:completion];
        
    }];

    [dataTask resume];
}

- (void)loadImageForURL:(NSString *)url completion:(void (^)(UIImage *))completion {

    [self cancelDownloadingForUrl:url];
    RSImageDownloadOperation *operation = [[RSImageDownloadOperation alloc] initWithUrl:url];
    self.operations[url] = @[operation];
    operation.completion = ^(UIImage *image) {
        completion(image);
    };
    [self.queue addOperation:operation];
}

- (void)cancelDownloadingForUrl:(NSString *)url {
    NSArray<NSOperation *> *operations = self.operations[url];
    if (!operations) { return; }
    for (NSOperation *operation in operations) {
        [operation cancel];
    }
}

@end
