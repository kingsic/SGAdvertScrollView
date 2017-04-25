//
//  SGAdvertScrollView.m
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

#import "SGAdvertScrollView.h"
#import "UIImageView+WebCache.h"

@interface SGAdvertScrollViewOneCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *tipsLabel;
@end

@implementation SGAdvertScrollViewOneCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];

        [self.contentView addSubview:self.tipsLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.tipsLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.textColor = [UIColor blackColor];
        _tipsLabel.numberOfLines = 2;
        _tipsLabel.font = [UIFont systemFontOfSize:12];
    }
    return _tipsLabel;
}
@end

@interface SGAdvertScrollViewTwoCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UIImageView *signImageView;
@property (nonatomic, strong) UILabel *bottomLabel;
@end

@implementation SGAdvertScrollViewTwoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.topLabel];
        [self.contentView addSubview:self.signImageView];
        [self.contentView addSubview:self.bottomLabel];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat topLabelX = 0;
    CGFloat topLabelY = 0;
    CGFloat topLabelW = self.frame.size.width;
    CGFloat topLabelH = 0.5 * self.frame.size.height;
    self.topLabel.frame = CGRectMake(topLabelX, topLabelY, topLabelW, topLabelH);
    
    CGFloat signImageViewW = self.signImageView.image.size.width;
    CGFloat signImageViewH = self.signImageView.image.size.height;
    CGFloat signImageViewX = 0;
    CGFloat signImageViewY = topLabelH + 0.5 * (topLabelH - signImageViewH);
    self.signImageView.frame = CGRectMake(signImageViewX, signImageViewY, signImageViewW, signImageViewH);
    
    CGFloat bottomLabelX = CGRectGetMaxX(self.signImageView.frame);
    CGFloat bottomLabelY = CGRectGetMaxY(self.topLabel.frame);
    CGFloat bottomLabelW = self.frame.size.width - bottomLabelX;
    CGFloat bottomLabelH = topLabelH;
    self.bottomLabel.frame = CGRectMake(bottomLabelX, bottomLabelY, bottomLabelW, bottomLabelH);
}
- (UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.textColor = [UIColor blackColor];
        _topLabel.numberOfLines = 2;
        _topLabel.font = [UIFont systemFontOfSize:12];
    }
    return _topLabel;
}
- (UIImageView *)signImageView {
    if (!_signImageView) {
        _signImageView = [[UIImageView alloc] init];
    }
    return _signImageView;
}
- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.textColor = [UIColor blackColor];
        _bottomLabel.numberOfLines = 2;
        _bottomLabel.font = [UIFont systemFontOfSize:12];
    }
    return _bottomLabel;
}
@end

#pragma mark - - - SGAdvertScrollView
@interface SGAdvertScrollView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *tempTitleArr;
@property (nonatomic, strong) NSArray *tempImageArr;
@property (nonatomic, strong) NSArray *tempBottomTitleArr;
@end

@implementation SGAdvertScrollView

static NSUInteger  const SGMaxSections = 100;
static CGFloat const SGMargin = 10;
static NSString *const advertScrollViewOneCell = @"SGAdvertScrollViewOneCell";
static NSString *const advertScrollViewTwoCell = @"SGAdvertScrollViewTwoCell";

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialization];
    [self setupSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
        [self setupSubviews];
    }
    return self;
}

- (void)initialization {
    self.scrollTimeInterval = 3.0;
    [self addTimer];
    self.advertScrollViewStyle = SGAdvertScrollViewStyleNormal;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self setupLeftImageView];
    [self setupCollectionView];
}

- (void)setupLeftImageView {
    self.imageView = [[UIImageView alloc] init];
    [self addSubview:_imageView];
}

- (void)setupCollectionView {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _flowLayout.minimumLineSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollsToTop = NO;
    _collectionView.scrollEnabled = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    // 注册
    [_collectionView registerClass:[SGAdvertScrollViewOneCell class] forCellWithReuseIdentifier:advertScrollViewOneCell];
    [_collectionView registerClass:[SGAdvertScrollViewTwoCell class] forCellWithReuseIdentifier:advertScrollViewTwoCell];
    [self addSubview:_collectionView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置图片尺寸
    CGFloat imageViewX = SGMargin;
    CGFloat imageViewY = 0.5 * SGMargin;
    CGFloat imageViewH = self.frame.size.height - 2 * imageViewY;
    CGFloat imageViewW = imageViewH;
    _imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    
    // 设置 collectionView 尺寸
    CGFloat collectionViewX = CGRectGetMaxX(_imageView.frame) + SGMargin;
    CGFloat collectionViewY = 0;
    CGFloat collectionViewW = self.frame.size.width - collectionViewX - SGMargin;
    CGFloat collectionViewH = self.frame.size.height;
    _collectionView.frame = CGRectMake(collectionViewX, collectionViewY, collectionViewW, collectionViewH);

    // 设置 UICollectionViewFlowLayout 尺寸
    _flowLayout.itemSize = CGSizeMake(_collectionView.frame.size.width, _collectionView.frame.size.height);
    
    // 默认显示最中间的那组
    [self defaultSelectedScetion];
}

/// 默认选中的组
- (void)defaultSelectedScetion {
    if (self.tempTitleArr.count == 0) return; // 为解决加载数据延迟问题
    // 默认显示最中间的那组
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:SGMaxSections / 2] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
}

