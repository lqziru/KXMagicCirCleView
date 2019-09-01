//
//  KXLabelMaker.m
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import "KXLabelMaker.h"

@interface KXLabelMaker ()
@property (nonatomic, retain, readwrite) UILabel* label;
@end

@implementation KXLabelMaker

- (instancetype)initView {
    self.label = [UILabel new];
    
    return self;
}

- (KXLabelMaker *(^)(NSString *))text {
    return ^KXLabelMaker *(NSString *text) {
        self.label.text = text;
        return self;
    };
}

- (KXLabelMaker *(^)(UIColor *))textColor {
    return ^KXLabelMaker *(UIColor *color) {
        self.label.textColor = color;
        return self;
    };
}

- (KXLabelMaker *(^)(NSAttributedString *))attributedText {
    return ^KXLabelMaker *(NSAttributedString *atbString) {
        self.label.attributedText = atbString;
        return self;
    };
}

- (KXLabelMaker *(^)(UIFont *))font {
    return ^KXLabelMaker *(UIFont *font) {
        self.label.font = font;
        return self;
    };
}

- (KXLabelMaker *(^)(NSTextAlignment))textAlignment {
    return ^KXLabelMaker *(NSTextAlignment alignment) {
        self.label.textAlignment = alignment;
        return self;
    };
}

- (KXLabelMaker *(^)(NSInteger))numberOfLines {
    return ^KXLabelMaker *(NSInteger lines) {
        self.label.numberOfLines = lines;
        return self;
    };
}

- (KXLabelMaker *(^)(NSLineBreakMode))lineBreakMode {
    return ^KXLabelMaker *(NSLineBreakMode mode) {
        self.label.lineBreakMode = mode;
        return self;
    };
}


#pragma mark - UIView公共属性

- (KXLabelMaker* _Nonnull (^)(UIView * _Nonnull))addTo {
    return ^KXLabelMaker* (UIView* superview) {
        if (superview) {
            [superview addSubview:self.label];
        }
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(CGRect))frame {
    return ^KXLabelMaker* (CGRect frame) {
        self.label.frame = frame;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(CGRect))bounds {
    return ^KXLabelMaker* (CGRect bounds) {
        self.label.bounds = bounds;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(CGPoint))center {
    return ^KXLabelMaker* (CGPoint center) {
        self.label.center = center;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^KXLabelMaker* (UIColor* color) {
        self.label.backgroundColor = color;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(BOOL))hidden {
    return ^KXLabelMaker* (BOOL flag) {
        self.label.hidden = flag;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(NSInteger))tag {
    return ^KXLabelMaker* (NSInteger tag) {
        self.label.tag = tag;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(BOOL))userInteractionEnabled {
    return ^KXLabelMaker* (BOOL flag) {
        self.label.userInteractionEnabled = flag;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(CGFloat))layerCornerRadius {
    return ^KXLabelMaker* (CGFloat radius) {
        self.label.layer.cornerRadius = radius;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(BOOL))layerMaskToBounds {
    return ^KXLabelMaker* (BOOL flag) {
        self.label.layer.masksToBounds = flag;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(CGFloat))layerBorderWidth {
    return ^KXLabelMaker* (CGFloat width) {
        self.label.layer.borderWidth = width;
        return self;
    };
}

- (KXLabelMaker* _Nonnull (^)(UIColor* _Nonnull))layerBorderColor {
    return ^KXLabelMaker* (UIColor* color) {
        self.label.layer.borderColor = color.CGColor;
        return self;
    };
}

@end


/// UILabel分类的实现
@implementation UILabel (KXMaker)

+ (instancetype)kx_make:(void (^)(KXLabelMaker* make, UILabel *label))make {
    KXLabelMaker *maker = [[KXLabelMaker alloc] initView];
    if (make) {
        make(maker, maker.label);
    }
    
    return maker.label;
}

@end
