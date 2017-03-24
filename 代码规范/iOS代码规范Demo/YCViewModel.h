//
//  YCViewModel.h
//  iOS代码规范Demo
//
//  Created by 超杨 on 16/3/15.
//  Copyright © 2016年 超杨. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Foundation/Foundation.h>

@interface YCViewModel : NSObject
/** 数据源 */
@property (nonatomic, strong) NSArray *dataArray;

/**
 获取数据源

 @return 信号
 */
- (RACSignal *)getDataSource;

@end
