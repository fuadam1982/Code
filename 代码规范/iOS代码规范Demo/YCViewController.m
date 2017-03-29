//
//  YCViewController.m
//  洋葱书序iOS代码规范Demo
//
//  Created by 超杨 on 16/3/15.
//  Copyright © 2016年 超杨. All rights reserved.
//

/*!
 *  @author 超杨, 16-03-16 12:03:13
 *
 *  @brief 洋葱数学开发代码规范（草稿），参考：
 *  《effective - 2.0》
 *  《https://github.com/yangchao0033/objc-zen-book-cn》
 *  《http://dev.guanghe.tv/2015/12/iOSCodeFormat.html》
 *   AppleDoc
 *
 *  @since 2.5.0
 */


/** 头文件导入大概分组，如果不全面，自己根据自己的补充 */

#pragma mark - view

#pragma mark - viewController
#import "YCViewController.h"// 头文件导入

#pragma mark - model

#pragma mark - ViewModel
#import "YCViewModel.h"

#pragma mark - utils
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "NSString+YCExtention.h"

/** 如果只是的全局变量声明替换，推荐使用常量定义 */
#define METHOD(a) [NSString stringWithFormat:@"%@", a] // 内部宏定义，除非是只能用宏来完成，否则推荐使用常量定义，例如cellID,通知名

// 常量定义,私有常量用首字母k标注
static NSString * const kCellId = @"cell";
// 外部公用常量：类名 + 常量名，并且在头文件中 extern 声明
NSString * const YCViewControllerNotificationName = @"YCViewControllerNotificationName";

@interface YCViewController ()<UITableViewDelegate, UITableViewDataSource> {
    //成员变量命名以下划线“_”开头；但是不建议使用了，建议使用@property声明
    UILabel *_nameLabel;
}
/** 
 *  在消息发送的时候增加的开销是微不足道的。更多关于性能问题的介绍你可以看 Should I Use a Property or an Instance Variable?(http://blog.bignerdranch.com/4005-should-i-use-a-property-or-an-instance-variable/) 所以，在属性和变量之间，尽可能的使用属性吧，除非有特别的需要
 */
/** viewModel // 推荐使用长的、描述性的方法和变量名。 */
@property (nonatomic, strong) YCViewModel *viewModel;
/** 名称 */
@property (nonatomic, copy) NSString *name;
/** 不推荐使用int */
//@property (nonatomic, assign) int age;
/** 年龄 */
@property (nonatomic, assign) NSInteger age;
/** 状态 */
@property (nonatomic, assign) YCViewControllerState state;
/** 列表 tableview */
@property (nonatomic, strong) UITableView *tableView;
/** 属性应该尽可能描述性地命名，避免缩写，并且是小写字母开头的驼峰命名，不推荐setBtn 缩写命名 */
@property (nonatomic, strong) UIButton *settingButton;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataSource;

- (void)layoutUI;// 内部.m方法注释用“//”简洁易懂,另外内部使用的私有方法或事件处理方法等最好在这里声明一下，方便归类查找

- (void)bindViewModel; // 绑定viewModel

@end

@implementation YCViewController

#pragma mark - delloc & init
//delloc 和 init 写在最前面，保持醒目
- (void)dealloc {
    
}

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    if (!(self = [super init])) {
        // 尽量在不满足条件时及时return
        return nil;
    }
    // 初始化时，如果需要给声明的属性赋值，需要使用_name，在其他地方建议使用self.name
    _name = [name copy];
    _age = age;
    _dataSource = [NSMutableArray array];
    return self;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self layoutUI];
    [self bindViewModel];
    // 尽量使用字面量，','跟随上一个元素 ‘,’后面有空格 eg: @"Matt", @"Chris"
    NSArray *names = @[@"Brian", @"Matt", @"Chris", @"Alex", @"Steve", @"Paul"];
    NSDictionary *productManagers = @{@"iPhone" : @"Kate", @"iPad" : @"Kamal", @"Mobile Web" : @"Bill"};
    NSNumber *shouldUseLiterals = @YES;
    NSNumber *buildingZIPCode = @10018; // @(10018)
    #pragma unused (names,productManagers,shouldUseLiterals,buildingZIPCode) // 忽略没有用的警告
    
    NSError *error = nil;
    // ...
    if (!error) { // 推荐使用括号划定作用范围，使用!判断条件，不推荐 if(error == nil) return;
        // ...
        return;
    }
    // 多参数方法调用规范,让“:”保持对其
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options:UIViewAnimationOptionRepeat
                     animations:^{
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
    // 不推荐
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionRepeat animations:^{
        
                     } completion:^(BOOL finished) {
                         
                     }];
    
    //多判断条件的if else 的使用规范
    if (names.count > 0
        && productManagers
        && shouldUseLiterals
        && buildingZIPCode) {
        NSLog(@"");
    } else {
        NSLog(@"");
    }
    //对于算数的时候 ==>> 推荐使用
    if (11 + 22 <= 100) {
        
    }
    //下面 ==>> 不推荐使用，切记有空格都有，没有都没有
    if (1+1+2+5+22 < 100) {
        
    }
    //switch
    NSInteger index = 2;
    switch (index) {
        case 1: {
        
        } break;
        case 2: {
            
        } break;
        case 3: {
            
        } break;
    }

}

//方法书写规范：类方法/对象方法（+/-） 空格 （返回类型）方法名 空格 花括号{ -- 结果就是下面这样
- (void)justDoIt {

}

//两个方法之间空一行
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event response
// 事件响应

#pragma mark - ControllerDataSource
// 苹果SDK提供数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
//    [cell setModel:self.dataSource[indexPath.row]]; // 设置模型
    return cell;
}

#pragma mark - ControllerDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
// 苹果SDK提供的代理
#pragma mark - CustomDelegate

// 自定义的代理
#pragma mark - public methods
- (void)doSomeThingWithNumber:(NSInteger)num {
    self.age += num;
}

#pragma mark - private methods
// 当前控制器使用的私有文件
- (void)layoutUI {
    // UI布局主要为add添加相关，具体配置在get方法中实现
    [self.view addSubview:[self tableView]];
    // 注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellId];
    // 注意空格 UILabel *nameLabel 有一个空格 = 等号两边各有一个空格 [[UILabel alloc] initWith... init 之前有一个空格
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100.f, 20.f)];
    [self.view addSubview:nameLabel];
}

- (void)bindViewModel {
    //** 绑定方法和信号对象不限，可自己更具逻辑选择 */
    @weakify(self); // weak - strong dance
    [[self.viewModel getDataSource] subscribeNext:^(id x) {
        @strongify(self);
        NSArray *dataArray = (NSArray *)x;
        self.dataSource = [NSMutableArray arrayWithArray:dataArray];
        [self.tableView reloadData];
    } error:^(NSError *error) {
        // error 处理
    }];
    [RACObserve(self, viewModel) subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
}

#pragma mark - getter and setter
/** 视情况而定，不一定在这里初始化 初始化使用_tableView */
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
