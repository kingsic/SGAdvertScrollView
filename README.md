
# SGAdvertScrollView


## 效果图

![](https://github.com/kingsic/SGAdvertScrollView/raw/master/Gif/sorgle.gif) 


### Dependency

[SDWebImage](https://github.com/rs/SDWebImage.git)


## SGAdvertScrollView 集成

* 1、CocoaPods 导入 pod 'SGAdvertScrollView'

* 2、下载、拖拽 “SGAdvertScrollView” 文件夹到工程中


## 代码介绍（详细使用，请参考 Demo）

#### 例一
```Objective-C    
    _advertScrollView.titles = @[@"常见电商类 app 滚动播放广告信息", @"采用代理模式封装, 可进行事件点击处理", @"建议去 github 上下载"];
        
    _advertScrollView.delegate = self;
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
    
    NSArray *bottomSignImageArr = @[@"hot", @"", @"activity"];
    
    NSArray *bottomTitleArr = @[@"满150减10+满79减5", @"12期免息＋免费试用", @"领券满199减20+进口直达"] ;
    
    _advertScrollView2.advertScrollViewStyle = SGAdvertScrollViewStyleMore;
    
    _advertScrollView2.topTitles = topTitleArr;
    
    _advertScrollView2.bottomSignImages = bottomSignImageArr;
    
    _advertScrollView2.bottomTitles = bottomTitleArr;
    
    _advertScrollView2.bottomTitleColor = [UIColor redColor];
```


## 版本介绍

* 2017-7-20 --> v1.1.8 修复 UICollectionView 偏移量问题

* 2017-8-2 --> v1.2.0 解决标题无数据引起的崩溃问题


## Concluding remarks

* 如在使用中, 遇到什么问题或有更好建议者, 请记得 [Issues me](https://github.com/kingsic/SGAdvertScrollView/issues) 或 kingsic@126.com 邮箱联系我

