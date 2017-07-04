//
//  ViewController.m
//  MVVMDemo
//
//  Created by 蜂巢网络科技 on 2017/7/4.
//  Copyright © 2017年 fengchao. All rights reserved.
//

#import "ViewController.h"
#import "PublicWeiboViewModel.h"
#import "PublicCell.h"
#import "UITableView+FDTemplateLayoutCell.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *publicModelArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    PublicWeiboViewModel *publicModel = [[PublicWeiboViewModel alloc] init];

    [publicModel setBlockWithReturnBlock:^(id returnValue) {
        
        [SVProgressHUD dismiss];
        _publicModelArray = returnValue;
        [self.tableView reloadData];


    } WithErrorBlock:^(id errorCode) {
        [SVProgressHUD dismiss];

    } WithFailureBlock:^{
        [SVProgressHUD dismiss];

    }];

    [publicModel fetchPublicWeiBo];
    [SVProgressHUD showWithStatus:@"正在获取用户信息" maskType:SVProgressHUDMaskTypeBlack];
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _publicModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublicCell"];
    [cell setValueWithPublicModel:_publicModelArray[indexPath.row]];
    return cell;
}


- (void)configureCell:(PublicCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = NO;
    [cell setValueWithPublicModel:_publicModelArray[indexPath.row]];
}



#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return [tableView fd_heightForCellWithIdentifier:@"PublicCell" cacheByIndexPath:indexPath configuration:^(PublicCell *cell) {
        [self configureCell:cell atIndexPath:indexPath];
    }];
  
}

@end
