//
//  ViewModelClass.m
//  MVVMDemo
//
//  Created by 蜂巢网络科技 on 2017/7/4.
//  Copyright © 2017年 fengchao. All rights reserved.
//

#import "ViewModelClass.h"

@implementation ViewModelClass

#pragma 接收传过来的block
- (void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
                 WithErrorBlock: (ErrorCodeBlock) errorBlock
               WithFailureBlock: (FailureBlock) failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}


@end
