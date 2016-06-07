//
//  ViewController.m
//  UserInfoManagerCenterDEMO
//
//  Created by LIFEIHENG on 16/6/8.
//  Copyright © 2016年 LIFEIHENG. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoManagerCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"以NSData方法缓存数据:%@",[[UserInfoManagerCenter managerCenter] userCenterFullInfo]);
    NSLog(@"获取数据转为NSDictionary:%@",[[UserInfoManagerCenter managerCenter] objectForKey:@"user"]);
    NSDictionary *dic = [[UserInfoManagerCenter managerCenter] objectForKey:@"user"];
    NSLog(@"%@",dic[@"name"]);
    [[UserInfoManagerCenter managerCenter] removeUserInfoManagerCenterCache];
    NSLog(@"清空缓存:%@",[[UserInfoManagerCenter managerCenter] userCenterFullInfo]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
