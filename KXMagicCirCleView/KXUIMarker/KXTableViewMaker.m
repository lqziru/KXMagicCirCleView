//
//  KXTableViewMaker.m
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import "KXTableViewMaker.h"

@interface KXTableViewMaker ()
@property (nonatomic, retain, readwrite) UITableView*           tableView;
@end

@implementation KXTableViewMaker

- (instancetype)initWithStyle:(UITableViewStyle)style {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    
    return self;
}

- (KXTableViewMaker* (^)(id))delegate {
    return ^KXTableViewMaker* (id object) {
        self.tableView.delegate = object;
        return self;
    };
}

- (KXTableViewMaker* (^)(id))dataSource {
    return ^KXTableViewMaker* (id object) {
        self.tableView.dataSource = object;
        return self;
    };
}

- (KXTableViewMaker* (^)(__unsafe_unretained Class, NSString *))registerClassWithIdentifier {
    return ^KXTableViewMaker* (Class aClass, NSString* identifier) {
        [self.tableView registerClass:aClass forCellReuseIdentifier:identifier];
        return self;
    };
}

- (KXTableViewMaker *(^)(UITableViewCellSeparatorStyle))separatorStyle
{
    return ^KXTableViewMaker* (UITableViewCellSeparatorStyle separatorStyle) {
        self.tableView.separatorStyle = separatorStyle;
        return self;
    };
}

- (KXTableViewMaker *(^)(CGFloat, CGFloat, CGFloat, CGFloat))contentInset
{
    return ^KXTableViewMaker* (CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) {
        self.tableView.contentInset = UIEdgeInsetsMake(top, left, bottom, right);
        return self;
    };
}

#pragma mark - UIView公共属性

- (KXTableViewMaker* _Nonnull (^)(UIView * _Nonnull))addTo {
    return ^KXTableViewMaker* (UIView* superview) {
        if (superview) {
            [superview addSubview:self.tableView];
        }
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(CGRect))frame {
    return ^KXTableViewMaker* (CGRect frame) {
        self.tableView.frame = frame;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(CGRect))bounds {
    return ^KXTableViewMaker* (CGRect bounds) {
        self.tableView.bounds = bounds;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(CGPoint))center {
    return ^KXTableViewMaker* (CGPoint center) {
        self.tableView.center = center;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^KXTableViewMaker* (UIColor* color) {
        self.tableView.backgroundColor = color;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(BOOL))hidden {
    return ^KXTableViewMaker* (BOOL flag) {
        self.tableView.hidden = flag;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(NSInteger))tag {
    return ^KXTableViewMaker* (NSInteger tag) {
        self.tableView.tag = tag;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(BOOL))userInteractionEnabled {
    return ^KXTableViewMaker* (BOOL flag) {
        self.tableView.userInteractionEnabled = flag;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(CGFloat))layerCornerRadius {
    return ^KXTableViewMaker* (CGFloat radius) {
        self.tableView.layer.cornerRadius = radius;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(BOOL))layerMaskToBounds {
    return ^KXTableViewMaker* (BOOL flag) {
        self.tableView.layer.masksToBounds = flag;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(CGFloat))layerBorderWidth {
    return ^KXTableViewMaker* (CGFloat width) {
        self.tableView.layer.borderWidth = width;
        return self;
    };
}

- (KXTableViewMaker* _Nonnull (^)(UIColor* _Nonnull))layerBorderColor {
    return ^KXTableViewMaker* (UIColor* color) {
        self.tableView.layer.borderColor = color.CGColor;
        return self;
    };
}

@end


/// UITableView分类的实现
@implementation UITableView (KXMaker)

+ (instancetype)kx_make:(void (^)(KXTableViewMaker* make, UITableView *tableView))make style:(UITableViewStyle)style {
    
    KXTableViewMaker* maker = [[KXTableViewMaker alloc] initWithStyle:style];
    if (make) {
        make(maker, maker.tableView);
    }
    
    return maker.tableView;
}
@end
