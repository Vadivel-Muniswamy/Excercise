//
//  UIImageView+Loader.h
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebService.h"

@interface UIImageView (Loader) <WebServiceDelegate>
- (void)downloadImage:(NSString *)urlString;
@end
