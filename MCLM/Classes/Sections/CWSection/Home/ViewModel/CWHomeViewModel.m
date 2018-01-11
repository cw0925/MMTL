//
//  CWHomeViewModel.m
//  MCLM
//
//  Created by afarsoft on 2018/1/10.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import "CWHomeViewModel.h"
#import "AFNetHelper.h"
#import "AFNetworking.h"
#import "CWShopListModel.h"
#import "CWHomeShopListCell.h"
#import "CWGoodInfoCell.h"
#import "CWSectionHeaderView.h"

@interface CWHomeViewModel()

@end

@implementation CWHomeViewModel
{
    NSInteger sections;
}

- (instancetype)init {
    if (self = [super init]) {
        [self getData];
    }
    return self;
}
- (void)getData {
    self.requestCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [AFNetHelper POST:HomeURL parameters:@{@"data":@"5OTRJ+JaknTfGVSdRqnTWqw9uFLc4ZO5KpWNx44uwze/KqPY2iyyOVB5KgwIOcOkqthkLwxQtW61gboPalEqJA=="} success:^(id responseObject) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSDictionary *result = dic[@"result"];
                sections = result.count;
//                果农店铺
                NSMutableArray *shopList = [NSMutableArray array];
                NSArray *shopListArr = result[@"shopList"];
                for (NSDictionary *item in shopListArr) {
                    CWShopListModel *model = [[CWShopListModel alloc]init];
                    [model setValuesForKeysWithDictionary:item];
                    [shopList addObject:model];
                }
//                 当季新鲜
                NSMutableArray *dproductList = [NSMutableArray array];
                NSArray *dproductListArr = result[@"dproductList"];
                for (NSDictionary *item in dproductListArr){
                    CWShopListModel *model = [[CWShopListModel alloc]init];
                    [model setValuesForKeysWithDictionary:item];
                    [dproductList addObject:model];
                }
//                  我要试吃
                NSMutableArray *prodyctTryList = [NSMutableArray array];
                NSArray *prodyctTryListArr = result[@"prodyctTryList"];
                for (NSDictionary *item in prodyctTryListArr){
                    CWShopListModel *model = [[CWShopListModel alloc]init];
                    [model setValuesForKeysWithDictionary:item];
                    [prodyctTryList addObject:model];
                }
//                  热门促销
                NSMutableArray *rproductList = [NSMutableArray array];
                NSArray *rproductListArr = result[@"rproductList"];
                for (NSDictionary *item in rproductListArr){
                    CWShopListModel *model = [[CWShopListModel alloc]init];
                    [model setValuesForKeysWithDictionary:item];
                    [rproductList addObject:model];
                }
                [subscriber sendNext:@[shopList,dproductList,rproductList,prodyctTryList]];
                [subscriber sendCompleted];
            } failure:^(NSError *error) {

            }];
            return nil;
        }];
        return signal;
    }];
}
#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return self.shopListDataArr.count;
    }else if(section == 1){
        return self.dproductListDataArr.count;
    }else if (section == 2){
        return self.rproductListDataArr.count;
    }else{
        return self.prodyctTryListDataArr.count;
    }
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return sections;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CWHomeShopListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopCell" forIndexPath:indexPath];
        [cell bindModel:self.shopListDataArr[indexPath.item]];
        return cell;
    }else if(indexPath.section == 1){
        CWGoodInfoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goodCell" forIndexPath:indexPath];
        [cell bindModel:self.dproductListDataArr[indexPath.item]];
        return cell;
    }else if(indexPath.section == 2){
        CWGoodInfoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"goodCell" forIndexPath:indexPath];
        [cell bindModel:self.rproductListDataArr[indexPath.item]];
        return cell;
    }else{
        CWHomeShopListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"shopCell" forIndexPath:indexPath];
        [cell bindModel:self.prodyctTryListDataArr[indexPath.item]];
        return cell;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake((SCREEN_WIDTH-40)/2, 215);
    }else{
        return CGSizeMake((SCREEN_WIDTH-40)/2, 270);
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    RACTuple *turple = [RACTuple tupleWithObjects:self.shopListDataArr[indexPath.item], indexPath, nil];
    [self.selectCommand execute:turple];
}
#pragma mark - 头部视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    CGSize size = CGSizeMake(SCREEN_WIDTH, 40);
    return size;
}
#pragma mark - 头部视图内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        CWSectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionHeader" forIndexPath:indexPath];

        reusableView = headerView;
    }
    return reusableView;
}

@end
