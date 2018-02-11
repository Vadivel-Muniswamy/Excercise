//
//  ItemDetail.h
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface ItemDetail : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *url;
//@property (nonatomic, strong) UIImage  *image;
@property (nonatomic) float   imageHeight;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;
@end
