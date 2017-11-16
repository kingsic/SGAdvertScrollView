
# SGAdvertScrollView


## 效果图

![](https://github.com/kingsic/SGAdvertScrollView/raw/master/Gif/sorgle.gif) 


### Dependency

[SDWebImage](https://github.com/rs/SDWebImage.git)


## SGAdvertScrollView 集成

* 1、CocoaPods 导入 pod 'SGAdvertScrollView','~> 1.2.7'

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


## 问题及解决方案

#### 1、CocoaPods 安装 SGAdvertScrollView 时，遇到的问题及解决方案

* 若在使用 CocoaPods 安装 SGAdvertScrollView 时，出现 [!] Unable to find a specification for SGAdvertScrollView 提示时，打开终端先输入 pod repo remove master；执行完毕后再输入 pod setup 即可 (可能会等待一段时间)

#### 2、SGAdvertScrollView 滚动存在混乱问题及解决方案（只有 SGAdvertScrollView 的高度或其父视图的高度不为整数时，才会出现）

* 解决方案：高度取整 ceil(SGAdvertScrollView 高度或其父视图高度); 若包装有父视图则父视图高度取整；若无包装父视图则 SGAdvertScrollView 高度取整


## 版本介绍

* 2017-07-20 ：v1.1.8 修复 UICollectionView 偏移量问题

* 2017-08-02 ：v1.2.0 解决标题无数据引起的崩溃问题

* 2017-09-27 ：v1.2.6 API 的规范以及更新到对 SDWebImage 4.1.0 的依赖

* 2017-11-16 ：v1.2.7 解决 Xcode 9 控制台打印问题以及性能优化


## Concluding remarks

* 如在使用中, 遇到什么问题或有更好建议者, 请记得 [Issues me](https://github.com/kingsic/SGAdvertScrollView/issues) 或 kingsic@126.com 邮箱联系我

