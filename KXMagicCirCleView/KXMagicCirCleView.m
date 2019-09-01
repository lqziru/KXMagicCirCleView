//
//  KXMagicCirCleView.m
//  KXMagicCirCleView
//
//  Created by ldhonline on 2019/9/1.
//  Copyright © 2019 com.aidoutu.kit. All rights reserved.
//

#import "KXMagicCirCleView.h"
#import "UIColor+Category.h"
#import "CAMagicLineLayer.h"

@interface KXMagicCirCleView()<CAAnimationDelegate>

@end

@implementation KXMagicCirCleView
{
    CAMagicLineLayer *layer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.backgroundColor = [UIColor grayColor];
        [self kx_setupSubviews];
    }
    return self;
}

- (void)kx_setupSubviews
{
    for (int i = 0; i < 2; i++) {
        layer = [[CAMagicLineLayer alloc] init];
        layer.lineWidth = 1;
        layer.animDuration = 3;
        layer.fillColor = [UIColor colorWithHex:@"#4993FF" alpha:0].CGColor;
        layer.strokeColor = [UIColor colorWithHex:@"#4993FF" alpha:0.3*(i+1)].CGColor;
        layer.frame = self.bounds;
 
        [layer startWithDelay: i * 1];
        
        [self.layer addSublayer: layer];
    }
    
    CABasicAnimation * rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnim.toValue = @(2 * M_PI);
    rotationAnim.repeatCount = MAXFLOAT;
    rotationAnim.duration = 40;
    
    [self.layer addAnimation:rotationAnim forKey:@"rotationAnim"];
}
@end
