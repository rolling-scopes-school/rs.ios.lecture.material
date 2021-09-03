//
//  RSLoader.m
//  Demo1_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSLoader.h"

@interface RSLoader ()

@property (nonatomic, strong) NSURLSession *session;

@end


@implementation RSLoader

- (NSURLSession *)session {
    if (!_session) {
        NSURLSessionConfiguration *configutation = [NSURLSessionConfiguration defaultSessionConfiguration];

        configutation.HTTPAdditionalHeaders = @{
            @"Content-Type": @"application/json",
            @"Accept": @"application/json",
            @"User-Agent": @"iPhone 11 Pro Simulator, iOS 13.5.1"
        };

        _session = [NSURLSession sessionWithConfiguration:configutation];
    }
    return _session;
}

- (void)performGetRequestForUrl:(NSString *)stringUrl
                      arguments:(NSDictionary *)arguments
                     completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:stringUrl];

    if (arguments) {
        NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray new];
        for(NSString *key in arguments.allKeys) {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:arguments[key]]];
        }
        urlComponents.queryItems = [queryItems copy];
    }

    NSURL *url = urlComponents.URL;
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithURL:url
                                                 completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            completion(nil, error);
            return;
        }

        NSError *parsingError;
        NSDictionary *dictionary = [self parseJSONDAta:data error:&parsingError];

        if (parsingError) {
            completion(nil, parsingError);
            return;
        }

        completion(dictionary, nil);
    }];
    [dataTask resume];
}

- (void)performPostRequestForUrl:(NSString *)stringUrl
                       arguments:(NSDictionary *)arguments
                      completion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *url = [NSURL URLWithString:stringUrl];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    if (arguments) {
        NSData *body = [self dataWithJSON:arguments error:nil];
        request.HTTPBody = body;
    }

    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request
                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError * error) {
        if (error) {
            completion(nil, error);
            return;
        }

        NSError *parsingError;
        NSDictionary *dictionary = [self parseJSONDAta:data error:&parsingError];

        if (parsingError) {
            completion(nil, parsingError);
            return;
        }

        completion(dictionary, nil);
    }];
    [dataTask resume];
}

#pragma mark - Private methods

- (NSDictionary *)parseJSONDAta:(NSData *)data error:(NSError **)error {
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:error];
}

- (NSData *)dataWithJSON:(NSDictionary *)jsonDict error:(NSError **)error {
    return [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:error];
}

@end
