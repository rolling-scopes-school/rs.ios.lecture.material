//
//  RSProduct.h
//  Demo2_WorkingWithDictionary
//
//  Created by Viktar Semianchuk on 2.05.21.
//

#import <Foundation/Foundation.h>

@interface RSProduct : NSObject

@property (nonatomic, copy) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;

@end
