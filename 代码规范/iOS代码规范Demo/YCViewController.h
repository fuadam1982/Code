//
//  YCViewController.h
//  iOS代码规范Demo
//
//  Created by 超杨 on 16/3/15.
//  Copyright © 2016年 超杨. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 枚举遵循苹果官方命名规则：类名 + enum类型名 */
typedef NS_ENUM(NSUInteger, YCViewControllerState) {
    YCViewControllerStateNone, // 具体：类名+enum类型名+状态名
    YCViewControllerStateIdle,
    YCViewControllerStateRunning,
};

/** 通知名 */
extern NSString * const YCViewControllerNotificationName;

@interface YCViewController : UIViewController
/** 外部变量可用块注释,符合doc规范，属性变量都采取驼峰命名方法 */
/** 名字 */
@property (nonatomic, copy , readonly) NSString  *name; // 对暴漏的属性如果非必要，尽量readonly，保证可控
/** 年龄 */
@property (nonatomic, assign, readonly) NSInteger age; //记得空格
/** 状态 */
@property (nonatomic, assign, readonly) YCViewControllerState state;

/**
 重写init方法，传入参数

 @param name 名称
 @param age 年龄
 @return 本类实体对象
 */
- (instancetype)initWithName:(NSString *)name
                         age:(NSInteger)age; // 方法名之间尽量少用 and 多参数记得换行

/**
 传一个数值作为参数

 @param num 一个整数
 */
- (void)doSomeThingWithNumber:(NSInteger)num;//注释使用Xocde自带提示就行 option+command+/

@end

