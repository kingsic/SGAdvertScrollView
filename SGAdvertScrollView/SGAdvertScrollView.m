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

@interface SGAdvertScrollViewCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *tipsLabel;
@end

@implementation SGAdvertScrollViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];

        [self.contentView addSubview:self.tipsLabel];
    }
    return self;
}
- (UILabel *)tipsLabel {
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _tipsLabel.textColor = [UIColor blackColor];
        _tipsLabel.numberOfLines = 2;
        _tipsLabel.font = [UIFont systemFontOfSize:12];
    }
    return _tipsLabel;
}
@end

#pragma mark - - - SGAdvertScrollView
@interface SGAdvertScrollView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *tempArr;
@end

@implementation SGAdvertScrollView

static NSUInteger  const SGMaxSections = 100;
static CGFloat const SGMargin = 10;

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self setupLeftImageView];
    [self setupCollectionView];
    self.timeInterval = 3.0;
    self.isHaveMutableAttributedString = NO;
    // 添加定时器
    [self addTimer];
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
    [_collectionView registerClass:[SGAdvertScrollViewCell class] forCellWithReuseIdentifier:@"tipsCell"];
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
    if (self.tempArr.count == 0) return; // 为解决加载数据延迟问题
    // 默认显示最中间的那组
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:SGMaxSections / 2] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
}

#pragma mark - - - UICollectionView 的 dataSource 方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return SGMaxSections;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tempArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SGAdvertScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tipsCell" forIndexPath:indexPath];
    if (self.isHaveMutableAttributedString == YES) {
        cell.tipsLabel.attributedText = self.tempArr[indexPath.item];
    } else {
        cell.tipsLabel.text = self.tempArr[indexPath.item];
    }
    if (self.titleFont != nil) {
        cell.tipsLabel.font = self.titleFont;
    }
    if (self.titleColor != nil) {
        cell.tipsLabel.textColor = self.titleColor;
    }
    return cell;
}
#pragma mark - - - UICollectionView 的 delegate 方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.advertScrollViewDelegate && [self.advertScrollViewDelegate respondsToSelector:@selector(advertScrollView:didSelectedItemAtIndex:)]) {
        [self.advertScrollViewDelegate advertScrollView:self didSelectedItemAtIndex:indexPath.item];
    }
}

#pragma mark - - - 创建定时器
- (void)addTimer {
    [self removeTimer];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(beginUpdateUI) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
#pragma mark - - - 移除定时器
- (void)removeTimer {
    [_timer invalidate];
    _timer = nil;
}
#pragma mark - - - 定时器执行方法 - 更新UI
- (void)beginUpdateUI {
    if (self.tempArr.count == 0) return; // 为解决加载网络图片延迟问题

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
    if (nextItem == self.tempArr.count) {
        nextItem = 0;
        nextSection++;
    }

    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    // 3、通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
}

#pragma mark - - - setting
- (void)setImage:(UIImage *)image {
    _image = image;
    _imageView.image = image;
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    self.tempArr = [NSArray arrayWithArray:titleArray];
}

- (void)setTimeInterval:(CGFloat)timeInterval {
    _timeInterval = timeInterval;
    [self addTimer];
}


@end

