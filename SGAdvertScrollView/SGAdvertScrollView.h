//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：1357127436
//      Email：kingsic@126.com
//      GitHub：https://github.com/kingsic/SGAdvertScrollView.git
//
//  SGAdvertScrollView.h
//  Version 1.2.5
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
/// delegate
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index;

@end

@interface SGAdvertScrollView : UIView
/** SGAdvertScrollViewDelegate */
@property (nonatomic, weak) id<SGAdvertScrollViewDelegate> delegate;
/** 默认 SGAdvertScrollViewStyleNormal 样式 */
@property (nonatomic, assign) SGAdvertScrollViewStyle advertScrollViewStyle;
/** 滚动时间间隔，默认为3s */
@property (nonatomic, assign) CFTimeInterval scrollTimeInterval;
/** SGAdvertScrollViewStyleNormal 样式下的左边标志图片数组 */
@property (nonatomic, strong) NSArray *signImages;
/** SGAdvertScrollViewStyleNormal 样式下的标题数组 */
@property (nonatomic, strong) NSArray *titles;
/** SGAdvertScrollViewStyleNormal 样式下的标题字体颜色，默认为黑色 */
@property (nonatomic, strong) UIColor *titleColor;
/** SGAdvertScrollViewStyleNormal 样式下的标题文字位置，默认为 NSTextAlignmentLeft，仅仅针对 titles 起作用 */
@property (nonatomic, assign) NSTextAlignment textAlignment;

/** SGAdvertScrollViewStyleMore 样式下的顶部左边标志图片数组 */
@property (nonatomic, strong) NSArray *topSignImages;
/** SGAdvertScrollViewStyleMore 样式下的顶部标题数组 */
@property (nonatomic, strong) NSArray *topTitles;
/** SGAdvertScrollViewStyleMore 样式下的底部左边标志图片数组 */
@property (nonatomic, strong) NSArray *bottomSignImages;
/** SGAdvertScrollViewStyleMore 样式下的底部标题数组 */
@property (nonatomic, strong) NSArray *bottomTitles;
/** SGAdvertScrollViewStyleMore 样式下的顶部标题字体颜色，默认为黑色 */
@property (nonatomic, strong) UIColor *topTitleColor;
/** SGAdvertScrollViewStyleMore 样式下的底部标题字体颜色，默认为黑色 */
@property (nonatomic, strong) UIColor *bottomTitleColor;

/** 标题字体大小，默认为13号字体 */
@property (nonatomic, strong) UIFont *titleFont;

@end
