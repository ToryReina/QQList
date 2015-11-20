//
//  LQHeaderView.m
//  QQList
//
//  Created by Tory on 15/11/20.
//  Copyright © 2015年 Tory. All rights reserved.
//

#import "LQHeaderView.h"
#import "LQFriendGroup.h"

@interface LQHeaderView()
@property(nonatomic,weak) UIButton *btn;

@property(nonatomic,weak) UILabel *label;

@end

@implementation LQHeaderView

+ (instancetype)headerVeiw:(UITableView *)tableView
{
    static NSString *ID = @"header";
    
    LQHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    
    if (headerView == nil)
    {   //这个方法创建的view不能满足我们的需要，所以我们对其进行重写
        headerView = [[LQHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIButton *btn = [[UIButton alloc]init];
        [self addSubview:btn];
        
        [btn setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(headerVeiwClick) forControlEvents:UIControlEventTouchUpInside];
        self.btn = btn;
        //以中心点旋转。
        self.btn.imageView.contentMode = UIViewContentModeCenter;
        //不去掉超出部分。
        self.btn.imageView.clipsToBounds = NO;
        
        UILabel *lable = [[UILabel alloc]init];
        
        lable.textColor = [UIColor blackColor];
        lable.textAlignment = NSTextAlignmentRight;
        self.label = lable;
        [self addSubview:lable];
        
    }
    return self;
}
- (void) headerVeiwClick
{
    //修改展开或者合并
    self.friendGoups.isExpand = !self.friendGoups.isExpand;
    //调用代理方法实现数据源操作
    if ([self.delegate respondsToSelector:@selector(headerViewButtonDidClick:)])
    {
        [self.delegate headerViewButtonDidClick:self];
    }

}
//重写赋值方法
- (void)setFriendGoups:(LQFriendGroup *)friendGoups
{
    _friendGoups = friendGoups;
    //设置数据
    [self.btn setTitle:friendGoups.name forState:UIControlStateNormal];
    self.label.text = [NSString stringWithFormat:@"%d|%ld",friendGoups.online,friendGoups.friends.count];
    NSLog(@"%@",self.label.text);
}
//当将一个空间将要添加到父容器中时，会调用这个方法。
- (void) willMoveToSuperview:(UIView *)newSuperview
{
    //图标旋转
    if (self.friendGoups.isExpand)
    {
        self.btn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    else
    {
        self.btn.imageView.transform = CGAffineTransformMakeRotation(0);
    }
}
//设置子控件frame
- (void) layoutSubviews
{
    [super layoutSubviews];
    self.btn.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.label.frame = CGRectMake(275, 0, 90, self.frame.size.height);
}
@end
