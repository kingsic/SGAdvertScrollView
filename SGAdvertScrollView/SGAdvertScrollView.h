//
//  SGAdvertScrollView.h
//  SGAdvertScrollView
//
//  Created by Sorgle on 17/3/8.
//  Copyright © 2017年 Sorgle. All rights reserved.
//
//  - - - - - - - - - - - - - - 交流QQ：1357127436 - - - - - - - - - - - - - - - //
//
//  - - 如在使用中, 遇到什么问题或者有更好建议者, 请于 kingsic@126.com 邮箱联系 - - - - //
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//  - - GitHub下载地址 https://github.com/kingsic/SGAdvertScrollView.git - — - - //
//
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //

#import <UIKit/UIKit.h>
@class SGAdvertScrollView;

typedef enum : NSUInteger {
    SGAdvertScrollViewStyleNormal,
    SGAdvertScrollViewStyleTwo,
} SGAdvertScrollViewStyle;

@protocol SGAdvertScrollViewDelegate <NSObject>
/**
 *  delegate
 *
 *  @param index    item 对应的下标
 */
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index;

@end

@interface SGAdvertScrollView : UIView
/** delegate */
@property (nonatomic, weak) id<SGAdvertScrollViewDelegate> delegate;
/** 默认 SGAdvertScrollViewStyleNormal 样式 */
@property (nonatomic, assign) SGAdvertScrollViewStyle advertScrollViewStyle;
/** 滚动时间间隔(默认 3s) */
@property (nonatomic, assign) CGFloat scrollTimeInterval;
/** SGAdvertScrollViewStyleNormal 样式，才有效 */
@property (nonatomic, strong) NSArray *signImages;
/** SGAdvertScrollViewStyleNormal 样式，才有效 */
@property (nonatomic, strong) NSArray *titles;
/** 标题字体颜色(默认 黑色), SGAdvertScrollViewStyleNormal 样式，才有效 */
@property (nonatomic, strong) UIColor *titleColor;
/** 标题文字是否居中，不对 signImages 有效，(默认为 No) */
@property (nonatomic, assign) BOOL isTextAlignmentCenter;

/** SGAdvertScrollViewStyleTwo 样式，才有效 */
@property (nonatomic, strong) NSArray *topSignImages;
/** SGAdvertScrollViewStyleTwo 样式，才有效 */
@property (nonatomic, strong) NSArray *topTitles;
/** SGAdvertScrollViewStyleTwo 样式，才有效 */
@property (nonatomic, strong) NSArray *bottomSignImages;
/** SGAdvertScrollViewStyleTwo 样式，才有效 */
@property (nonatomic, strong) NSArray *bottomTitles;
/** 标题字体颜色(默认 黑色), SGAdvertScrollViewStyleTwo 样式，才有效 */
@property (nonatomic, strong) UIColor *topTitleColor;
/** 标题字体颜色(默认 黑色), SGAdvertScrollViewStyleTwo 样式，才有效 */
@property (nonatomic, strong) UIColor *bottomTitleColor;

/** 标题字体大小(默认 12) */
@property (nonatomic, strong) UIFont *titleFont;

@end
