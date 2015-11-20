//
//  LQFriend.h
//  QQList
//
//  Created by Tory on 15/11/20.
//  Copyright © 2015年 Tory. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LQFriend : NSObject
//头像
@property (nonatomic,copy) NSString *icon;

//昵称
@property (nonatomic,copy) NSString *name;

//说说
@property (nonatomic,copy) NSString *intro;

//Vip
@property (nonatomic,assign,getter=isVip) BOOL vip;

+ (instancetype) friendWithDic: (NSDictionary *)dic;
- (instancetype) initWithDic: (NSDictionary *)dic;

+ (NSArray *) friends: (NSArray *)sourceArr;
@end
