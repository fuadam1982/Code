//
//  YCMathRequest.h
//  iOS代码规范Demo
//
//  Created by 超杨 on 16/7/29.
//  Copyright © 2016年 超杨. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCMathRequest : NSObject
- (void)startWithCompletionBlockWithSuccess:(void (^)(id request))success
                                    failure:(void (^)(id request))failure;
@end
