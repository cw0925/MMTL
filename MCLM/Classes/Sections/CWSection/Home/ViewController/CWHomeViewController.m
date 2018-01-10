//
//  CWHomeViewController.m
//  MCLM
//
//  Created by afarsoft on 2018/1/10.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import "CWHomeViewController.h"
#import "CWHomeViewModel.h"

@interface CWHomeViewController ()

@property (nonatomic,strong) CWHomeViewModel *requestVM;

@end

@implementation CWHomeViewController

- (CWHomeViewModel *)requestVM{
    if (!_requestVM) {
        _requestVM = [[CWHomeViewModel alloc] init];
    }
    return _requestVM;
}
- (void)test{
    NSLog(@"test");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataSource];
}
- (void)getDataSource{
    RACSignal *signal = [self.requestVM.requestCommand execute:nil];
    [signal subscribeNext:^(NSArray* x) {
        NSLog(@"接收数据：%@",x);
    }];
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
