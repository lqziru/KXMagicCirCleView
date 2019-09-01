//
//  KXScrollViewMaker.h
//  KX_buddha
//
//  Created by shuw on 2019/8/22.
//  Copyright © 2019 com.kx_buddha. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KXScrollViewMaker : NSObject

/// 是否翻页
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^pagingEnabled)(BOOL pagingEnabled);
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^alwaysBounceHorizontal)(BOOL alwaysBounceHorizontal);
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^alwaysBounceVertical)(BOOL alwaysBounceVertical);
#pragma mark - UIView公共属性

/// 父View
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^addTo)(UIView* superview);
/// frame
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^frame)(CGRect frame);
/// bounds
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^bounds)(CGRect bounds);
/// center
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^center)(CGPoint center);
/// 背景颜色
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^backgroundColor)(UIColor* color);
/// 是否隐藏
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^hidden)(BOOL flag);
/// 标签
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^tag)(NSInteger tag);
/// 可交互性
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^userInteractionEnabled)(BOOL flag);
/// layer.cornerRadius
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^layerCornerRadius)(CGFloat radius);
/// layer.maskToBounds
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^layerMaskToBounds)(BOOL flag);
/// layer.borderWidth：边框宽度
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^layerBorderWidth)(CGFloat width);
/// layer.borderColor：边框颜色，传入UIColor值
@property (nonatomic, copy, readonly) KXScrollViewMaker* (^layerBorderColor)(UIColor* color);

@end


@interface UIScrollView (KXMaker)
/// 链式创建UIImageView
+ (instancetype)kx_make:(void(^)(KXScrollViewMaker* make, UIScrollView *scrollView))make;
@end

NS_ASSUME_NONNULL_END
