//
//  UIColor+Category.h
//  ADTLib
//
//  Created by ldhonline on 2019/5/18.
//  Copyright © 2019 esunsky.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Category)


/**
 随机颜色

 @return UIColor
 */
+ (instancetype)randomColor;


/**
 Hex转颜色

 @param hex 支持 “rgb” "#rgb" "rrggbb" "#rrggbb"
 @return UIColor
 */
+ (instancetype)colorWithHex:(NSString *)hex;


/**
 Hex转透明颜色

 @param hex hex
 @param alpha 透明度
 @return UIColor
 */
+ (instancetype)colorWithHex:(NSString *)hex
                       alpha:(CGFloat)alpha;

/**
 在原基础上调节颜色的明亮度
 
 @param delta 增减的明亮度
 @return UIColor
 */
- (UIColor*) brighnessOffset:(CGFloat)delta;


/**
 在原基础上调整颜色的透明度
 
 @param delta 增减的透明度
 @return UIColor
 */
- (UIColor*) alphaOffset:(CGFloat)delta;

@end

NS_ASSUME_NONNULL_END
