//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：1357127436
//      Email：kingsic@126.com
//      GitHub：(https://github.com/kingsic/SGAdvertScrollView.git）
//
//  SGAdvertScrollView.m
//  SGAdvertScrollView
//
//  Created by Sorgle on 17/3/8.
//  Copyright © 2017年 Sorgle. All rights reserved.
//

#import "SGAdvertScrollView.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SGAdvertScrollViewOneCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *signImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation SGAdvertScrollViewOneCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.signImageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat spacing = 5;
    
    CGFloat signImageViewW = self.signImageView.image.size.width;
    CGFloat signImageViewH = self.signImageView.image.size.height;
    CGFloat signImageViewX = 0;
    CGFloat signImageViewY = 0;
    self.signImageView.frame = CGRectMake(signImageViewX, signImageViewY, signImageViewW, signImageViewH);
    
    CGFloat labelX = 0;
    if (self.signImageView.image == nil) {
        labelX = 0;
    } else {
        labelX = CGRectGetMaxX(self.signImageView.frame) + 0.5 * spacing;
    }
    CGFloat labelY = 0;
    CGFloat labelW = self.frame.size.width - labelX;
    CGFloat labelH = self.frame.size.height;
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    CGPoint topPoint = self.signImageView.center;
    topPoint.y = _titleLabel.center.y;
    _signImageView.center = topPoint;
}

- (UIImageView *)signImageView {
    if (!_signImageView) {
        _signImageView = [[UIImageView alloc] init];
    }
    return _signImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    }
    return _titleLabel;
}
@end

@interface SGAdvertScrollViewTwoCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *topSignImageView;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UIImageView *bottomSignImageView;
@property (nonatomic, strong) UILabel *bottomLabel;
@end

@implementation SGAdvertScrollViewTwoCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.topSignImageView];
        [self.contentView addSubview:self.topLabel];
        [self.contentView addSubview:self.bottomSignImageView];
        [self.contentView addSubview:self.bottomLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat spacing = 5;
    
    CGFloat topSignImageViewW = self.topSignImageView.image.size.width;
    CGFloat topSignImageViewH = self.topSignImageView.image.size.height;
    CGFloat topSignImageViewX = 0;
    CGFloat topSignImageViewY = spacing;
    self.topSignImageView.frame = CGRectMake(topSignImageViewX, topSignImageViewY, topSignImageViewW, topSignImageViewH);
    
    CGFloat topLabelX = 0;
    if (self.topSignImageView.image == nil) {
        topLabelX = 0;
    } else {
        topLabelX = CGRectGetMaxX(self.topSignImageView.frame) + 0.5 * spacing;
    }
    CGFloat topLabelY = topSignImageViewY;
    CGFloat topLabelW = self.frame.size.width - topLabelX;
    CGFloat topLabelH = 0.5 * (self.frame.size.height - 2 * topLabelY);
    self.topLabel.frame = CGRectMake(topLabelX, topLabelY, topLabelW, topLabelH);
    
    CGPoint topPoint = self.topSignImageView.center;
    topPoint.y = _topLabel.center.y;
    _topSignImageView.center = topPoint;
    
    CGFloat bottomSignImageViewW = self.bottomSignImageView.image.size.width;
    CGFloat bottomSignImageViewH = self.bottomSignImageView.image.size.height;
    CGFloat bottomSignImageViewX = 0;
    CGFloat bottomSignImageViewY = CGRectGetMaxY(self.topLabel.frame);
    self.bottomSignImageView.frame = CGRectMake(bottomSignImageViewX, bottomSignImageViewY, bottomSignImageViewW, bottomSignImageViewH);
    
    CGFloat bottomLabelX = 0;
    if (self.bottomSignImageView.image == nil) {
        bottomLabelX = 0;
    } else {
        bottomLabelX = CGRectGetMaxX(self.bottomSignImageView.frame) + 0.5 * spacing;
    }
    CGFloat bottomLabelY = CGRectGetMaxY(self.topLabel.frame);
    CGFloat bottomLabelW = self.frame.size.width - bottomLabelX;
    CGFloat bottomLabelH = topLabelH;
    self.bottomLabel.frame = CGRectMake(bottomLabelX, bottomLabelY, bottomLabelW, bottomLabelH);
    
    CGPoint bottomPoint = self.bottomSignImageView.center;
    bottomPoint.y = _bottomLabel.center.y;
    _bottomSignImageView.center = bottomPoint;
}

