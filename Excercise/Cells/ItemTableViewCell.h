//
//  ItemTableViewCell.h
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemDetail;
@protocol ItemDelegate;

@interface ItemTableViewCell : UITableViewCell

- (void)configureCell:(ItemDetail *)item;
+ (CGFloat)getHeightForItem:(ItemDetail *)item inView:(UIView *)view;

@property (nonatomic, weak) id<ItemDelegate> delegate;
@end

@protocol ItemDelegate
@optional
- (void)onChangeCellContent:(ItemTableViewCell*)detail;
@end
