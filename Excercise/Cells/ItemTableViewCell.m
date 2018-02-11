//
//  ItemTableViewCell.m
//  WTestOC
//
//  Created by MFS on 2/11/18.
//  Copyright © 2018 MFS. All rights reserved.
//

#import "ItemTableViewCell.h"
#import "UIImageView+Loader.h"
#import "ItemDetail.h"

@interface ItemTableViewCell () {
    
    UILabel *itemTitleLabel;
    UILabel *itemDescriptionLabel;
    UIImageView *itemImageView;
    
    NSLayoutConstraint *titleBottomDesc;
    NSLayoutConstraint *titleBottomImage;
    NSLayoutConstraint *titleBottomContent;
    
    NSLayoutConstraint *descBottomImage;
    NSLayoutConstraint *descBottomContent;

    NSLayoutConstraint *imageBottomContent;
    
    ItemDetail *detail;
}
@end

@implementation ItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createLayout];
    }
    return self;
}


- (void) createLayout {
    
    itemTitleLabel = [[UILabel alloc] init];
    itemTitleLabel.textColor = UIColor.blackColor;
    itemTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.contentView addSubview:itemTitleLabel];
    itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint *titleTop = [NSLayoutConstraint constraintWithItem:itemTitleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:10];
    titleTop.active = true;
    
    NSLayoutConstraint *titleLeft = [NSLayoutConstraint constraintWithItem:itemTitleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:10];
    titleLeft.active = true;
    
    NSLayoutConstraint *titleRight = [NSLayoutConstraint constraintWithItem:itemTitleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10];
    titleRight.active = true;
    
    [itemTitleLabel setContentHuggingPriority:255 forAxis:UILayoutConstraintAxisVertical];
    [itemTitleLabel setContentCompressionResistancePriority:745 forAxis:UILayoutConstraintAxisVertical];
    
    itemDescriptionLabel = [[UILabel alloc] init];
    itemDescriptionLabel.textColor = UIColor.blackColor;
    itemDescriptionLabel.numberOfLines = 0;
    itemDescriptionLabel.font = [UIFont systemFontOfSize:17];
    [self.contentView addSubview:itemDescriptionLabel];
    itemDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint *descriptionLeft = [NSLayoutConstraint constraintWithItem:itemDescriptionLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1 constant:20];
    descriptionLeft.active = true;
    
    NSLayoutConstraint *descriptionRight = [NSLayoutConstraint constraintWithItem:itemDescriptionLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-20];
    descriptionRight.active = true;
    
    [itemDescriptionLabel setContentHuggingPriority:253 forAxis:UILayoutConstraintAxisVertical];
    [itemDescriptionLabel setContentCompressionResistancePriority:747 forAxis:UILayoutConstraintAxisVertical];

    itemImageView = [[UIImageView alloc] init];
    itemImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:itemImageView];
    itemImageView.translatesAutoresizingMaskIntoConstraints = false;
    
    [itemImageView setContentHuggingPriority:260 forAxis:UILayoutConstraintAxisVertical];
    [itemImageView setContentCompressionResistancePriority:740 forAxis:UILayoutConstraintAxisVertical];

    //[itemImageView addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];

    NSLayoutConstraint *imageCenterX = [NSLayoutConstraint constraintWithItem:itemImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    imageCenterX.active = true;
    
    imageBottomContent = [NSLayoutConstraint constraintWithItem:itemImageView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
    imageBottomContent.active = true;
    
    // desc
    titleBottomDesc = [NSLayoutConstraint constraintWithItem:itemTitleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:itemDescriptionLabel attribute:NSLayoutAttributeTop multiplier:1 constant:-10];
    titleBottomDesc.active = true;

    //image && no desc
        titleBottomImage = [NSLayoutConstraint constraintWithItem:itemTitleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:itemImageView attribute:NSLayoutAttributeTop multiplier:1 constant:-10];
        titleBottomImage.active = false;
    
    //no image && no desc
        titleBottomContent = [NSLayoutConstraint constraintWithItem:itemTitleLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        titleBottomContent.active = false;
    
    
   //desc  && image
        descBottomImage = [NSLayoutConstraint constraintWithItem:itemDescriptionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:itemImageView attribute:NSLayoutAttributeTop multiplier:1 constant:-10];
        descBottomImage.active = true;
        
    //desc  && no image
        descBottomContent = [NSLayoutConstraint constraintWithItem:itemDescriptionLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        descBottomContent.active = false;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
}

#pragma mark -
- (void)configureCell:(ItemDetail *)item {
    detail = item;
    itemTitleLabel.text = item.title;
    itemDescriptionLabel.text = item.desc;
    
    if (item.desc) {
        titleBottomDesc.active = true;
        titleBottomImage.active = false;
        titleBottomContent.active = false;
    }
    else if (item.url) {
        titleBottomDesc.active = false;
        titleBottomImage.active = true;
        titleBottomContent.active = false;
    }
    else {
        titleBottomDesc.active = false;
        titleBottomImage.active = false;
        titleBottomContent.active = true;
    }
    
    descBottomImage.active = item.desc && item.url;
    descBottomContent.active = (item.desc && !item.url);
    
    imageBottomContent.active = item.url;
    
    if (!item.url) {
        itemImageView.image = nil;
    }
    else {
        itemImageView.image = [UIImage imageNamed:@"loading_iamge.png"];
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        NSURL *url = [NSURL URLWithString:item.url];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                UIImage *image;
                if (data && data.length) {
                    image = [UIImage imageWithData:data];
                }
                if (!image) {
                    image = [UIImage imageNamed:@"error_iamge.png"];
                }
                itemImageView.image = image;
                detail.imageHeight = image.size.height;
                //detail.image = image;
                [self.delegate onChangeCellContent:self];
            });
        }];
    }
}

#pragma mark -
+ (CGFloat)getHeightForItem:(ItemDetail *)item inView:(UIView *)view {
    CGFloat titleTop    = 10.0f;
    CGFloat titleBottom = 10.0f;
    CGFloat descBottom  = 0.0f;
    CGFloat imageBottom = 0.0f;
    CGFloat imageHeight  = item.imageHeight;
    
    CGSize titleSize, descSize;
    titleSize = [item.title boundingRectWithSize:CGSizeMake(view.frame.size.width-20, MAXFLOAT) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]} context:nil].size;
    
    if (item.desc && item.desc.length > 0) {
        descSize = [item.desc boundingRectWithSize:CGSizeMake(view.frame.size.width-40, MAXFLOAT) options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
        descBottom      = 10.0f;
    }
   
    if (item.url) {
        imageBottom     = 10.0f;
        imageHeight     = (imageHeight > 0.0f) ? imageHeight : 60.0f;
    }

    CGFloat totalHeight = titleTop + ceil(titleSize.height) + titleBottom + ceil(descSize.height) + descBottom + imageHeight + imageBottom;
    return totalHeight;
}

#pragma mark #pragma mark - Table View Content Size Notification
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if(object == itemImageView && [keyPath isEqualToString:@"image"] ) {
        detail.imageHeight = itemImageView.image.size.height;
        //[self.delegate onChangeCellContent:self];
    }
}

@end
