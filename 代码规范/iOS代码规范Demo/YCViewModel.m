//
//  YCViewModel.m
//  iOS代码规范Demo
//
//  Created by 超杨 on 16/3/15.
//  Copyright © 2016年 超杨. All rights reserved.
//

#import "YCViewModel.h"
#import <RACDisposable.h>
#import "YCMathRequest.h"

@implementation YCViewModel
- (RACSignal *)getDataSource {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        // 网络请求，此处使用YCMathRequest的子类，不要直接使用
        YCMathRequest *requestCMD = [[YCMathRequest alloc] init];
        [requestCMD startWithCompletionBlockWithSuccess:^(id request) {
            // 成功回调
            [subscriber sendNext:self.dataArray]; // 发送数据
        } failure:^(id request) {
            // 错误回调
            [subscriber sendError:[NSError errorWithDomain:@"error des" code:400 userInfo:nil]];
        }];
        return nil;
    }];
}
@end
