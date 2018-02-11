//
//  WebService.h
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol WebServiceDelegate;

@interface WebService : NSObject
+ (void)dataTask:(NSString*)pUrl delegate:(id<WebServiceDelegate>) pDelegate;
@end

@protocol WebServiceDelegate
@required

- (void)response:(BOOL)success data:(NSData *)data;
@end
