//
//  MenusCell.m
//  teststorybord
//
//  Created by 剑锋 莫 on 16/1/18.
//  Copyright © 2016年 剑锋 莫. All rights reserved.
//

#import "MenusCell.h"
#import "CommonHeader.h"
#import "UIView+SDAutoLayout.h"
#import "UIImage+UIImageCategory.h"
#import "M80AttributedLabel.h"

@interface MenusCell()
{

    
}
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *imge;
@property (nonatomic,strong)NSString *title2;
@property (nonatomic,strong)NSString *imge2;
@end

@implementation MenusCell

{

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //[self setup];
    }
    return self;
}

- (void)setup
{
    self.contentView.backgroundColor = BLACK_COLOR;
    CGFloat margin = MARGIN/2.0;
    //CGFloat textMargin = 10;

    
    M80AttributedLabel *labelAtt = [[M80AttributedLabel alloc]initWithFrame:CGRectZero];
    labelAtt.backgroundColor = APPFRAME_COLOR;
    
    NSString *strImg = @"clock";
    NSString *strStepname = _title;
    labelAtt.font = [UIFont fontWithName:@"Helvetica" size:11];
    labelAtt.textColor = [UIColor whiteColor];
    NSString *text  = [NSString stringWithFormat:@"   [haha] %@",strStepname];
    NSArray *components = [text componentsSeparatedByString:@"[haha]"];
    NSUInteger count = [components count];
    for (NSUInteger i = 0; i < count; i++)
    {
        [labelAtt appendText:[components objectAtIndex:i]];
        if (i != count - 1)
        {
            [labelAtt appendImage:[UIImage imageNamed:strImg]
                          maxSize:CGSizeMake(15, 15)
                           margin:UIEdgeInsetsZero
                        alignment:M80ImageAlignmentCenter];
        }
    }
    [self.contentView addSubview:labelAtt];
    labelAtt.sd_layout
    .topSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,0)
    .widthRatioToView(self.contentView,0.5)
    .heightIs(18);

    UIButton *btn = [UIButton new];
    [self.contentView addSubview:btn];
    UIImage *image = [UIImage imageNamed:_imge];//[UIImage imageWithColor:UIColorFromRGB(0xffeff4)];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    
    M80AttributedLabel *labelAtt1 = [[M80AttributedLabel alloc]initWithFrame:CGRectZero];
    {
        labelAtt1.backgroundColor = APPFRAME_COLOR;
        
        NSString *strImg = @"clock";
        NSString *strStepname = _title2;
        labelAtt1.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelAtt1.textColor = [UIColor whiteColor];
         NSString *text  = [NSString stringWithFormat:@"   [haha] %@",strStepname];
        NSArray *components = [text componentsSeparatedByString:@"[haha]"];
        NSUInteger count = [components count];
        for (NSUInteger i = 0; i < count; i++)
        {
            [labelAtt1 appendText:[components objectAtIndex:i]];
            if (i != count - 1)
            {
                [labelAtt1 appendImage:[UIImage imageNamed:strImg]
                               maxSize:CGSizeMake(15, 15)
                                margin:UIEdgeInsetsZero
                             alignment:M80ImageAlignmentCenter];
            }
        }
        [self.contentView addSubview:labelAtt1];
        labelAtt1.sd_layout
        .topSpaceToView(self.contentView,0)
        .leftSpaceToView(labelAtt,0)
        .widthRatioToView(self.contentView,0.5)
        .heightIs(18);
    }

    
    UIButton *btn1 = [UIButton new];
    [self.contentView addSubview:btn1];
    UIImage *image1 = [UIImage imageNamed:_imge2];//[UIImage imageWithColor:UIColorFromRGB(0x00eff4)];
    [btn1 setBackgroundImage:image1 forState:UIControlStateNormal];
    
    
    // 设置等宽的子view
    self.contentView.sd_equalWidthSubviews = @[btn, btn1];
    
    btn.sd_layout
    .leftSpaceToView(self.contentView,margin)
    .topSpaceToView(labelAtt,margin)
    .autoHeightRatio(1);
   // btn.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    btn1.sd_layout
    .leftSpaceToView(btn,margin)
    .topSpaceToView(labelAtt,margin)
    .rightSpaceToView(self.contentView,margin)
    .autoHeightRatio(1);
  //  btn1.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    [btn addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 10000;
    [btn1 addTarget:self action:@selector(clickMenu:) forControlEvents:UIControlEventTouchUpInside];
    btn1.tag = 10001;
    
    // 当你不确定哪个view在自动布局之后会排布在cell最下方的时候可以调用次方法将所有可能在最下方的view都传过去
    [self setupAutoHeightWithBottomViewsArray:@[labelAtt,btn] bottomMargin:margin];
}

-(void)setUpMenu:(NSDictionary *)dict block:(clickMenuBlock)block
{
    _title = [dict objectForKey:@"title"];
    _imge = [dict objectForKey:@"imge"];
    _title2 = [dict objectForKey:@"title2"];
    _imge2 = [dict objectForKey:@"imge2"];
    self.block = block;
    [self setup];
}

-(void)setUpMenu:(clickMenuBlock)block
{
    self.block = block;
    [self setup];
}

-(void)clickMenu:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSInteger index = btn.tag- 10000;
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:@"测试" forKey:@"title"];
    self.block(dict,index);
    
    switch (btn.tag) {
        case 10000:
        {


        }
            break;
        case 10001:
        {
            
        }
            break;
        case 10002:
        {
            
        }
            break;
        case 10003:
        {
            
        }
            break;
        case 10004:
        {
            
        }
            break;
        case 10005:
        {
            
        }
            break;
        case 10006:
        {
            
        }
            break;
        case 10007:
        {
            
        }
            break;
        default:
            break;
    }
}

@end
