//
//  KXImageViewMaker.m
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import "KXImageViewMaker.h"

@interface KXImageViewMaker ()
@property (nonatomic, retain, readwrite) UIImageView*           imageView;
@end

@implementation KXImageViewMaker

- (instancetype)initView {
    self.imageView = [UIImageView new];
    
    return self;
}

- (KXImageViewMaker* (^)(UIImage *))image {
    return ^KXImageViewMaker* (UIImage* image){
        self.imageView.image = image;
        return self;
    };
}

- (KXImageViewMaker* (^)(NSString *))imageName {
    return ^KXImageViewMaker* (NSString* imageName){
        if (imageName && imageName.length > 0) {
            self.imageView.image = [UIImage imageNamed:imageName];
        }
        return self;
    };
}

- (KXImageViewMaker *(^)(UIViewContentMode))contentMode
{
    return ^KXImageViewMaker* (UIViewContentMode contentMode){
        self.imageView.contentMode = contentMode;
        return self;
    };
}

#pragma mark - UIView公共属性

- (KXImageViewMaker* _Nonnull (^)(UIView * _Nonnull))addTo {
    return ^KXImageViewMaker* (UIView* superview) {
        if (superview) {
            [superview addSubview:self.imageView];
        }
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(CGRect))frame {
    return ^KXImageViewMaker* (CGRect frame) {
        self.imageView.frame = frame;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(CGRect))bounds {
    return ^KXImageViewMaker* (CGRect bounds) {
        self.imageView.bounds = bounds;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(CGPoint))center {
    return ^KXImageViewMaker* (CGPoint center) {
        self.imageView.center = center;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^KXImageViewMaker* (UIColor* color) {
        self.imageView.backgroundColor = color;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(BOOL))hidden {
    return ^KXImageViewMaker* (BOOL flag) {
        self.imageView.hidden = flag;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(NSInteger))tag {
    return ^KXImageViewMaker* (NSInteger tag) {
        self.imageView.tag = tag;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(BOOL))userInteractionEnabled {
    return ^KXImageViewMaker* (BOOL flag) {
        self.imageView.userInteractionEnabled = flag;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(CGFloat))layerCornerRadius {
    return ^KXImageViewMaker* (CGFloat radius) {
        self.imageView.layer.cornerRadius = radius;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(BOOL))layerMaskToBounds {
    return ^KXImageViewMaker* (BOOL flag) {
        self.imageView.layer.masksToBounds = flag;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(CGFloat))layerBorderWidth {
    return ^KXImageViewMaker* (CGFloat width) {
        self.imageView.layer.borderWidth = width;
        return self;
    };
}

- (KXImageViewMaker* _Nonnull (^)(UIColor* _Nonnull))layerBorderColor {
    return ^KXImageViewMaker* (UIColor* color) {
        self.imageView.layer.borderColor = color.CGColor;
        return self;
    };
}

@end


/// UIImageView分类的实现
@implementation UIImageView (KXMaker)

+ (instancetype)kx_make:(void (^)(KXImageViewMaker* make, UIImageView* imageView))make {
    
    KXImageViewMaker* maker = [[KXImageViewMaker alloc] initView];
    if (make) {
        make(maker, maker.imageView);
    }
    
    return maker.imageView;
}

@end
