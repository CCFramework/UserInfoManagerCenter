Untitled Note
# UserInfoManagerCenter

介绍

结合FastCoder,利用单例模式封装的UserInfoManagerCenter数缓存工具类.
以字典方式存储对象,Value存储类型利用FastCoder转换为NSData类型,数据相对更加安全和传递.

使用方法

#import "UserInfoManagerCenter.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSDictionary *user = @{@"name" : @"JerryLee",
                           @"mail" : @"13691259899@qq.com",
                           @"phone" : @12345678901,
                           @"sex" : @"男",};
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
