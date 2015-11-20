//
//  LQFriend.m
//  QQList
//
//  Created by Tory on 15/11/20.
//  Copyright © 2015年 Tory. All rights reserved.
//

#import "LQFriend.h"

@implementation LQFriend
+ (instancetype) friendWithDic: (NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
- (instancetype) initWithDic: (NSDictionary *)dic
{
    if (self = [super init])
    {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (NSArray *) friends: (NSArray *)sourceArr
{
    NSMutableArray *desArr = [NSMutableArray array];
    for (NSDictionary *dic in sourceArr)
    {
        LQFriend *friend = [LQFriend friendWithDic:dic];
        [desArr addObject:friend];
    }
    return  desArr;
}
@end
