//
//  RSView.m
//  Demo
//
//  Created by Viktar Semianchuk on 3/17/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSView.h"

@implementation RSView

-(instancetype)initWithFrame:(CGRect)frame andColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = color;
    }
    return self;
}

@end
