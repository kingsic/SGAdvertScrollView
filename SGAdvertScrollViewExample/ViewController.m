//
//  ViewController.m
//  SGAdvertScrollViewExample
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "ViewController.h"
#import "SGAdvertScrollView.h"
#import "DetailViewController.h"

@interface ViewController () <SGAdvertScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 例一
    SGAdvertScrollView *advertScrollView = [[SGAdvertScrollView alloc] init];
    advertScrollView.frame = CGRectMake(0, 150, self.view.frame.size.width, 30);
    advertScrollView.titleColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    advertScrollView.scrollTimeInterval = 5;
    advertScrollView.leftImageName = @"horn_icon";
    advertScrollView.titles = @[@"常见电商类 app 滚动播放广告信息", @"采用代理模式封装, 可进行事件点击处理", @"建议去 github 上下载"];
    advertScrollView.titleFont = [UIFont systemFontOfSize:14];
    advertScrollView.delegateAdvertScrollView = self;
    advertScrollView.isShowSeparator = NO;
    [self.view addSubview:advertScrollView];
    
    
    // 例二
    NSArray *titleArr = @[@"聚惠女王节，香米更低价满150减10", @"HTC新品首发，预约送大礼包", @"“挑食”进口生鲜，满199减20"];
    NSArray *signImageArr = @[@"hot", @"", @"activity"];
    NSArray *bottomTitleArr = @[@"满150减10+满79减5", @"12期免息＋免费试用", @"领券满199减20+进口直达"] ;
    
    SGAdvertScrollView *advertScrollView2 = [[SGAdvertScrollView alloc] init];
    advertScrollView2.frame = CGRectMake(0, 250, self.view.frame.size.width, 44);
    advertScrollView2.leftImageName = @"Tmall_rendian";
    advertScrollView2.advertScrollViewStyle = SGAdvertScrollViewStyleTwo;
    advertScrollView2.titles = titleArr;
    advertScrollView2.signImages = signImageArr;
    advertScrollView2.bottomTitles = bottomTitleArr;
    advertScrollView2.bottomTitleColor = [UIColor redColor];
    [self.view addSubview:advertScrollView2];
}

/// 代理方法
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index {
    DetailViewController *nextVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


@end
