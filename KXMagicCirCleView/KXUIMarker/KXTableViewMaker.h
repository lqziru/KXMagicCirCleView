//
//  KXTableViewMaker.h
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KXTableViewMaker : NSObject

/// 代理
@property (nonatomic, copy, readonly) KXTableViewMaker* (^delegate)(id object);
/// 数据源
@property (nonatomic, copy, readonly) KXTableViewMaker* (^dataSource)(id object);
/// 注册cell
@property (nonatomic, copy, readonly) KXTableViewMaker* (^registerClassWithIdentifier)(Class aClass, NSString* identifier);
/// 分割线样式
@property (nonatomic, copy, readonly) KXTableViewMaker* (^separatorStyle)(UITableViewCellSeparatorStyle separatorStyle);
/// 内边距
@property (nonatomic, copy, readonly) KXTableViewMaker* (^contentInset)(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right);
#pragma mark - UIView公共属性

/// 父View
@property (nonatomic, copy, readonly) KXTableViewMaker* (^addTo)(UIView* superview);
/// frame
@property (nonatomic, copy, readonly) KXTableViewMaker* (^frame)(CGRect frame);
/// bounds
@property (nonatomic, copy, readonly) KXTableViewMaker* (^bounds)(CGRect bounds);
/// center
@property (nonatomic, copy, readonly) KXTableViewMaker* (^center)(CGPoint center);
/// 背景颜色
@property (nonatomic, copy, readonly) KXTableViewMaker* (^backgroundColor)(UIColor* color);
/// 是否隐藏
@property (nonatomic, copy, readonly) KXTableViewMaker* (^hidden)(BOOL flag);
/// 标签
@property (nonatomic, copy, readonly) KXTableViewMaker* (^tag)(NSInteger tag);
/// 可交互性
@property (nonatomic, copy, readonly) KXTableViewMaker* (^userInteractionEnabled)(BOOL flag);
/// layer.cornerRadius
@property (nonatomic, copy, readonly) KXTableViewMaker* (^layerCornerRadius)(CGFloat radius);
/// layer.maskToBounds
@property (nonatomic, copy, readonly) KXTableViewMaker* (^layerMaskToBounds)(BOOL flag);
/// layer.borderWidth：边框宽度
@property (nonatomic, copy, readonly) KXTableViewMaker* (^layerBorderWidth)(CGFloat width);
/// layer.borderColor：边框颜色，传入UIColor值
@property (nonatomic, copy, readonly) KXTableViewMaker* (^layerBorderColor)(UIColor* color);

@end


@interface UITableView (KXMaker)
/// 链式创建UITableView
+ (instancetype)kx_make:(void(^)(KXTableViewMaker* make, UITableView *tableView))make style:(UITableViewStyle)style;
@end
