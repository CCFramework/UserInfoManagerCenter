//
//  UserInfoManagerCenter.h
//  DesignPattern-Singleton Pattern
//
//  Created by LIFEIHENG on 16/6/8.
//  Copyright © 2016年 LIFEIHENG. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 (注:不可使用alloc init方式获取UserInfoManagerCenter实例对象,否则程序会....!)
 */

@interface UserInfoManagerCenter : NSObject
/**
 *  单例获取方法
 *
 *  @return 反回一个全局的UserInfoManagerCenter单例对象
 */
+ (instancetype)managerCenter;
/**
 *  存储对象
 *
 *  @param value 需要的存储的对象
 *  @param key   存储值的key
 */
- (void)setValueToUserCenter:(id)value forKey:(NSString *)key;

/**
 *  获取已经存储的对象
 *
 *  @param key 需要获取值的key
 *
 *  @return 返回获取的类型对象
 */
- (id)objectForKey:(NSString *)key;

/**
 *  获取UserInfoManagerCenter的所有数据
 *
 */
- (NSDictionary *)userCenterFullInfo;

/**
 *  移除UserInfoManagerCenter中的所有缓存数据
 */
- (void)removeUserInfoManagerCenterCache;

@end
