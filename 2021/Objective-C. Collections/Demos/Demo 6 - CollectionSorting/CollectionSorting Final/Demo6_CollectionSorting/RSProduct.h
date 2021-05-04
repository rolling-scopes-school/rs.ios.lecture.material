//
//  RSProduct.h
//  Demo6_CollectionSorting
//
//  Created by Viktar Semianchuk on 2.05.21.
//

#import <Foundation/Foundation.h>

@interface RSProduct : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSUInteger count;

- (instancetype)initWithTitle:(NSString *)title andCount:(NSUInteger)count;
@end
