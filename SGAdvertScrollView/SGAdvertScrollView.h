//
//  SGAdvertScrollView.h
//  Version 1.2.7
//  GitHub：https://github.com/kingsic/SGAdvertScrollView
//
//  Created by kingsic on 17/3/8.
//  Copyright © 2017年 kingsic. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SGAdvertScrollView;

typedef enum : NSUInteger {
    /// 一行文字滚动样式
    SGAdvertScrollViewStyleNormal,
    /// 二行文字滚动样式
    SGAdvertScrollViewStyleMore,
} SGAdvertScrollViewStyle;

@protocol SGAdvertScrollViewDelegate <NSObject>
/// delegate 方法
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index;
@end

@interface SGAdvertScrollView : UIView
#pragma mark - - - 公共 API
/** delegate */
@property (nonatomic, weak) id<SGAdvertScrollViewDelegate> delegate;
/** 默认 SGAdvertScrollViewStyleNormal 样式 */
@property (nonatomic, assign) SGAdvertScrollViewStyle advertScrollViewStyle;
/** 滚动时间间隔，默认为3s */
@property (nonatomic, assign) CFTimeInterval scrollTimeInterval;
/** 标题字体字号，默认为13号字体 */
@property (nonatomic, strong) UIFont *titleFont;

#pragma mark - - - SGAdvertScrollViewStyleNormal 样式下的 API
/** 左边标志图片数组 */
@property (nonatomic, strong) NSArray *signImages;
/** 标题数组 */
@property (nonatomic, strong) NSArray *titles;
/** 标题字体颜色，默认为黑色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 标题文字位置，默认为 NSTextAlignmentLeft，仅仅针对标题起作用 */
@property (nonatomic, assign) NSTextAlignment textAlignment;

#pragma mark - - - SGAdvertScrollViewStyleMore 样式下的 API
/** 顶部左边标志图片数组 */
@property (nonatomic, strong) NSArray *topSignImages;
/** 顶部标题数组 */
@property (nonatomic, strong) NSArray *topTitles;
/** 底部左边标志图片数组 */
@property (nonatomic, strong) NSArray *bottomSignImages;
/** 底部标题数组 */
@property (nonatomic, strong) NSArray *bottomTitles;
/** 顶部标题字体颜色，默认为黑色 */
@property (nonatomic, strong) UIColor *topTitleColor;
/** 底部标题字体颜色，默认为黑色 */
@property (nonatomic, strong) UIColor *bottomTitleColor;

@end
