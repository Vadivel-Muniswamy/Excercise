//
//  UIImageView+Loader.m
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import "UIImageView+Loader.h"
@implementation UIImageView (Loader) 

- (void)downloadImage:(NSString *)urlString {
    self.image = [UIImage imageNamed:@"loading_iamge.png"];
    [WebService dataTask:urlString delegate:self];
}

- (void)response:(BOOL)success data:(NSData *)data {
    UIImage *image;
    if (success) {
        image = [UIImage imageWithData:data];
        NSLog(@"%f", image.size.height);
    }

    if (!image) {
        image = [UIImage imageNamed:@"error_iamge.png"];
    }
    self.image = image;
    NSLog(@"%f", self.image.size.height);
}

@end
