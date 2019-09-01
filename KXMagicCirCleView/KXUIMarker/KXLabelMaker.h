//
//  KXLabelMaker.h
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KXLabelMaker : NSObject

/// 文本
@property (nonatomic, copy, readonly) KXLabelMaker* (^text)(NSString* text);
/// 文本颜色
@property (nonatomic, copy, readonly) KXLabelMaker* (^textColor)(UIColor* color);
/// 字体
@property (nonatomic, copy, readonly) KXLabelMaker* (^font)(UIFont* font);
/// 富文本
@property (nonatomic, copy, readonly) KXLabelMaker* (^attributedText)(NSAttributedString* atbString);
/// 文本对齐方式
@property (nonatomic, copy, readonly) KXLabelMaker* (^textAlignment)(NSTextAlignment alignment);
/// 文本行数
@property (nonatomic, copy, readonly) KXLabelMaker* (^numberOfLines)(NSInteger lines);
/// 未显示文字(...)的展示位置
@property (nonatomic, copy, readonly) KXLabelMaker* (^lineBreakMode)(NSLineBreakMode mode);

#pragma mark - UIView公共属性
/// 父View
@property (nonatomic, copy, readonly) KXLabelMaker* (^addTo)(UIView* superview);
/// frame
@property (nonatomic, copy, readonly) KXLabelMaker* (^frame)(CGRect frame);
/// bounds
@property (nonatomic, copy, readonly) KXLabelMaker* (^bounds)(CGRect bounds);
/// center
@property (nonatomic, copy, readonly) KXLabelMaker* (^center)(CGPoint center);
/// 背景颜色
@property (nonatomic, copy, readonly) KXLabelMaker* (^backgroundColor)(UIColor* color);
/// 是否隐藏
@property (nonatomic, copy, readonly) KXLabelMaker* (^hidden)(BOOL flag);
/// 标签
@property (nonatomic, copy, readonly) KXLabelMaker* (^tag)(NSInteger tag);
/// 可交互性
@property (nonatomic, copy, readonly) KXLabelMaker* (^userInteractionEnabled)(BOOL flag);
/// layer.cornerRadius
@property (nonatomic, copy, readonly) KXLabelMaker* (^layerCornerRadius)(CGFloat radius);
/// layer.maskToBounds
@property (nonatomic, copy, readonly) KXLabelMaker* (^layerMaskToBounds)(BOOL flag);
/// layer.borderWidth：边框宽度
@property (nonatomic, copy, readonly) KXLabelMaker* (^layerBorderWidth)(CGFloat width);
/// layer.borderColor：边框颜色，传入UIColor值
@property (nonatomic, copy, readonly) KXLabelMaker* (^layerBorderColor)(UIColor* color);

@end


@interface UILabel (KXMaker)
/// 链式创建UILabel
+ (instancetype)kx_make:(void(^)(KXLabelMaker* make, UILabel *label))make;
@end
