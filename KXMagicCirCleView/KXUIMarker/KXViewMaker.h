//
//  KXViewMaker.h
//  Test
//
//  Created by gamesirDev on 8/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KXViewMaker : NSObject
/// 父View
@property (nonatomic, copy, readonly) KXViewMaker* (^addTo)(UIView* superview);
/// frame
@property (nonatomic, copy, readonly) KXViewMaker* (^frame)(CGRect frame);
/// bounds
@property (nonatomic, copy, readonly) KXViewMaker* (^bounds)(CGRect bounds);
/// center
@property (nonatomic, copy, readonly) KXViewMaker* (^center)(CGPoint center);
/// 背景颜色
@property (nonatomic, copy, readonly) KXViewMaker* (^backgroundColor)(UIColor* color);
/// 是否隐藏
@property (nonatomic, copy, readonly) KXViewMaker* (^hidden)(BOOL flag);
/// 标签
@property (nonatomic, copy, readonly) KXViewMaker* (^tag)(NSInteger tag);
/// 可交互性
@property (nonatomic, copy, readonly) KXViewMaker* (^userInteractionEnabled)(BOOL flag);
/// layer.cornerRadius
@property (nonatomic, copy, readonly) KXViewMaker* (^layerCornerRadius)(CGFloat radius);
/// layer.maskToBounds
@property (nonatomic, copy, readonly) KXViewMaker* (^layerMaskToBounds)(BOOL flag);
/// layer.borderWidth：边框宽度
@property (nonatomic, copy, readonly) KXViewMaker* (^layerBorderWidth)(CGFloat width);
/// layer.borderColor：边框颜色，传入UIColor值
@property (nonatomic, copy, readonly) KXViewMaker* (^layerBorderColor)(UIColor* color);

@end


@interface UIView (KXMaker)
/// 链式创建UIView
+ (instancetype)kx_make:(void(^)(KXViewMaker* make, UIView *view))make;
+ (instancetype)kx_make:(void (^)(KXViewMaker* make, UIView *view))make withFrame:(CGRect)frame;
- (void)kx_removeAllSubviews;
- (instancetype)kx_configure:(void (^)(UIView *))configure;
@end
