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
@property (weak, nonatomic) IBOutlet SGAdvertScrollView *advertScrollViewTop;
@property (weak, nonatomic) IBOutlet SGAdvertScrollView *advertScrollView;
@property (weak, nonatomic) IBOutlet SGAdvertScrollView *advertScrollViewCenter;
@property (weak, nonatomic) IBOutlet SGAdvertScrollView *advertScrollView2;
@property (weak, nonatomic) IBOutlet SGAdvertScrollView *advertScrollViewBottom;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // top
    _advertScrollViewTop.titles = @[@"京东、天猫等 app 首页常见的广告滚动视图", @"采用代理设计模式进行封装, 可进行事件点击处理", @"建议在 github 上下载"];
    _advertScrollViewTop.titleColor = [UIColor redColor];
    _advertScrollViewTop.textAlignment = NSTextAlignmentCenter;
    
    
    // 例二
    _advertScrollView.signImages = @[@"hot", @"", @"activity"];
    _advertScrollView.titles = @[@"京东、天猫等 app 首页常见的广告滚动视图", @"采用代理设计模式进行封装, 可进行事件点击处理", @"建议在 github 上下载"];
    
    
    // center
    _advertScrollViewCenter.titleColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    _advertScrollViewCenter.scrollTimeInterval = 5;
    _advertScrollViewCenter.titles = @[@"京东、天猫等 app 首页常见的广告滚动视图", @"采用代理设计模式进行封装, 可进行事件点击处理", @"建议在 github 上下载"];
    _advertScrollViewCenter.titleFont = [UIFont systemFontOfSize:14];
    _advertScrollViewCenter.delegate = self;
    
    
    // 例四
    NSArray *topTitleArr = @[@"聚惠女王节，香米更低价满150减10", @"HTC新品首发，预约送大礼包", @"“挑食”进口生鲜，满199减20"];
    NSArray *signImageArr = @[@"hot", @"", @"activity"];
    NSArray *bottomTitleArr = @[@"满150减10+满79减5", @"12期免息＋免费试用", @"领券满199减20+进口直达"];
    _advertScrollView2.advertScrollViewStyle = SGAdvertScrollViewStyleMore;
    _advertScrollView2.topTitles = topTitleArr;
    _advertScrollView2.bottomSignImages = signImageArr;
    _advertScrollView2.bottomTitles = bottomTitleArr;
    _advertScrollView2.bottomTitleColor = [UIColor redColor];
    
    
    // bottom
    _advertScrollViewBottom.advertScrollViewStyle = SGAdvertScrollViewStyleMore;
    _advertScrollViewBottom.topSignImages = @[@"dot", @"dot", @"dot"];
    _advertScrollViewBottom.topTitles = @[@"聚惠女王节，香米更低价满150减10", @"HTC新品首发，预约送大礼包", @"“挑食”进口生鲜，满199减20"];
    _advertScrollViewBottom.bottomSignImages = @[@"dot", @"dot", @"dot"];
    _advertScrollViewBottom.bottomTitles = @[@"满150减10+满79减5", @"12期免息＋免费试用", @"领券满199减20+进口直达"];
}

/// 代理方法
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index {
    DetailViewController *nextVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


@end
