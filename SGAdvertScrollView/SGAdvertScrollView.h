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

/** delegateAdvertScrollView */
@protocol SGAdvertScrollViewDelegate <NSObject>
- (void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index;

@end

@interface SGAdvertScrollView : UIView
/** delegateAdvertScrollView */
@property (nonatomic, weak) id<SGAdvertScrollViewDelegate> delegateAdvertScrollView;
/** SGAdvertScrollViewStyle */
@property (nonatomic, assign) SGAdvertScrollViewStyle advertScrollViewStyle;
/** 滚动时间间隔(默认 3s) */
@property (nonatomic, assign) CGFloat scrollTimeInterval;
/** 左边提示图片名，注意图片尺寸的高不要超过 SGAdvertScrollView 的高 */
@property (nonatomic, strong) NSString *leftImageName;
/** 右边标题数组，当 SGAdvertScrollViewStyle 为 SGAdvertScrollViewStyleTwo, 此标题数组为 topLabel 标题数组 */
@property (nonatomic, strong) NSArray *titles;
/** 左边标志图片数组，只有 SGAdvertScrollViewStyleTwo 样式时，才有效 */
@property (nonatomic, strong) NSArray *signImages;
/** 左边底部标题数组，只有 SGAdvertScrollViewStyleTwo 样式时，才有效 */
@property (nonatomic, strong) NSArray *bottomTitles;
/** 标题字体大小(默认 12), 当 SGAdvertScrollViewStyle 为 SGAdvertScrollViewStyleTwo, 此 titleFont 为 topLabel 文字大小 */
@property (nonatomic, strong) UIFont *titleFont;
/** 标题字体颜色(默认 黑色), 当 SGAdvertScrollViewStyle 为 SGAdvertScrollViewStyleTwo, 此 titleColor 为 topLabel 文字颜色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 标题字体大小(默认 12), 只有 SGAdvertScrollViewStyleTwo 样式时，才有效 */
@property (nonatomic, strong) UIFont *bottomTitleFont;
/** 标题字体颜色(默认 黑色), 只有 SGAdvertScrollViewStyleTwo 样式时，才有效 */
@property (nonatomic, strong) UIColor *bottomTitleColor;
/** 是否显示分割线(默认为 YES) */
@property (nonatomic, assign) BOOL isShowSeparator;
/** 分割线颜色(默认 浅灰色) */
@property (nonatomic, strong) UIColor *separatorColor;

@end