- (UIImageView *)topSignImageView {
    if (!_topSignImageView) {
        _topSignImageView = [[UIImageView alloc] init];
    }
    return _topSignImageView;
}

- (UILabel *)topLabel {
    if (!_topLabel) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.textColor = [UIColor blackColor];
        _topLabel.font = [UIFont systemFontOfSize:12];
    }
    return _topLabel;
}

- (UIImageView *)bottomSignImageView {
    if (!_bottomSignImageView) {
        _bottomSignImageView = [[UIImageView alloc] init];
    }
    return _bottomSignImageView;
}

- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.textColor = [UIColor blackColor];
        _bottomLabel.font = [UIFont systemFontOfSize:12];
    }
    return _bottomLabel;
}
@end

@interface SGAdvertScrollView () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSArray *imageArr;
@property (nonatomic, strong) NSArray *bottomImageArr;
@property (nonatomic, strong) NSArray *bottomTitleArr;
@end

@implementation SGAdvertScrollView

static NSUInteger  const advertScrollViewMaxSections = 100;
static NSString *const advertScrollViewOneCell = @"SGAdvertScrollViewOneCell";
static NSString *const advertScrollViewTwoCell = @"SGAdvertScrollViewTwoCell";

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialization];
    [self setupSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initialization];
        [self setupSubviews];
    }
    return self;
}

- (void)initialization {
    _scrollTimeInterval = 3.0;
    _isTextAlignmentCenter = NO;
    
    [self addTimer];
    _advertScrollViewStyle = SGAdvertScrollViewStyleNormal;
}

- (void)setupSubviews {
    [self addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[SGAdvertScrollViewOneCell class] forCellWithReuseIdentifier:advertScrollViewOneCell];
        [_collectionView registerClass:[SGAdvertScrollViewTwoCell class] forCellWithReuseIdentifier:advertScrollViewTwoCell];
    }
    return _collectionView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat collectionViewX = 0;
    CGFloat collectionViewY = 0;
    CGFloat collectionViewW = self.frame.size.width;
    CGFloat collectionViewH = self.frame.size.height;
    _collectionView.frame = CGRectMake(collectionViewX, collectionViewY, collectionViewW, collectionViewH);

    _flowLayout.itemSize = CGSizeMake(_collectionView.frame.size.width, _collectionView.frame.size.height);
    
    [self defaultSelectedScetion];
}

- (void)defaultSelectedScetion {
    if (self.titleArr.count == 0) return;

    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0.5 * advertScrollViewMaxSections] atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
}

#pragma mark - - - UICollectionView 的 dataSource、delegate方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return advertScrollViewMaxSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.advertScrollViewStyle == SGAdvertScrollViewStyleTwo) {
        SGAdvertScrollViewTwoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:advertScrollViewTwoCell forIndexPath:indexPath];
        NSString *topImagePath = self.imageArr[indexPath.item];
        if ([topImagePath hasPrefix:@"http"]) {
            [cell.topSignImageView sd_setImageWithURL:[NSURL URLWithString:topImagePath]];
        } else {
            cell.topSignImageView.image = [UIImage imageNamed:topImagePath];
        }
        cell.topLabel.text = self.titleArr[indexPath.item];

        NSString *imagePath = self.bottomImageArr[indexPath.item];
        if ([imagePath hasPrefix:@"http"]) {
            [cell.bottomSignImageView sd_setImageWithURL:[NSURL URLWithString:imagePath]];
        } else {
            cell.bottomSignImageView.image = [UIImage imageNamed:imagePath];
        }
        cell.bottomLabel.text = self.bottomTitleArr[indexPath.item];

        if (self.titleFont != nil) {
            cell.topLabel.font = self.titleFont;
            cell.bottomLabel.font = self.titleFont;
        }

        if (self.topTitleColor != nil) {
            cell.topLabel.textColor = self.topTitleColor;
        }
        if (self.bottomTitleColor != nil) {
            cell.bottomLabel.textColor = self.bottomTitleColor;
        }
        return cell;
        
    } else {
        SGAdvertScrollViewOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:advertScrollViewOneCell forIndexPath:indexPath];
        NSString *imagePath = self.imageArr[indexPath.item];
        if ([imagePath hasPrefix:@"http"]) {
            [cell.signImageView sd_setImageWithURL:[NSURL URLWithString:imagePath]];
        } else {
            cell.signImageView.image = [UIImage imageNamed:imagePath];
        }
        if (self.isTextAlignmentCenter == YES) {
            cell.titleLabel.textAlignment = NSTextAlignmentCenter;
        }
        cell.titleLabel.text = self.titleArr[indexPath.item];
        if (self.titleFont != nil) {
            cell.titleLabel.font = self.titleFont;
        }
        if (self.titleColor != nil) {
            cell.titleLabel.textColor = self.titleColor;
        }
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(advertScrollView:didSelectedItemAtIndex:)]) {
        [self.delegate advertScrollView:self didSelectedItemAtIndex:indexPath.item];
    }
}

