
## 前沿

* 前段时间项目中遇到的功能，在此稍微整理一下

* 如果大神们有更好建议或方法，欢迎来指导

* 效果图二，在这里只是为了方便而做的特殊处理，也可通过自定义 cell 去布局

* 轻轻的我走了，正如我轻轻的来，我动一动鼠标，就是为了给你 Star (喜欢的朋友别忘了哦 😊 😊）


## 效果图

![](https://github.com/kingsic/SGAdvertScrollView/raw/master/Gif/sorgle.gif) 


### 所用到的第三方

[SDWebImage](https://github.com/rs/SDWebImage.git)


## 代码介绍

* 将项目中 SGAdvertScrollView 文件夹导入工程

* 导入 #import "SGAdvertScrollView.h" 头文件

* 代码创建

#### 例一
```Objective-C
    SGAdvertScrollView *advertScrollView = [[SGAdvertScrollView alloc] init];
    
    advertScrollView.frame = CGRectMake(0, 150, self.view.frame.size.width, 30);
    
    advertScrollView.titleColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    advertScrollView.scrollTimeInterval = 5;
    
    advertScrollView.leftImageString = @"horn_icon";
    
    advertScrollView.titles = @[@"常见电商类 app 滚动播放广告信息", @"采用代理模式封装, 可进行事件点击处理", @"建议去 github 上下载"];
    
    advertScrollView.titleFont = [UIFont systemFontOfSize:15];
    
    advertScrollView.delegateAdvertScrollView = self;
    
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
    NSArray *titleArr = @[@"聚惠女王节，香米更低价满150减10", @"HTC新品首发，预约送大礼包", @"“挑食”进口生鲜，满199减20"];
    
    NSArray *signImageArr = @[@"hot", @"", @"activity"];
    
    NSArray *bottomTitleArr = @[@"满150减10+满79减5", @"12期免息＋免费试用", @"领券满199减20+进口直达"] ;
    
    SGAdvertScrollView *advertScrollView2 = [[SGAdvertScrollView alloc] init];
    
    advertScrollView2.frame = CGRectMake(0, 250, self.view.frame.size.width, 44);
    
    advertScrollView2.leftImageString = @"Tmall_rendian";
    
    advertScrollView2.advertScrollViewStyle = SGAdvertScrollViewStyleTwo;
    
    advertScrollView2.titles = titleArr;
    
    advertScrollView2.signImages = signImageArr;
    
    advertScrollView2.bottomTitles = bottomTitleArr;
    
    advertScrollView2.bottomTitleColor = [UIColor redColor];
    
    [self.view addSubview:advertScrollView2];
```


## Concluding remarks

* 如在使用中, 遇到什么问题或有更好建议者, 请记得 [Issues me](https://github.com/kingsic/SGAdvertScrollView/issues) 或 kingsic@126.com 邮箱联系我

