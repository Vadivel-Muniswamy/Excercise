//
//  ItemDetail.m
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import "ItemDetail.h"
#import "Util.h"

@implementation ItemDetail
- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title  = [Util validateObject:[dictionary objectForKey:@"title"]];
        _desc   = [Util validateObject:[dictionary objectForKey:@"description"]];
        _url    = [Util validateObject:[dictionary objectForKey:@"imageHref"]];
    }
    return self;
}
@end