#pragma mark - - - NSTimer
- (void)addTimer {
    [self removeTimer];

    self.timer = [NSTimer timerWithTimeInterval:self.scrollTimeInterval target:self selector:@selector(beginUpdateUI) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    [_timer invalidate];
    _timer = nil;
}

- (void)beginUpdateUI {
    if (self.titleArr.count == 0) return;

    // 1、当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];

    // 马上显示回最中间那组的数据
    NSIndexPath *resetCurrentIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:0.5 * advertScrollViewMaxSections];
    [self.collectionView scrollToItemAtIndexPath:resetCurrentIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];

    // 2、计算出下一个需要展示的位置
    NSInteger nextItem = resetCurrentIndexPath.item + 1;
    NSInteger nextSection = resetCurrentIndexPath.section;
    if (nextItem == self.titleArr.count) {
        nextItem = 0;
        nextSection++;
    }

    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    // 3、通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
}

#pragma mark - - - setting
- (void)setAdvertScrollViewStyle:(SGAdvertScrollViewStyle)advertScrollViewStyle {
    _advertScrollViewStyle = advertScrollViewStyle;
    if (advertScrollViewStyle == SGAdvertScrollViewStyleTwo) {
        _advertScrollViewStyle = SGAdvertScrollViewStyleTwo;
    }
}

- (void)setSignImages:(NSArray *)signImages {
    _signImages = signImages;
    if (signImages) {
        self.imageArr = [NSArray arrayWithArray:signImages];
    }
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    if (titles.count == 0 || titles.count == 1) {
        [self removeTimer];
    } else {
        [self addTimer];
    }
    self.titleArr = [NSArray arrayWithArray:titles];
    [self.collectionView reloadData];
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
}

- (void)setIsTextAlignmentCenter:(BOOL)isTextAlignmentCenter {
    _isTextAlignmentCenter = isTextAlignmentCenter;
}

- (void)setTopSignImages:(NSArray *)topSignImages {
    _topSignImages = topSignImages;
    if (topSignImages) {
        self.imageArr = [NSArray arrayWithArray:topSignImages];
    }
}

- (void)setTopTitles:(NSArray *)topTitles {
    _topTitles = topTitles;
    if (topTitles.count == 0 || topTitles.count == 1) {
        [self removeTimer];
    } else {
        [self addTimer];
    }
    self.titleArr = [NSArray arrayWithArray:topTitles];
    [self.collectionView reloadData];
}

- (void)setBottomSignImages:(NSArray *)bottomSignImages {
    _bottomSignImages = bottomSignImages;
    if (bottomSignImages) {
        self.bottomImageArr = [NSArray arrayWithArray:bottomSignImages];
    }
}

- (void)setBottomTitles:(NSArray *)bottomTitles {
    _bottomTitles = bottomTitles;
    if (bottomTitles) {
        self.bottomTitleArr = [NSArray arrayWithArray:bottomTitles];
    }
}

- (void)setScrollTimeInterval:(CGFloat)scrollTimeInterval {
    _scrollTimeInterval = scrollTimeInterval;
    if (scrollTimeInterval) {
        [self addTimer];
    }
}


@end

