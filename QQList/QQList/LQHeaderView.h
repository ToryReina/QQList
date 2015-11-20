//
//  LQHeaderView.h
//  QQList
//
//  Created by Tory on 15/11/20.
//  Copyright © 2015年 Tory. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LQHeaderView;
@class LQFriendGroup;
@protocol LQHeaderViewDelegate <NSObject>

@optional
- (void) headerViewButtonDidClick:(LQHeaderView *)headerView;

@end

@interface LQHeaderView : UITableViewHeaderFooterView

+ (instancetype) headerVeiw: (UITableView *)tableView;

@property(nonatomic,strong) LQFriendGroup *friendGoups;

@property(nonatomic,strong) id<LQHeaderViewDelegate> delegate;
@end
