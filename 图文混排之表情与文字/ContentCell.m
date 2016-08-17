//
//  ContentCell.m
//  图文混排之表情与文字
//
//  Created by WOSHIPM on 16/6/28.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "ContentCell.h"

@implementation ContentCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.textlabel];
        
       
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.textlabel.frame = CGRectMake(13, 0, self.contentView.frame.size.width - 26, self.contentView.frame.size.height);
    
}


#pragma mark - getter
- (MLLinkLabel *)textlabel
{
    if (!_textlabel) {
        _textlabel = [MLLinkLabel new];
        _textlabel.textColor = [UIColor colorWithRed:0.51 green:0.51 blue:0.51 alpha:1];;
        //        _textlabel.backgroundColor = [UIColor colorWithRed:0.137 green:0.780 blue:0.118 alpha:1.000];
        
        _textlabel.font = [UIFont systemFontOfSize:14.0f];
        
        _textlabel.numberOfLines = 0;
        _textlabel.lineSpacing = 2.0f;
        _textlabel.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:0.51 green:0.51 blue:0.51 alpha:1]};
        _textlabel.activeLinkTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:0.51 green:0.51 blue:0.51 alpha:1],NSBackgroundColorAttributeName:kDefaultActiveLinkBackgroundColorForMLLinkLabel};
        
        
        
        
        
    }
    return _textlabel;
}

#pragma mark - height
static MLLinkLabel * kProtypeLabel() {
    static MLLinkLabel *_protypeLabel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _protypeLabel = [MLLinkLabel new];
        _protypeLabel.font = [UIFont systemFontOfSize:14.0f];
        
        _protypeLabel.numberOfLines = 0;
        //        _protypeLabel.textInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        //        _protypeLabel.lineHeightMultiple = 1.1f;
        _protypeLabel.lineSpacing = 2.0f;
    });
    return _protypeLabel;
}


+ (CGFloat)heightForExpressionText:(NSAttributedString*)expressionText width:(CGFloat)width
{
    
    width-=13.0f;
    
    MLLinkLabel *label = kProtypeLabel();
    label.attributedText = expressionText;
    return [label preferredSizeWithMaxWidth:width].height + 5.0f*2; //上下间距
}



@end
