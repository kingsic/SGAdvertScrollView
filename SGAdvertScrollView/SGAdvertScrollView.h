//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：1357127436
//      Email：kingsic@126.com
//      GitHub：https://github.com/kingsic/SGAdvertScrollView.git
//
//  SGAdvertScrollView.h
//  Version 1.2.0
//
//  Created by kingsic on 17/3/8.
//  Copyright © 2017年 kingsic. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SGAdvertScrollView;

typedef enum : NSUInteger {
    SGAdvertScrollViewStyleNormal,
    SGAdvertScrollViewStyleMore,
} SGAdvertScrollViewStyle;

@protocol SGAdvertScrollViewDelegate <NSObject>
/// delegate
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index;

@end

@interface SGAdvertScrollView : UIView
/** delegate */
@property (nonatomic, weak) id<SGAdvertScrollViewDelegate> delegate;
/** 默认 SGAdvertScrollViewStyleNormal 样式 */
@property (nonatomic, assign) SGAdvertScrollViewStyle advertScrollViewStyle;
/** 滚动时间间隔(默认 3s) */
@property (nonatomic, assign) CFTimeInterval scrollTimeInterval;
/** SGAdvertScrollViewStyleNormal 样式，才有效 */
@property (nonatomic, strong) NSArray *signImages;
/** SGAdvertScrollViewStyleNormal 样式，才有效 */
@property (nonatomic, strong) NSArray *titles;
/** 标题字体颜色(默认 黑色), SGAdvertScrollViewStyleNormal 样式，才有效 */
@property (nonatomic, strong) UIColor *titleColor;
/** 标题文字是否居中 (默认为 No)，SGAdvertScrollViewStyleNormal 样式，才有效且不对 signImages 起作用 */
@property (nonatomic, assign) BOOL isTextAlignmentCenter;

/** SGAdvertScrollViewStyleMore 样式，才有效 */
@property (nonatomic, strong) NSArray *topSignImages;
/** SGAdvertScrollViewStyleMore 样式，才有效 */
@property (nonatomic, strong) NSArray *topTitles;
/** SGAdvertScrollViewStyleMore 样式，才有效 */
@property (nonatomic, strong) NSArray *bottomSignImages;
/** SGAdvertScrollViewStyleMore 样式，才有效 */
@property (nonatomic, strong) NSArray *bottomTitles;
/** 标题字体颜色(默认 黑色), SGAdvertScrollViewStyleMore 样式，才有效 */
@property (nonatomic, strong) UIColor *topTitleColor;
/** 标题字体颜色(默认 黑色), SGAdvertScrollViewStyleMore 样式，才有效 */
@property (nonatomic, strong) UIColor *bottomTitleColor;

/** 标题字体大小(默认 13) */
@property (nonatomic, strong) UIFont *titleFont;

@end
