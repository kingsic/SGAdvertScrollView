//
//  如遇到问题或有更好方案，请通过以下方式进行联系
//      QQ：1357127436
//      Email：kingsic@126.com
//      GitHub：https://github.com/kingsic/SGAdvertScrollView
//
//  SGAdvertScrollView.m
//  SGAdvertScrollViewExample
//
//  Created by kingsic on 17/3/8.
//  Copyright © 2017年 kingsic. All rights reserved.
//

#import "SGAdvertScrollView.h"
#import "UIImageView+WebCache.h"

static NSInteger const advertScrollViewTitleFont = 13;

#pragma mark - - - SGAdvertScrollViewStyleNormal 样式下的 cell
@interface SGAdvertScrollViewNormalCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *signImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation SGAdvertScrollViewNormalCell
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
        _titleLabel.font = [UIFont systemFontOfSize:advertScrollViewTitleFont];
    }
    return _titleLabel;
}
@end

#pragma mark - - - SGAdvertScrollViewStyleMore 样式下的 cell
@interface SGAdvertScrollViewMoreCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *topSignImageView;
@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UIImageView *bottomSignImageView;
@property (nonatomic, strong) UILabel *bottomLabel;
@end

@implementation SGAdvertScrollViewMoreCell
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
        _topLabel.font = [UIFont systemFontOfSize:advertScrollViewTitleFont];
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
        _bottomLabel.font = [UIFont systemFontOfSize:advertScrollViewTitleFont];
    }
    return _bottomLabel;
}
@end


#pragma mark - - - SGAdvertScrollView
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

static NSInteger const advertScrollViewMaxSections = 100;
static NSString *const advertScrollViewNormalCell = @"advertScrollViewNormalCell";
static NSString *const advertScrollViewMoreCell = @"advertScrollViewMoreCell";

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

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (!newSuperview) {
        [self removeTimer];
    }
}

- (void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}

- (void)initialization {
    _scrollTimeInterval = 3.0;
    
    [self addTimer];
    _advertScrollViewStyle = SGAdvertScrollViewStyleNormal;
}

- (void)setupSubviews {
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:tempView];
    [self addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:_flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.scrollEnabled = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[SGAdvertScrollViewNormalCell class] forCellWithReuseIdentifier:advertScrollViewNormalCell];
    }
    return _collectionView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _flowLayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    _collectionView.frame = self.bounds;
    
    if (self.titleArr.count > 1) {
        [self defaultSelectedScetion];
    }
}

- (void)defaultSelectedScetion {
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
    if (self.advertScrollViewStyle == SGAdvertScrollViewStyleMore) {
        SGAdvertScrollViewMoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:advertScrollViewMoreCell forIndexPath:indexPath];
        NSInteger topImagesCount = self.imageArr.count;
        if (topImagesCount > 0) {
            NSString *topImagePath = self.imageArr[indexPath.item];
            if (topImagePath == nil || [topImagePath isEqualToString:@""]) { // 解决 iOS 11 无图片，控制台打印问题
                if ([topImagePath hasPrefix:@"http"]) {
                    [cell.topSignImageView sd_setImageWithURL:[NSURL URLWithString:@"www.kingsic22.com"]];
                    
                } else {
                    cell.topSignImageView.image = [UIImage imageNamed:@"kingsic"];
                }
            } else {
                if ([topImagePath hasPrefix:@"http"]) {
                    [cell.topSignImageView sd_setImageWithURL:[NSURL URLWithString:topImagePath]];
                    
                } else {
                    cell.topSignImageView.image = [UIImage imageNamed:topImagePath];
                }
            }
        }
        cell.topLabel.text = self.titleArr[indexPath.item];

        NSInteger bottomImagesCount = self.bottomImageArr.count;
        if (bottomImagesCount > 0) {
            NSString *bottomImagePath = self.bottomImageArr[indexPath.item];
            if (bottomImagePath == nil || [bottomImagePath isEqualToString:@""]) { // 解决 iOS 11 无图片，控制台打印问题
                if ([bottomImagePath hasPrefix:@"http"]) {
                    [cell.bottomSignImageView sd_setImageWithURL:[NSURL URLWithString:@"www.kingsic22.com"]];
                    
                } else {
                    cell.bottomSignImageView.image = [UIImage imageNamed:@"kingsic"];
                }
            } else {
                if ([bottomImagePath hasPrefix:@"http"]) {
                    [cell.bottomSignImageView sd_setImageWithURL:[NSURL URLWithString:bottomImagePath]];
                    
                } else {
                    cell.bottomSignImageView.image = [UIImage imageNamed:bottomImagePath];
                }
            }
        }
        cell.bottomLabel.text = self.bottomTitleArr[indexPath.item];

        if (self.titleFont) {
            cell.topLabel.font = self.titleFont;
            cell.bottomLabel.font = self.titleFont;
        }

        if (self.topTitleColor) {
            cell.topLabel.textColor = self.topTitleColor;
        }
        if (self.bottomTitleColor) {
            cell.bottomLabel.textColor = self.bottomTitleColor;
        }
        return cell;
        
    } else {
        SGAdvertScrollViewNormalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:advertScrollViewNormalCell forIndexPath:indexPath];
        NSInteger imagesCount = self.imageArr.count;
        if (imagesCount > 0) {
            NSString *imagePath = self.imageArr[indexPath.item];
            if (imagePath == nil || [imagePath isEqualToString:@""]) { // 解决 iOS 11 无图片，控制台打印问题
                if ([imagePath hasPrefix:@"http"]) {
                    [cell.signImageView sd_setImageWithURL:[NSURL URLWithString:@"www.kingsic22.com"]];
                    
                } else {
                    cell.signImageView.image = [UIImage imageNamed:@"kingsic"];
                }
            } else {
                if ([imagePath hasPrefix:@"http"]) {
                    [cell.signImageView sd_setImageWithURL:[NSURL URLWithString:imagePath]];
                    
                } else {
                    cell.signImageView.image = [UIImage imageNamed:imagePath];
                }
            }
        }
        cell.titleLabel.text = self.titleArr[indexPath.item];
        
        if (self.textAlignment) {
            cell.titleLabel.textAlignment = self.textAlignment;
        }
        if (self.titleFont) {
            cell.titleLabel.font = self.titleFont;
        }
        if (self.titleColor) {
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
    if (advertScrollViewStyle == SGAdvertScrollViewStyleMore) {
        _advertScrollViewStyle = SGAdvertScrollViewStyleMore;
        [_collectionView registerClass:[SGAdvertScrollViewMoreCell class] forCellWithReuseIdentifier:advertScrollViewMoreCell];
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
    if (titles.count > 1) {
        [self addTimer];
    } else {
        [self removeTimer];
    }
    
    self.titleArr = [NSArray arrayWithArray:titles];
    [self.collectionView reloadData];
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    _textAlignment = textAlignment;
}

- (void)setTopSignImages:(NSArray *)topSignImages {
    _topSignImages = topSignImages;
    if (topSignImages) {
        self.imageArr = [NSArray arrayWithArray:topSignImages];
    }
}

- (void)setTopTitles:(NSArray *)topTitles {
    _topTitles = topTitles;
    if (topTitles.count > 1) {
        [self addTimer];
    } else {
        [self removeTimer];
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

- (void)setScrollTimeInterval:(CFTimeInterval)scrollTimeInterval {
    _scrollTimeInterval = scrollTimeInterval;
    if (scrollTimeInterval) {
        [self addTimer];
    }
}


@end

