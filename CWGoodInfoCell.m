//
//  CWGoodInfoCell.m
//  MCLM
//
//  Created by afarsoft on 2018/1/11.
//  Copyright © 2018年 afarsoft. All rights reserved.
//

#import "CWGoodInfoCell.h"
#import "CWShopListModel.h"

@interface CWGoodInfoCell()

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation CWGoodInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)bindModel:(CWShopListModel *)model{
    [_img sd_setImageWithURL:[NSURL URLWithString:model.productImage] placeholderImage:[UIImage imageNamed:@"a"]];
    _name.text = model.name;
    _desc.text = model.shopName;
    _price.text = [NSString stringWithFormat:@"￥ %@",model.price];
}
@end
