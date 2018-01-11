//
//  CWHomeShopListCell.m
//  MCLM
//
//  Created by afarsoft on 2018/1/11.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import "CWHomeShopListCell.h"
#import "CWShopListModel.h"

@interface CWHomeShopListCell() 

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation CWHomeShopListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)bindModel:(CWShopListModel *)model{
    [_icon sd_setImageWithURL:[NSURL URLWithString:model.detailImg] placeholderImage:[UIImage imageNamed:@"a"]];
    _name.text = model.name;
}
@end
