//
//  CWCollectionViewBindingHelper.h
//  MCLM
//
//  Created by afarsoft on 2018/1/11.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CollectionSelectionBlock)(id model);

@interface CWCollectionViewBindingHelper : NSObject<UICollectionViewDataSource, UICollectionViewDelegate>{
    NSMutableArray              *_data;
    UICollectionView            *_collectionView;
    UICollectionViewCell        *_templateCell;
    RACCommand                  *_selectCommand;
    CollectionSelectionBlock     _selectBlock;
}

+ (instancetype)bindWithCollectionView:(UICollectionView *)collectionView
                            dataSource:(RACSignal *)source
                      selectionCommand:(RACCommand *)command
                          templateCell:(UINib *)nibCell;

+ (instancetype)bindWithCollectionView:(UICollectionView *)collectionView
                            dataSource:(RACSignal *)source
                      selectionCommand:(RACCommand *)command
                 templateCellClassName:(NSString *)classCell;

+ (instancetype)bindingForCollectionView:(UICollectionView *)collectionView
                              sourceList:(NSArray *)source
                       didSelectionBlock:(CollectionSelectionBlock)block
                            templateCell:(UINib *)templateCellNib;

+ (instancetype)bindingForCollectionView:(UICollectionView *)collectionView
                              sourceList:(NSArray *)source
                       didSelectionBlock:(CollectionSelectionBlock)block
                   templateCellClassName:(NSString *)templateCellClass;
- (void)customInitialization;
- (void)reloadDataWithSourceList:(NSArray *)source;
- (UICollectionViewCell *)dequeueCellAndBindInCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;
@end
