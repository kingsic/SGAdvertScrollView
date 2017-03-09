
## 前沿

* 前段时间项目中遇到的功能，在此稍微整理一下

* 如果大神们有更好建议或方法，欢迎来指导


## 效果图

![](https://github.com/kingsic/SGAdvertScrollView/raw/master/Gif/sorgle.gif) 


## 代码介绍

* 将项目中 SGAdvertScrollView 文件夹导入工程

* 导入 #import "SGAdvertScrollView.h" 头文件

* 代码创建

#### 例一
```Objective-C
    SGAdvertScrollView *advertScrollView = [[SGAdvertScrollView alloc] init];
    advertScrollView.frame = CGRectMake(0, 150, self.view.frame.size.width, 30);
    advertScrollView.image = [UIImage imageNamed:@"horn_icon"];
    advertScrollView.titleArray = @[@"常见电商类 app 滚动播放广告信息", @"采用代理模式封装, 可进行事件点击处理", @"建议去 github 上下载"];
    advertScrollView.titleFont = [UIFont systemFontOfSize:14];
    advertScrollView.advertScrollViewDelegate = self;
    [self.view addSubview:advertScrollView];
```

#### 代理方法
```Objective-C
    - (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index {
        DetailViewController *nextVC = [[DetailViewController alloc] init];
        [self.navigationController pushViewController:nextVC animated:YES];
    }
```

#### 例二
```Objective-C
    SGAdvertScrollView *advertScrollView2 = [[SGAdvertScrollView alloc] init];
    advertScrollView2.frame = CGRectMake(0, 250, self.view.frame.size.width, 44);
    advertScrollView2.image = [UIImage imageNamed:@"Tmall_rendian"];
    NSMutableAttributedString *attributedText1 = [SGHelperTool SG_textAttachmentWithImageName:@"hot" imageSize:(CGSizeMake(36, 19)) frontText:@"聚惠女王节，香米更低价满150减10\n" behindText:@"满150减10+满79减5"];
    NSMutableAttributedString *attributedText2 = [SGHelperTool SG_textAttachmentWithImageName:@"" imageSize:(CGSizeMake(0, 0)) frontText:@"HTC新品首发，预约送大礼包\n" behindText:@"12期免息＋免费试用"];
    NSMutableAttributedString *attributedText3 = [SGHelperTool SG_textAttachmentWithImageName:@"activity" imageSize:(CGSizeMake(36, 19)) frontText:@"“挑食”进口生鲜，满199减20\n" behindText:@"领券满199减20+进口直达"];
    advertScrollView2.isHaveMutableAttributedString = YES;
    advertScrollView2.titleArray = @[attributedText1, attributedText2, attributedText3];
    [self.view addSubview:advertScrollView2];
```


## Concluding remarks

* 如在使用中, 遇到什么问题或有更好建议者, 请记得 [Issues me](https://github.com/kingsic/SGAdvertScrollView/issues) 或 kingsic@126.com 邮箱联系我

