//
//  KXButtonMaker.h
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KXViewMaker.h"

typedef void (^KXButtonMakerActionBlock)(UIButton *button);

@interface KXButtonMaker : NSObject

/// 标题
@property (nonatomic, copy, readonly) KXButtonMaker* (^title)(NSString* title, UIControlState state);
/// 标题颜色
@property (nonatomic, copy, readonly) KXButtonMaker* (^titleColor)(UIColor* color, UIControlState state);
/// 字体
@property (nonatomic, copy, readonly) KXButtonMaker* (^font)(UIFont* font);
/// 图片
@property (nonatomic, copy, readonly) KXButtonMaker* (^image)(UIImage* image, UIControlState state);
/// 图片名称
@property (nonatomic, copy, readonly) KXButtonMaker* (^backgroundImage)(UIImage* image, UIControlState state);
/// 富文本
@property (nonatomic, copy, readonly) KXButtonMaker* (^attributedString)(NSString* title, UIColor* color, UIFont* font, UIControlState state);
/// touchUpInside点击事件
@property (nonatomic, copy, readonly) KXButtonMaker* (^action)(KXButtonMakerActionBlock block);
/// 点击事件
@property (nonatomic, copy, readonly) KXButtonMaker* (^actionWithEvents)(KXButtonMakerActionBlock block, UIControlEvents events);

#pragma mark - UIView公共属性
/// 父View
@property (nonatomic, copy, readonly) KXButtonMaker* (^addTo)(UIView* superview);
/// frame
@property (nonatomic, copy, readonly) KXButtonMaker* (^frame)(CGRect frame);
/// bounds
@property (nonatomic, copy, readonly) KXButtonMaker* (^bounds)(CGRect bounds);
/// center
@property (nonatomic, copy, readonly) KXButtonMaker* (^center)(CGPoint center);
/// 背景颜色
@property (nonatomic, copy, readonly) KXButtonMaker* (^backgroundColor)(UIColor* color);
/// 是否隐藏
@property (nonatomic, copy, readonly) KXButtonMaker* (^hidden)(BOOL flag);
/// 标签
@property (nonatomic, copy, readonly) KXButtonMaker* (^tag)(NSInteger tag);
/// 可交互性
@property (nonatomic, copy, readonly) KXButtonMaker* (^userInteractionEnabled)(BOOL flag);
/// layer.cornerRadius
@property (nonatomic, copy, readonly) KXButtonMaker* (^layerCornerRadius)(CGFloat radius);
/// layer.maskToBounds
@property (nonatomic, copy, readonly) KXButtonMaker* (^layerMaskToBounds)(BOOL flag);
/// layer.borderWidth：边框宽度
@property (nonatomic, copy, readonly) KXButtonMaker* (^layerBorderWidth)(CGFloat width);
/// layer.borderColor：边框颜色，传入UIColor值
@property (nonatomic, copy, readonly) KXButtonMaker* (^layerBorderColor)(UIColor* color);

@end


@interface UIButton (KXMaker)
/// 链式创建UIButton
+ (instancetype)kx_make:(void(^)(KXButtonMaker *make, UIButton *button))make;
@end
