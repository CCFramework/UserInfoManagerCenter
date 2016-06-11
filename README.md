Untitled Note
# UserInfoManagerCenter

介绍

结合FastCoder,利用单例模式封装的UserInfoManagerCenter数据缓存类.
以字典(value,key)方式存储对象和获取对象,Value存储类型利用FastCoder转换为NSData类型,数据传递和存储变得更加便捷可靠.

使用方法

     #import "UserInfoManagerCenter.h"

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

          NSDictionary *user = @{@"name" : @"JerryLee",@"mail" : @"1919345806@qq.com",@"phone" : @12345678901,@"sex" : @"男",};
    
          //缓存数据
          [[UserInfoManagerCenter managerCenter] setValueToUserCenter:user forKey:@"user"];

          return YES;
    
     }

     - (void)viewDidLoad {

          [super viewDidLoad];
    
          //查看缓存数据
    
          NSLog(@"以NSData方法缓存数据:%@",[[UserInfoManagerCenter managerCenter] userCenterFullInfo]);
    
          NSLog(@"获取数据转为NSDictionary:%@",[[UserInfoManagerCenter managerCenter] objectForKey:@"user"]);
    
          //获取缓存数据
    
          NSDictionary *dic = [[UserInfoManagerCenter managerCenter] objectForKey:@"user"];
    
          NSLog(@"%@",dic[@"name"]);
    
          //清空缓存
    
          [[UserInfoManagerCenter managerCenter] removeUserInfoManagerCenterCache];
    
          //查看缓存
    
          NSLog(@"清空缓存:%@",[[UserInfoManagerCenter managerCenter] userCenterFullInfo]);
    
     }


     2016-06-08 07:39:43.030 UserInfoManagerCenterDEMO[4105:212940] 以NSData方法缓存数据:{
         user = <54534146 03000200 01000000 00000000 07000000 09000000 04000000 12000000 351cdcdf 02000000 0870686f 6e650008 e794b700 08736578 00083139 31393334 35383036 4071712e 636f6d00 086d6169 6c00084a 65727279 4c656500 086e616d 6500>;
     }
     2016-06-08 07:39:43.031 UserInfoManagerCenterDEMO[4105:212940] 获取数据转为NSDictionary:{
      mail = "1919345806@qq.com";
        name = JerryLee;
         phone = 12345678901;
         sex = "\U7537";
     }
     2016-06-08 07:39:43.031 UserInfoManagerCenterDEMO[4105:212940] JerryLee
     2016-06-08 07:39:43.032 UserInfoManagerCenterDEMO[4105:212940] 清空缓存:{
     }
