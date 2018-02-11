//
//  Util.m
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import "Util.h"

@implementation Util
+ (id)validateObject:(id)object {
    if ([object isKindOfClass:NSNull.class]) {
        return nil;
    }
    return object;
}

@end
