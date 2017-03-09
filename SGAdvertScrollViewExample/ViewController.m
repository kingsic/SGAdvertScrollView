//
//  ViewController.m
//  SGAdvertScrollViewExample
//
//  Created by apple on 17/3/9.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "ViewController.h"
#import "SGAdvertScrollView.h"
#import "SGHelperTool.h"
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
    advertScrollView.titleColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    advertScrollView.image = [UIImage imageNamed:@"horn_icon"];
    advertScrollView.titleArray = @[@"常见电商类 app 滚动播放广告信息", @"采用代理模式封装, 可进行事件点击处理", @"建议去 github 上下载"];
    advertScrollView.titleFont = [UIFont systemFontOfSize:14];
    advertScrollView.advertScrollViewDelegate = self;
    [self.view addSubview:advertScrollView];
    
    
    // 例二
    SGAdvertScrollView *advertScrollView2 = [[SGAdvertScrollView alloc] init];
    advertScrollView2.frame = CGRectMake(0, 250, self.view.frame.size.width, 44);
    advertScrollView2.image = [UIImage imageNamed:@"Tmall_rendian"];
    NSMutableAttributedString *attributedText1 = [SGHelperTool SG_textAttachmentWithImageName:@"hot" imageSize:(CGSizeMake(36, 19)) frontText:@"聚惠女王节，香米更低价满150减10\n" behindText:@"满150减10+满79减5"];
    NSMutableAttributedString *attributedText2 = [SGHelperTool SG_textAttachmentWithImageName:@"" imageSize:(CGSizeMake(0, 0)) frontText:@"HTC新品首发，预约送大礼包\n" behindText:@"12期免息＋免费试用"];
    NSMutableAttributedString *attributedText3 = [SGHelperTool SG_textAttachmentWithImageName:@"activity" imageSize:(CGSizeMake(36, 19)) frontText:@"“挑食”进口生鲜，满199减20\n" behindText:@"领券满199减20+进口直达"];
    advertScrollView2.isHaveMutableAttributedString = YES;
    advertScrollView2.titleArray = @[attributedText1, attributedText2, attributedText3];
    [self.view addSubview:advertScrollView2];
}

/// 代理方法
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index {
    DetailViewController *nextVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}


@end
