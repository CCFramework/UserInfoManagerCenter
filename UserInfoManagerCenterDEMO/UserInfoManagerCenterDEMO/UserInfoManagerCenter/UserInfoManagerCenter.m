//
//  UserInfoManagerCenter.m
//  DesignPattern-Singleton Pattern
//
//  Created by LIFEIHENG on 16/6/8.
//  Copyright © 2016年 LIFEIHENG. All rights reserved.
//

#import "UserInfoManagerCenter.h"
#import "FastCoder.h"


#define kUserInfoManagerCenter [[NSUserDefaults standardUserDefaults] objectForKey:@"UserInfoManagerCenter"]

@interface UserInfoManagerCenter ()

@property (nonatomic, strong) NSMutableDictionary *userCenterInfo;

@end

@implementation UserInfoManagerCenter
static UserInfoManagerCenter *center = nil;

+ (instancetype)managerCenter {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = (UserInfoManagerCenter *)@"UserInfoManagerCenter";
        //这里会调用我们重写的init方法
        center = [[UserInfoManagerCenter alloc] init];
    });
    return center;
}

//3.重写init方法
- (instancetype)init {
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] == YES &&
        [string isEqual:@"UserInfoManagerCenter"]) {
        self = [super init];
        if (self) {
            //防止了类化操作
            NSString *classString = NSStringFromClass([self class]);
            if ([classString isEqualToString:@"UserInfoManagerCenter"] == NO) {
                NSLog(@"crash崩溃信息:<%@>的父类不可以于被继承,请不要作继承等子类化操作",classString);
                NSParameterAssert(nil);
            } else {
                //初始化代码
                self.userCenterInfo = [NSMutableDictionary dictionary];
            }
        }
        return self;
    } else {
        NSLog(@"crash崩溃信息:<%@>不能使用alloc init方法创建,请使用managerCenter创建实例对象",[self class]);
        NSParameterAssert(nil);
        return nil;
    }
}

- (void)setValueToUserCenter:(id)value forKey:(NSString *)key {
    if (value == nil) {
        NSLog(@"%@,不能为空",value);
    }
    NSParameterAssert(value);
    if (key == nil) {
        NSLog(@"%@,不能为空",key);
    }
    NSParameterAssert(key);
    
    NSData *data = [FastCoder dataWithRootObject:value];
    if (data) {
        if (kUserInfoManagerCenter) {
            self.userCenterInfo = [NSMutableDictionary dictionaryWithDictionary:kUserInfoManagerCenter];
            [self.userCenterInfo setObject:data forKey:key];
            
            [[NSUserDefaults standardUserDefaults] setObject:[NSDictionary dictionaryWithDictionary:self.userCenterInfo] forKey:@"UserInfoManagerCenter"];
        } else {
            [self.userCenterInfo setObject:data forKey:key];
            [[NSUserDefaults standardUserDefaults] setObject:[NSDictionary dictionaryWithDictionary:self.userCenterInfo] forKey:@"UserInfoManagerCenter"];
        }
        //如果有这个data就进行存储
    }
}
- (id)objectForKey:(NSString *)key {
    if (key == nil) {
        NSLog(@"%@,不能为空",key);
    }
    NSParameterAssert(key);
    if (kUserInfoManagerCenter) {
        self.userCenterInfo = kUserInfoManagerCenter;
        NSData *data = [self.userCenterInfo objectForKey:key];
        return [FastCoder objectWithData:data];
    } else {
        return nil;
    }
}

- (NSDictionary *)userCenterFullInfo {
    if (kUserInfoManagerCenter) {
        return kUserInfoManagerCenter;
    } else {
        return @{};
    }
}

- (void)removeUserInfoManagerCenterCache {
    if (kUserInfoManagerCenter) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"UserInfoManagerCenter"];
    } else {
        NSLog(@"UserInfoManagerCenter 没有缓存数据");
    }
}

@end
