//
//  Item.m
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import "Item.h"
#import "ItemDetail.h"

@implementation Item
- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = [dictionary objectForKey:@"title"];
        
        NSMutableArray *rows = [[NSMutableArray alloc] init];
        
        for (NSDictionary *detail in [dictionary objectForKey:@"rows"]) {
            ItemDetail *d = [[ItemDetail alloc] initWithDictionary:detail];

            if (d.title) {
                [rows addObject:d];
            }
        }
        
        _details = rows;
    }
    return self;
}
@end
