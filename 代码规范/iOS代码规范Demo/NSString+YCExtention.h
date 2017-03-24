//
//  NSString+YCExtention.h
//  iOS代码规范Demo
//
//  Created by 刘浩 on 2017/3/16.
//  Copyright © 2017年 超杨. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 分类规范，使用项目前缀开头，此Demo以公司App的前缀开头 */
@interface NSString (YCExtention)

/**
 分类方法，使用App前缀

 @return NSString
 */
- (NSString *)yc_doSomething;

@end
