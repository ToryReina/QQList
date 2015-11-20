//
//  LQFriendGroup.m
//  QQList
//
//  Created by Tory on 15/11/20.
//  Copyright © 2015年 Tory. All rights reserved.
//

#import "LQFriendGroup.h"
#import "LQFriend.h"
@implementation LQFriendGroup
+ (instancetype) friendGroupWithDic: (NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
- (instancetype) initWithDic: (NSDictionary *)dic
{
    if (self = [super init])
    {
        self.friends = [LQFriend friends:dic[@"friends"]];
        self.name = dic[@"name"];
        self.online = [dic[@"online"] intValue];
    }
    return self;
}

+ (NSArray *)friendGroups
{
    NSArray *sourceArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:nil]];
    
    NSMutableArray *desArr = [NSMutableArray array];
    
    for (NSDictionary *dic in sourceArr)
    {
        LQFriendGroup *group = [LQFriendGroup friendGroupWithDic:dic];
        
        [desArr addObject:group];
    }
    return  desArr;
}
@end
