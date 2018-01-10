//
//  CWRootViewController.m
//  MCLM
//
//  Created by afarsoft on 2018/1/10.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import "CWRootViewController.h"

@interface CWRootViewController ()

@end

@implementation CWRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *arrM = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Controller.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dic in arr) {
        NSString *icon = dic[@"icon"];
        NSString *iconSelected = dic[@"pressIcon"];
        NSString *title = dic[@"title"];
        NSString *controller = dic[@"viewController"];
        Class class = NSClassFromString(controller);
        UIViewController *viewController = [[class alloc]init];
        UINavigationController *navc = [[UINavigationController alloc]initWithRootViewController:viewController];
        navc.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:icon] selectedImage:[[UIImage imageNamed:iconSelected] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        //点击时更改字体颜色
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:216/255.0 green:30/255.0 blue:6/255.0 alpha:0.8],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        [arrM addObject:navc];
    }
    self.viewControllers = arrM;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
