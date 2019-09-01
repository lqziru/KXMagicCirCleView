//
//  KXImageViewMaker.h
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KXImageViewMaker : NSObject

/// 图片
@property (nonatomic, copy, readonly) KXImageViewMaker* (^image)(UIImage* image);
/// 图片名称
@property (nonatomic, copy, readonly) KXImageViewMaker* (^imageName)(NSString* imageName);
/// 图片模式
@property (nonatomic, copy, readonly) KXImageViewMaker* (^contentMode)(UIViewContentMode contentMode);
#pragma mark - UIView公共属性
/// 父View
@property (nonatomic, copy, readonly) KXImageViewMaker* (^addTo)(UIView* superview);
/// frame
@property (nonatomic, copy, readonly) KXImageViewMaker* (^frame)(CGRect frame);
/// bounds
@property (nonatomic, copy, readonly) KXImageViewMaker* (^bounds)(CGRect bounds);
/// center
@property (nonatomic, copy, readonly) KXImageViewMaker* (^center)(CGPoint center);
/// 背景颜色
@property (nonatomic, copy, readonly) KXImageViewMaker* (^backgroundColor)(UIColor* color);
/// 是否隐藏
@property (nonatomic, copy, readonly) KXImageViewMaker* (^hidden)(BOOL flag);
/// 标签
@property (nonatomic, copy, readonly) KXImageViewMaker* (^tag)(NSInteger tag);
/// 可交互性
@property (nonatomic, copy, readonly) KXImageViewMaker* (^userInteractionEnabled)(BOOL flag);
/// layer.cornerRadius
@property (nonatomic, copy, readonly) KXImageViewMaker* (^layerCornerRadius)(CGFloat radius);
/// layer.maskToBounds
@property (nonatomic, copy, readonly) KXImageViewMaker* (^layerMaskToBounds)(BOOL flag);
/// layer.borderWidth：边框宽度
@property (nonatomic, copy, readonly) KXImageViewMaker* (^layerBorderWidth)(CGFloat width);
/// layer.borderColor：边框颜色，传入UIColor值
@property (nonatomic, copy, readonly) KXImageViewMaker* (^layerBorderColor)(UIColor* color);

@end


@interface UIImageView (KXMaker)
/// 链式创建UIImageView
+ (instancetype)kx_make:(void(^)(KXImageViewMaker* make, UIImageView* imageView))make;
@end
