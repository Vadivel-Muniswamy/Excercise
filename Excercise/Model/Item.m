//
//  Item.m
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import "Item.h"
#import "ItemDetail.h"
#import "Util.h"

@implementation Item
- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = [Util validateObject:[dictionary objectForKey:@"title"]];
        
        NSArray *details = [Util validateObject:[dictionary objectForKey:@"rows"]];
        
        if (details.count) {
            NSMutableArray *rows = [[NSMutableArray alloc] init];
            for (NSDictionary *detail in details) {
                ItemDetail *d = [[ItemDetail alloc] initWithDictionary:detail];
                
                if (d.title) {
                    [rows addObject:d];
                }
            }
            _details = rows;
        }
    }
    return self;
}
@end
