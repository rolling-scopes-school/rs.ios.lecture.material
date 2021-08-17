//
//  RSFilterOperation.m
//  TaskAddingDemo
//
//  Created by Victor Semenchuk on 6/8/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSFilterOperation.h"
#import "RSOperation.h"

@implementation RSFilterOperation

- (void)main {
    if (self.isCancelled) { return; }
    UIImage *inputImage = [self inputImage];
    if (self.isCancelled) { return; }
    UIImage *resultResult = [self convertImageToGrayScale:inputImage];
    if (self.isCancelled) { return; }
    self.image = resultResult;
    if (self.completion) {
        self.completion(resultResult);
    }
}

- (UIImage *)inputImage {
    for (NSOperation *operation in self.dependencies) {
        if ([operation isKindOfClass:RSOperation.class]) {
            return ((RSOperation *)operation).image;
        }
    }
    return nil;
}

- (UIImage *)convertImageToGrayScale:(UIImage *)image {

    // Create image rectangle with current image width/height
    CGRect imageRect = CGRectMake(0, 0, image.size.width, image.size.height);

    // Grayscale color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();

    // Create bitmap content with current image size and grayscale colorspace
    CGContextRef context = CGBitmapContextCreate(nil, image.size.width, image.size.height, 8, 0, colorSpace, kCGImageAlphaNone);

    // Draw image into current context, with specified rectangle
    // using previously defined context (with grayscale colorspace)
    CGContextDrawImage(context, imageRect, [image CGImage]);

    // Create bitmap image info from pixel data in current context
    CGImageRef imageRef = CGBitmapContextCreateImage(context);

    // Create a new UIImage object
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];

    // Release colorspace, context and bitmap information
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    CFRelease(imageRef);

    // Return the new grayscale image
    return newImage;
}

@end
