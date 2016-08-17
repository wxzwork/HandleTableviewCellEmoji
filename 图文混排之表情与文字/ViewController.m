//
//  ViewController.m
//  图文混排之表情与文字
//
//  Created by WOSHIPM on 16/6/28.
//  Copyright © 2016年 WOSHIPM. All rights reserved.
//

#import "ViewController.h"
#import "ContentCell.h"
#import <MLLabel/NSString+MLExpression.h>
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *expressionData;
@property(nonatomic, strong)NSMutableArray *contentArray;
@property(nonatomic, strong)UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        _contentArray = [NSMutableArray array];
        _expressionData = [NSMutableArray array];
    _contentArray = [NSMutableArray arrayWithObjects:@"对待好东西一定不能犹豫，早起抢了张秒杀票 :twisted:  :twisted:",@"终于又等到北京的大课，好激动 :mrgreen:  :mrgreen:  :mrgreen: 这次和公司小伙伴准备买成团票~ :smile:  :smile:",@"昨天下午部门临时开了一个紧急的小会，老总说：听说起点学院在北京又开总监课程呢！上次因为公司在赶项目没有办法 :cry: ，这次一定要报名，我们竟然想做大做好，就一定要有学习的精神，明天大家定好闹铃，抢票N",@":razz:  :roll:  :roll: 报名走一个，修炼，修炼，我就要究极变化了~~比卡~比卡~比卡丘",@"看到同事了哈哈哈 :lol:",@"我是得加他们微信才能发图片吧？申请加好友也没人回复啊？这是为什么呢？ :arrow:",@"回复Uncle Wang ：什么时候可以加上呢  :arrow:", @"回复lisa991 ：小助手宝宝的微信已经被加爆了，请稍安勿躁，摸摸大 :lol:",@"居然没人搭理~严重打击了用户的信任~哼 :mad:  :mad:  :mad:  :mad:  :mad:  :mad:",@"终于等到你~ :razz:  :razz:  :razz:",@"还好有直播，要不然就要遗憾惨了~好开心~~~ :mrgreen:  :mrgreen:  :mrgreen:",@"哦啦啦，这次抢到票啦，去高逼格的现场，啦啦啦，好开心 :grin:  :grin:", @"特么周六上班    :mad:",@"从技术架构角度看，传统垂直架构的特点是本地API接口调用，不存在业务的拆分和互相调用，使用到什么功能就本地开发，非常方便，不需要过度依赖于其它功能模块；从考核角度来看，共享很难推行。开发只需要对自己开发的模块交付质量负责，没有义务为他人提供并维护公共类库，这个非常耗费成本； 时间依赖很难把控：对于公共类库的使用者而言，依赖别人提供此功能，但是功能提供者可能有更重要的事情在做，提供时间无法满足使用者。与其坐等别人提供，还不如自己开发效率高；",nil];
    
    //用正则表达式匹配表情字符串,
        MLExpression *exp = [MLExpression expressionWithRegex:@"\\:[a-zA-Z0-9\\u4e00-\\u9fa5\\?\\!]+\\:" plistName:@"Expression" bundleName:@"Emotion"];
        [MLExpressionManager expressionAttributedStringsWithStrings:_contentArray expression:exp callback:^(NSArray *result) {
            self.expressionData = [NSMutableArray arrayWithArray:result];
            [_tableview reloadData];
        }];
    
}

-(void)loadView{
    [super loadView];
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 24, self.view.frame.size.width, self.view.frame.size.height - 24) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.tableFooterView = [[UIView alloc] init];
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    [_tableview setSeparatorInset:UIEdgeInsetsMake(0, 13, 0, 13)];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contentArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_expressionData.count == 0) {
        return 0;
    }else{
    CGFloat height = [ContentCell heightForExpressionText:self.expressionData[indexPath.row] width:self.view.frame.size.width-26];
    
    return height;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (_expressionData.count != 0) {
        cell.textlabel.attributedText = self.expressionData[indexPath.row];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