#pragma mark - - - UICollectionView 的 dataSource 方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return SGMaxSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tempTitleArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.advertScrollViewStyle == SGAdvertScrollViewStyleTwo) {
        SGAdvertScrollViewTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:advertScrollViewTwoCell forIndexPath:indexPath];
        cell.topLabel.text = self.tempTitleArr[indexPath.row];
        NSString *imagePath = self.tempImageArr[indexPath.row];
        if ([imagePath hasPrefix:@"http"]) {
            [cell.signImageView sd_setImageWithURL:[NSURL URLWithString:imagePath]];
        } else {
            cell.signImageView.image = [UIImage imageNamed:imagePath];
        }
        cell.bottomLabel.text = self.tempBottomTitleArr[indexPath.row];
        if (self.titleFont != nil) {
            cell.topLabel.font = self.titleFont;
        }
        if (self.titleColor != nil) {
            cell.topLabel.textColor = self.titleColor;
        }
        if (self.bottomTitleFont != nil) {
            cell.bottomLabel.font = self.bottomTitleFont;
        }
        if (self.bottomTitleColor != nil) {
            cell.bottomLabel.textColor = self.bottomTitleColor;
        }
        return cell;
    } else {
        SGAdvertScrollViewOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:advertScrollViewOneCell forIndexPath:indexPath];
        cell.tipsLabel.text = self.tempTitleArr[indexPath.item];
        if (self.titleFont != nil) {
            cell.tipsLabel.font = self.titleFont;
        }
        if (self.titleColor != nil) {
            cell.tipsLabel.textColor = self.titleColor;
        }
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegateAdvertScrollView && [self.delegateAdvertScrollView respondsToSelector:@selector(advertScrollView:didSelectedItemAtIndex:)]) {
        [self.delegateAdvertScrollView advertScrollView:self didSelectedItemAtIndex:indexPath.item];
    }
}

#pragma mark - - - 创建定时器
- (void)addTimer {
    [self removeTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.scrollTimeInterval target:self selector:@selector(beginUpdateUI) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
#pragma mark - - - 移除定时器
- (void)removeTimer {
    [_timer invalidate];
    _timer = nil;
}
#pragma mark - - - 定时器执行方法 - 更新UI
- (void)beginUpdateUI {
    if (self.tempTitleArr.count == 0) return; // 为解决加载网络图片延迟问题

    // 1、当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    //SGDebugLog(@"currentIndexPath - - %@", currentIndexPath);
    // 马上显示回最中间那组的数据
    NSIndexPath *resetCurrentIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:SGMaxSections / 2];
    //SGDebugLog(@"section - - %ld; item - - %ld", resetCurrentIndexPath.section, resetCurrentIndexPath.item);
    [self.collectionView scrollToItemAtIndexPath:resetCurrentIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];

    // 2、计算出下一个需要展示的位置
    NSInteger nextItem = resetCurrentIndexPath.item + 1;
    NSInteger nextSection = resetCurrentIndexPath.section;
    if (nextItem == self.tempTitleArr.count) {
        nextItem = 0;
        nextSection++;
    }

    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    // 3、通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
}

#pragma mark - - - setting
- (void)setLeftImageString:(NSString *)leftImageString {
    _leftImageString = leftImageString;
    if ([leftImageString hasPrefix:@"http"]) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:leftImageString]];
    } else {
        _imageView.image = [UIImage imageNamed:leftImageString];
    }
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    self.tempTitleArr = [NSArray arrayWithArray:titles];
    [self.collectionView reloadData];
}

- (void)setSignImages:(NSArray *)signImages {
    _signImages = signImages;
    self.tempImageArr = [NSArray arrayWithArray:signImages];
}

- (void)setBottomTitles:(NSArray *)bottomTitles {
    _bottomTitles = bottomTitles;
    
    self.tempBottomTitleArr = [NSArray arrayWithArray:bottomTitles];
}

- (void)setScrollTimeInterval:(CGFloat)scrollTimeInterval {
    _scrollTimeInterval = scrollTimeInterval;
    [self addTimer];
}


@end

