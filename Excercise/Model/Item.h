//
//  Item.h
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ItemDetail;

@interface Item : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArray<ItemDetail*> *details;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;
@end
