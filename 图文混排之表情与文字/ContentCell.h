//
//  ContentCell.h
//  图文混排之表情与文字
//
//  Created by WOSHIPM on 16/6/28.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MLLabel/MLLinkLabel.h>
@interface ContentCell : UITableViewCell
+ (CGFloat)heightForExpressionText:(NSAttributedString*)expressionText width:(CGFloat)width;
@property (strong, nonatomic)MLLinkLabel *textlabel;
@end
