//
//  PK-ios
//
//  Created by peikua on 15/9/15.
//  Copyright (c) 2015年 peikua. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    GradientDirectionTopToBottom = 0,    // 从上往下 渐变
    GradientDirectionLeftToRight,        // 从左往右
    GradientDirectionBottomToTop,      // 从下往上
    GradientDirectionRightToLeft      // 从右往左
} GradientDirection;

@interface UIImage (Category)

//由颜色生成图片
+ (UIImage *) imageWithColor:(UIColor*)color;
+ (UIImage *) imageWithColor:(UIColor *)color size:(CGSize)size;

//将图片剪裁至目标尺寸
+ (UIImage *) imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage
                                           targetSize:(CGSize)targetSize;
/**
 *  @brief  生成渐变色图片
 *
 *  @param  bounds  图片的大小
 *  @param  colors      渐变颜色组
 *  @param  gradientType     渐变方向
 *
 *  @return 图片
 */
+ (UIImage*)gradientImageWithBounds:(CGRect)bounds
                          andColors:(NSArray*)colors
                    andGradientType:(GradientDirection)gradientType;
//图片旋转角度
- (UIImage *) imageRotatedByDegrees:(CGFloat)degrees;

//拉伸图片UIEdgeInsets
- (UIImage *) resizableImage:(UIEdgeInsets)insets;

//拉伸图片CGFloat
- (UIImage *) imageByResizeToScale:(CGFloat)scale;

//放大图片CGSize
- (UIImage *) imageByResizeWithMaxSize:(CGSize)size;

//缩略图CGSize
- (UIImage *) imageWithThumbnailForSize:(CGSize)size;

//通过Rect剪裁图片
- (UIImage *) imageByCropToRect:(CGRect)rect;

//图片增加圆角
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius;

//图片增加圆角及边框
- (UIImage *) imageByRoundCornerRadius:(CGFloat)radius
                          borderWidth:(CGFloat)borderWidth
                          borderColor:(UIColor *)borderColor;

//图片转180度
- (UIImage *)imageByRotate180;
//取某点的颜色
- (UIColor *)colorAtPoint:(CGPoint )point;
- (UIImage*)imageByApplyingAlpha:(CGFloat) alpha;
@end

@interface UIImage (ImageEffects)

//图片模糊效果

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyBlurEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

/**
 *  vImage高效模糊图片
 *
 *  @param image 原始图片
 *  @param blur  模糊数值(0-1)
 *
 *  @return 重新绘制的新图片
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

/**
 将 UIView 转换成 UIImage
 
 @param view 将要转换的View
 @return 新生成的 UIImage 对象
 */
+ (UIImage *)zsf_convertCreateImageWithUIView:(UIView *)view;
@end
