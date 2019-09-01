//
//  KXViewMaker.m
//  Test
//
//  Created by gamesirDev on 8/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import "KXViewMaker.h"

@interface KXViewMaker ()
@property (nonatomic, retain, readwrite) UIView *view;
@end

@implementation KXViewMaker

- (instancetype)initWithView:(UIView *)view {
    self.view = view;

    return self;
}

- (KXViewMaker* _Nonnull (^)(UIView * _Nonnull))addTo {
    return ^KXViewMaker* (UIView* superview) {
        if (superview) {
            [superview addSubview:self.view];
        }
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(CGRect))frame {
    return ^KXViewMaker* (CGRect frame) {
        self.view.frame = frame;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(CGRect))bounds {
    return ^KXViewMaker* (CGRect bounds) {
        self.view.bounds = bounds;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(CGPoint))center {
    return ^KXViewMaker* (CGPoint center) {
        self.view.center = center;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^KXViewMaker* (UIColor* color) {
        self.view.backgroundColor = color;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(BOOL))hidden {
    return ^KXViewMaker* (BOOL flag) {
        self.view.hidden = flag;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(NSInteger))tag {
    return ^KXViewMaker* (NSInteger tag) {
        self.view.tag = tag;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(BOOL))userInteractionEnabled {
    return ^KXViewMaker* (BOOL flag) {
        self.view.userInteractionEnabled = flag;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(CGFloat))layerCornerRadius {
    return ^KXViewMaker* (CGFloat radius) {
        self.view.layer.cornerRadius = radius;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(BOOL))layerMaskToBounds {
    return ^KXViewMaker* (BOOL flag) {
        self.view.layer.masksToBounds = flag;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(CGFloat))layerBorderWidth {
    return ^KXViewMaker* (CGFloat width) {
        self.view.layer.borderWidth = width;
        return self;
    };
}

- (KXViewMaker* _Nonnull (^)(UIColor* _Nonnull))layerBorderColor {
    return ^KXViewMaker* (UIColor* color) {
        self.view.layer.borderColor = color.CGColor;
        return self;
    };
}

@end


/// UIView分类的实现
@implementation UIView (KXMaker)

+ (instancetype)kx_make:(void (^)(KXViewMaker* make, UIView *view))make
{
    
    KXViewMaker* maker = [[KXViewMaker alloc] initWithView: [[[self class] alloc] init]];
    if (make) {
        make(maker, maker.view);
    }
    
    return maker.view;
}

+ (instancetype)kx_make:(void (^)(KXViewMaker* make, UIView *view))make withFrame:(CGRect)frame
{
    KXViewMaker* maker = [[KXViewMaker alloc] initWithView: [[[self class] alloc] initWithFrame:frame]];
    
    if (make) {
        make(maker, maker.view);
    }
    
    return maker.view;
}

- (void)kx_removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (instancetype)kx_configure:(void (^)(UIView *))configure
{
    configure(self);
    return self;
}

@end
