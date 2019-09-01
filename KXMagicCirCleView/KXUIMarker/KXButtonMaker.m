//
//  KXButtonMaker.m
//  Test
//
//  Created by gamesirDev on 9/7/2019.
//  Copyright © 2019 gamesirDev. All rights reserved.
//

#import "KXButtonMaker.h"
#import <objc/message.h>

@interface KXButtonMaker ()
@property (nonatomic, retain, readwrite) UIButton*           button;
@end

@implementation KXButtonMaker

- (instancetype)initView {
    self.button = [UIButton new];
    
    return self;
}

/// Title
- (KXButtonMaker* (^)(NSString *, UIControlState))title {
    /// 数据由括号内传来的值决定
    return ^KXButtonMaker* (NSString* title, UIControlState state) {
        [self.button setTitle:title forState:state];
        
        return self;
    };
}

/// TitleColor
- (KXButtonMaker* (^)(UIColor *, UIControlState))titleColor {
    return ^KXButtonMaker* (UIColor* color, UIControlState state) {
        [self.button setTitleColor:color forState:state];
        
        return self;
    };
}

- (KXButtonMaker *(^)(UIFont *))font
{
    return ^KXButtonMaker* (UIFont *font) {
        self.button.titleLabel.font = font;
        
        return self;
    };
}

/// Image
- (KXButtonMaker* (^)(UIImage *, UIControlState))image {
    return ^KXButtonMaker* (UIImage* image, UIControlState state) {
        [self.button setImage:image forState:state];
        
        return self;
    };
}

- (KXButtonMaker* (^)(UIImage *, UIControlState))backgroundImage {
    return ^KXButtonMaker* (UIImage* image, UIControlState state) {
        [self.button setBackgroundImage:image forState:state];
        
        return self;
    };
}

/// AttributedString
- (KXButtonMaker* (^)(NSString *, UIColor *, UIFont *, UIControlState))attributedString {
    return ^KXButtonMaker* (NSString* title, UIColor* color, UIFont *font, UIControlState state) {
        NSAssert(title.length > 0, @"设置attributedString的标题不能为空");
        NSMutableDictionary<NSAttributedStringKey, id> *attributes = [NSMutableDictionary dictionary];
        if (font) {
            [attributes setValue:font forKey:NSFontAttributeName];
        }
        if (color) {
            [attributes setValue:color forKey:NSForegroundColorAttributeName];
        }
        NSMutableAttributedString *titleAttributedStr = [[NSMutableAttributedString alloc]initWithString:title attributes:attributes];
        [self.button setAttributedTitle:titleAttributedStr forState:state];
        
        return self;
    };
}


#pragma mark - 按钮点击事件

- (KXButtonMaker* (^)(KXButtonMakerActionBlock))action {
    return ^KXButtonMaker* (KXButtonMakerActionBlock action) {
        [self createrActionBlock:^(UIButton *button) {
            if (action) {
                action(self.button);
            }
        } controlEvent:UIControlEventTouchUpInside];
        
        return self;
    };
}

- (KXButtonMaker* (^)(KXButtonMakerActionBlock, UIControlEvents))actionWithEvents {
    return ^KXButtonMaker* (KXButtonMakerActionBlock action, UIControlEvents events) {
        [self createrActionBlock:^(UIButton *button) {
            if (action) {
                action(self.button);
            }
        } controlEvent:events];
        
        return self;
    };
}

- (void)createrActionBlock:(KXButtonMakerActionBlock)actionBlock controlEvent:(UIControlEvents)event {
    if(actionBlock) {
        objc_setAssociatedObject(self, @selector(buttonClickAction:), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    
    [self.button addTarget:self action:@selector(buttonClickAction:) forControlEvents:event];
}

- (void)buttonClickAction:(UIButton *)button {
    KXButtonMakerActionBlock block = objc_getAssociatedObject(self, _cmd);
    if(block){
        block(button);
    }
}

#pragma mark - UIView公共属性

- (KXButtonMaker* _Nonnull (^)(UIView * _Nonnull))addTo {
    return ^KXButtonMaker* (UIView* superview) {
        if (superview) {
            [superview addSubview:self.button];
        }
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(CGRect))frame {
    return ^KXButtonMaker* (CGRect frame) {
        self.button.frame = frame;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(CGRect))bounds {
    return ^KXButtonMaker* (CGRect bounds) {
        self.button.bounds = bounds;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(CGPoint))center {
    return ^KXButtonMaker* (CGPoint center) {
        self.button.center = center;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(UIColor * _Nonnull))backgroundColor {
    return ^KXButtonMaker* (UIColor* color) {
        self.button.backgroundColor = color;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(BOOL))hidden {
    return ^KXButtonMaker* (BOOL flag) {
        self.button.hidden = flag;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(NSInteger))tag {
    return ^KXButtonMaker* (NSInteger tag) {
        self.button.tag = tag;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(BOOL))userInteractionEnabled {
    return ^KXButtonMaker* (BOOL flag) {
        self.button.userInteractionEnabled = flag;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(CGFloat))layerCornerRadius {
    return ^KXButtonMaker* (CGFloat radius) {
        self.button.layer.cornerRadius = radius;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(BOOL))layerMaskToBounds {
    return ^KXButtonMaker* (BOOL flag) {
        self.button.layer.masksToBounds = flag;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(CGFloat))layerBorderWidth {
    return ^KXButtonMaker* (CGFloat width) {
        self.button.layer.borderWidth = width;
        return self;
    };
}

- (KXButtonMaker* _Nonnull (^)(UIColor* _Nonnull))layerBorderColor {
    return ^KXButtonMaker* (UIColor* color) {
        self.button.layer.borderColor = color.CGColor;
        return self;
    };
}

@end


/// UIButton分类的实现
@implementation UIButton (KXMaker)

+ (instancetype)kx_make:(void (^)(KXButtonMaker *make, UIButton *button))make {
    
    KXButtonMaker* maker = [[KXButtonMaker alloc] initView];
    if (make) {
        make(maker, maker.button);
    }
    
    return maker.button;
}

@end
