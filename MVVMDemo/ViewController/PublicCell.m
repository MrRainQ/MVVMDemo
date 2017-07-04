//
//  PublicCell.m
//  MVVMTest
//
//  Created by 李泽鲁 on 15/1/8.
//  Copyright (c) 2015年 李泽鲁. All rights reserved.
//

#import "PublicCell.h"

@interface PublicCell ()

@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *weiboText;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@end

@implementation PublicCell

- (void)setValueWithPublicModel:(PublicModel *)publicModel {
    
    _userName.text = publicModel.userName;
    _date.text = publicModel.date;
    _weiboText.text = publicModel.text;
    [_headImageView sd_setImageWithURL:publicModel.imageUrl];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
