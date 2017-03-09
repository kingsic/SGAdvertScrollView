//
//  SGHelperTool.m
//  SGHelperTool
//
//  Created by Sorgle on 15/7/13.
//  Copyright © 2015年 Sorgle. All rights reserved.
//

#import "SGHelperTool.h"

@implementation SGHelperTool

/**
 *  简单的图文混排
 *
 *  @param imageName   图片名
 *  @param imageSize   图片大小
 *  @param frontText   图片前面内容
 *  @param behindText   图片后面内容
 *
 *  @return attributedText
 */
+ (NSMutableAttributedString *)SG_textAttachmentWithImageName:(NSString *)imageName imageSize:(CGSize)imageSize frontText:(NSString *)frontText behindText:(NSString *)behindText {
    NSTextAttachment *imageText = [[NSTextAttachment alloc] init];
    imageText.image = [UIImage imageNamed:imageName];
    // 将 NSTextAttachment 转换成 NSAttributedString 属性
    NSAttributedString *imageText_AttributedStr = [NSAttributedString attributedStringWithAttachment:imageText];
    // 将 NSAttributedString 属性 转换成 NSMutableAttributedString
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:imageText_AttributedStr];
    
    // imageText 前面的文字转换成 NSMutableAttributedString
    NSMutableAttributedString *front_mAttribStr = [[NSMutableAttributedString alloc] initWithString:frontText];
    // 将文字插在图片前面
    [attributedText insertAttributedString:front_mAttribStr atIndex:0];
    
    NSMutableAttributedString *behind_mAttribStr = [[NSMutableAttributedString alloc] initWithString:behindText];
    [behind_mAttribStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, behindText.length)];
    // 将文字插在图片后面
    [attributedText appendAttributedString:behind_mAttribStr];
    
    // 设置图片的大小
    imageText.bounds = CGRectMake(0, - 5, imageSize.width, imageSize.height);

    // 调整行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedText addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedText.length)];
    
    return attributedText;
}

@end
