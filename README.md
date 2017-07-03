
## 效果图

![](https://github.com/kingsic/SGAdvertScrollView/raw/master/Gif/sorgle.gif) 


### Dependency

[SDWebImage](https://github.com/rs/SDWebImage.git)


## SGAdvertScrollView 集成

* 1、CocoaPods 导入 pod 'SGAdvertScrollView'”

* 2、下载、拖拽 “SGAdvertScrollView” 文件夹到工程中


## 代码介绍

#### 例一
```Objective-C    
    _advertScrollView.titleColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];

    _advertScrollView.titles = @[@"常见电商类 app 滚动播放广告信息", @"采用代理模式封装, 可进行事件点击处理", @"建议去 github 上下载"];
    
    _advertScrollView.titleFont = [UIFont systemFontOfSize:14];
    
    _advertScrollView.delegate = self;

    _advertScrollView.scrollTimeInterval = 5;
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
    NSArray *topTitleArr = @[@"聚惠女王节，香米更低价满150减10", @"HTC新品首发，预约送大礼包", @"“挑食”进口生鲜，满199减20"];
    
    NSArray *signImageArr = @[@"hot", @"", @"activity"];
    
    NSArray *bottomTitleArr = @[@"满150减10+满79减5", @"12期免息＋免费试用", @"领券满199减20+进口直达"] ;
    
    _advertScrollView2.advertScrollViewStyle = SGAdvertScrollViewStyleTwo;
    
    _advertScrollView2.topTitles = topTitleArr;
    
    _advertScrollView2.bottomSignImages = signImageArr;
    
    _advertScrollView2.bottomTitles = bottomTitleArr;
    
    _advertScrollView2.bottomTitleColor = [UIColor redColor];
```


## Concluding remarks

* 如在使用中, 遇到什么问题或有更好建议者, 请记得 [Issues me](https://github.com/kingsic/SGAdvertScrollView/issues) 或 kingsic@126.com 邮箱联系我

