//
//  RSXMLParser.m
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSXMLParser.h"
#import "RSUser.h"

@interface RSXMLParser () <NSXMLParserDelegate>

@property (nonatomic, copy) void (^completion)(NSArray<RSUser *> *, NSError *);

@property (nonatomic, strong) NSMutableDictionary *userDictionary;
@property (nonatomic, strong) NSMutableDictionary *parsingDictionary;
@property (nonatomic, strong) NSMutableString *parsingString;
@property (nonatomic, strong) NSMutableArray *users;

@end

@implementation RSXMLParser

- (void)parseUsers:(NSData *)data completion:(void (^)(NSArray<RSUser *> *, NSError *))completion {
    self.completion = completion;
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - NSXMLParserDelegate

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    if (self.completion) {
        self.completion(nil, parseError);
    }
    [self resetParserState];
}

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    self.users = [NSMutableArray new];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"user"]) {
        self.userDictionary = [NSMutableDictionary new];
    } else if ([elementName isEqualToString:@"personInfo"] ||
               [elementName isEqualToString:@"work"]) {
        self.parsingDictionary = [NSMutableDictionary new];
    } else if ([elementName isEqualToString:@"avatarUrl"]) {
        self.parsingDictionary = [NSMutableDictionary new];
        self.parsingString = [NSMutableString new];
    } else {
        self.parsingString = [NSMutableString new];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [self.parsingString appendString:string];
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    if (self.parsingString) {
        [self.parsingDictionary setObject:self.parsingString forKey:elementName];
        self.parsingString = nil;
    }

    if ([elementName isEqualToString:@"personInfo"] ||
        [elementName isEqualToString:@"work"]) {
        [self.userDictionary setObject:self.parsingDictionary forKey:elementName];
        self.parsingDictionary = nil;
    } else if ([elementName isEqualToString:@"avatarUrl"]) {
        [self.userDictionary addEntriesFromDictionary:self.parsingDictionary];
        self.parsingDictionary = nil;
    } else if ([elementName isEqualToString:@"user"]) {
        RSUser *user = [[RSUser alloc] initWithDictionary:self.userDictionary];
        self.userDictionary = nil;
        [self.users addObject:user];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    if (self.completion) {
        self.completion(self.users, nil);
    }
    [self resetParserState];
}

#pragma mark - Private methods

- (void)resetParserState {
    self.completion = nil;
    self.users = nil;
    self.userDictionary = nil;
    self.parsingDictionary = nil;
    self.parsingString = nil;
}

@end
