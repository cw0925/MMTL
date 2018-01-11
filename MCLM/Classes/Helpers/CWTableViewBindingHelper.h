//
//  CWTableViewBindingHelper.h
//  MCLM
//
//  Created by afarsoft on 2018/1/11.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TableSelectionBlock)(id model);

@interface CWTableViewBindingHelper : NSObject<UITableViewDataSource, UITableViewDelegate>
{
    UITableView             *_tableView;
    NSArray                 *_data;
    UITableViewCell         *_templateCell;
    RACCommand              *_selectionCommand;
    TableSelectionBlock      _selectionBlock;
}
+ (instancetype) bindingForTableView:(UITableView *)tableView
                        sourceSignal:(RACSignal *)source
                 didSelectionCommand:(RACCommand *)didSelection
                        templateCell:(UINib *)templateCellNib;

+ (instancetype) bindingForTableView:(UITableView *)tableView
                        sourceSignal:(RACSignal *)source
                 didSelectionCommand:(RACCommand *)didSelection
               templateCellClassName:(NSString *)classCell;

+ (instancetype)bindingForTableView:(UITableView *)tableView
                         sourceList:(NSArray *)source
                  didSelectionBlock:(TableSelectionBlock)block
                       templateCell:(UINib *)templateCellNib;

+ (instancetype)bindingForTableView:(UITableView *)tableView
                         sourceList:(NSArray *)source
                  didSelectionBlock:(TableSelectionBlock)block
              templateCellClassName:(NSString *)templateCellClass;

- (void)customInitialization;
- (void)reloadDataWithSourceList:(NSArray *)source;
- (UITableViewCell *)dequeueCellAndBindInTable:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;
@end
