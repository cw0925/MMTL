//
//  CWHomeViewModel.h
//  MCLM
//
//  Created by afarsoft on 2018/1/10.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CWHomeViewModel : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) RACCommand *requestCommand;
@property (nonatomic, strong) RACCommand *selectCommand;
//模型数组
@property (nonatomic, copy) NSArray *shopListDataArr;
@property (nonatomic, copy) NSArray *dproductListDataArr;
@property (nonatomic, copy) NSArray *prodyctTryListDataArr;
@property (nonatomic, copy) NSArray *rproductListDataArr;

@end
