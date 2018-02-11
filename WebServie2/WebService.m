//
//  WebService.m
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import "WebService.h"

@implementation WebService

+ (void)dataTask:(NSString*)pUrl delegate:(id<WebServiceDelegate>) pDelegate{

    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSURL *url = [NSURL URLWithString:pUrl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//    request;
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        if ([pUrl isEqualToString:@"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"]) {
            NSLog(@"");
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data && data.length) {
                [pDelegate response:true data:data];
            }
            else {
                [pDelegate response:false data:nil];
            }
        });
    }];
}


@end
