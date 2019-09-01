//
//  KXScrollViewMaker.m
//  KX_buddha
//
//  Created by shuw on 2019/8/22.
//  Copyright © 2019 com.kx_buddha. All rights reserved.
//

#import "KXScrollViewMaker.h"

@interface KXScrollViewMaker ()
@property (nonatomic, retain, readwrite) UIScrollView *scrollView;
@end

@implementation KXScrollViewMaker

- (instancetype)initView {
    self.scrollView = [[UIScrollView alloc] init];
    
    return self;
}

- (KXScrollViewMaker * _Nonnull (^)(BOOL))pagingEnabled
{
    return ^KXScrollViewMaker* (BOOL pagingEnabled){
        self.scrollView.pagingEnabled = pagingEnabled;
        return self;
    };
}

- (KXScrollViewMaker * _Nonnull (^)(BOOL))alwaysBounceVertical
{
    return ^KXScrollViewMaker* (BOOL alwaysBounceVertical){
        self.scrollView.alwaysBounceVertical = alwaysBounceVertical;
        return self;
    };
}

- (KXScrollViewMaker * _Nonnull (^)(BOOL))alwaysBounceHorizontal
{
    return ^KXScrollViewMaker* (BOOL alwaysBounceHorizontal){
        self.scrollView.alwaysBounceHorizontal = alwaysBounceHorizontal;
        return self;
    };
}

#pragma mark - UIView公共属性

- (KXScrollViewMaker* _Nonnull (^)(UIView * _Nonnull))addTo {
    return ^KXScrollViewMaker* (UIView* superview) {
        if (superview) {
            [superview addSubview:self.scrollView];
        }
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(CGRect))frame {
    return ^KXScrollViewMaker* (CGRect frame) {
        self.scrollView.frame = frame;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(CGRect))bounds {
    return ^KXScrollViewMaker* (CGRect bounds) {
        self.scrollView.bounds = bounds;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(CGPoint))center {
    return ^KXScrollViewMaker* (CGPoint center) {
        self.scrollView.center = center;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^KXScrollViewMaker* (UIColor* color) {
        self.scrollView.backgroundColor = color;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(BOOL))hidden {
    return ^KXScrollViewMaker* (BOOL flag) {
        self.scrollView.hidden = flag;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(NSInteger))tag {
    return ^KXScrollViewMaker* (NSInteger tag) {
        self.scrollView.tag = tag;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(BOOL))userInteractionEnabled {
    return ^KXScrollViewMaker* (BOOL flag) {
        self.scrollView.userInteractionEnabled = flag;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(CGFloat))layerCornerRadius {
    return ^KXScrollViewMaker* (CGFloat radius) {
        self.scrollView.layer.cornerRadius = radius;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(BOOL))layerMaskToBounds {
    return ^KXScrollViewMaker* (BOOL flag) {
        self.scrollView.layer.masksToBounds = flag;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(CGFloat))layerBorderWidth {
    return ^KXScrollViewMaker* (CGFloat width) {
        self.scrollView.layer.borderWidth = width;
        return self;
    };
}

- (KXScrollViewMaker* _Nonnull (^)(UIColor* _Nonnull))layerBorderColor {
    return ^KXScrollViewMaker* (UIColor* color) {
        self.scrollView.layer.borderColor = color.CGColor;
        return self;
    };
}

@end


/// UIscrollView分类的实现
@implementation UIScrollView (KXMaker)

+ (instancetype)kx_make:(void (^)(KXScrollViewMaker* make, UIScrollView *scrollView))make {
    
    KXScrollViewMaker* maker = [[KXScrollViewMaker alloc] initView];
    if (make) {
        make(maker, maker.scrollView);
    }
    
    return maker.scrollView;
}

@end
