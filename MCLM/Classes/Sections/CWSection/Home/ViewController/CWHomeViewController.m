//
//  CWHomeViewController.m
//  MCLM
//
//  Created by afarsoft on 2018/1/10.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import "CWHomeViewController.h"
#import "CWHomeViewModel.h"

//#import "CWShopListModel.h"

@interface CWHomeViewController ()

@property (nonatomic,strong) CWHomeViewModel *requestVM;
@property (nonatomic,strong) UICollectionView *homeCollectionView;

@end

@implementation CWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getDataSource];
    [self itemClick];
}
- (UICollectionView *)homeCollectionView{
    if (!_homeCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _homeCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _homeCollectionView.backgroundColor = [UIColor whiteColor];
        _homeCollectionView.delegate = self.requestVM;
        _homeCollectionView.dataSource = self.requestVM;
        [self.view addSubview:_homeCollectionView];
        [_homeCollectionView registerNib:[UINib nibWithNibName:@"CWHomeShopListCell" bundle:nil] forCellWithReuseIdentifier:@"shopCell"];
        [_homeCollectionView registerNib:[UINib nibWithNibName:@"CWGoodInfoCell" bundle:nil] forCellWithReuseIdentifier:@"goodCell"];
        [_homeCollectionView registerNib:[UINib nibWithNibName:@"CWSectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeader"];
    }
    return _homeCollectionView;
}
- (void)getDataSource{
    @weakify(self);
    [[[self.requestVM.requestCommand execute:nil]
      deliverOn:[RACScheduler mainThreadScheduler]]
     subscribeNext:^(NSArray *x) {
         @strongify(self);
         
         self.requestVM.shopListDataArr = x[0];
         self.requestVM.dproductListDataArr = x[1];
         self.requestVM.rproductListDataArr = x[2];
         self.requestVM.prodyctTryListDataArr = x[3];
        
         [self.homeCollectionView reloadData];
     }];
}
- (void)itemClick{
    self.requestVM.selectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(RACTuple *turple) {
        NSLog(@"点击：%@",[turple first]);
        return [RACSignal empty];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CWHomeViewModel *)requestVM{
    if (!_requestVM) {
        _requestVM = [[CWHomeViewModel alloc] init];
    }
    return _requestVM;
}
@end
