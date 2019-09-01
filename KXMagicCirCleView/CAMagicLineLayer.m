//
//  CAMagicLineLayer.m
//  KXMagicCirCleView
//
//  Created by ldhonline on 2019/9/1.
//  Copyright © 2019 com.aidoutu.kit. All rights reserved.
//

#import "CAMagicLineLayer.h"

@interface CAMagicLineLayer()<CAAnimationDelegate>

@end

@implementation CAMagicLineLayer
{
    CGPathRef newPath;
    NSInteger start;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        start = arc4random() % 360;
        self.offset = 40;
        self.animDuration = 3;
    }
    return self;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        self.path = newPath;
        [self updatePath];
    }
}

- (void)startWithDelay:(CGFloat)delay
{
    self.path = [self randPath].CGPath;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self updatePath];
        });
    });
}

- (void)updatePath
{
    CGPathRef oldPath = self.path;
    newPath = [self randPath].CGPath;
    
    // 路径补间动画
    CABasicAnimation * pathAnim = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnim.fromValue = (__bridge id _Nullable)(oldPath);
    pathAnim.toValue = (__bridge id _Nullable)(newPath);
    pathAnim.removedOnCompletion = NO;
    pathAnim.fillMode = kCAFillModeForwards;
    pathAnim.duration = self.animDuration;
    pathAnim.delegate = self;
    
    [self removeAllAnimations];
    [self addAnimation:pathAnim forKey:@"pathAnimation"];
}

- (UIBezierPath *)randPath
{
    CGFloat radius = self.frame.size.width/2;
    NSMutableArray *ps = [NSMutableArray array];
    NSInteger offset = self.offset;
    
    NSUInteger count = 4;
    for (int i = 0; i < count; i++) {
        CGFloat angle = i*(360/count) + start;
        CGFloat rOffset = arc4random() % offset;
        CGFloat r = radius +  rOffset;
        CGFloat x = sin(angle / 180.0 * M_PI)*r + radius;
        CGFloat y = cos(angle / 180.0 * M_PI)*r + radius;

        [ps addObject: NSStringFromCGPoint(CGPointMake(x, y))];
    }
    
    UIBezierPath* path = [self pathWithPoints: ps];
    return path;
}


- (UIBezierPath *)pathWithPoints:(NSArray *)points
{
    UIBezierPath* path = [[UIBezierPath alloc] init];
    
    if ([points count] < 4) {
        return path;
    }
    
    CGPoint firstPoint = CGPointFromString(points[1]);
    [path moveToPoint: firstPoint];
    NSUInteger count = [points count];
    for (int i = 0; i < count; i++) {
        CGPoint p0 = CGPointFromString(points[i]);
        CGPoint p1 = CGPointFromString(points[(i + 1)%count]);
        CGPoint p2 = CGPointFromString(points[(i + 2)%count]);
        CGPoint p3 = CGPointFromString(points[(i + 3)%count]);
        [self getControlPointx0:p0.x andy0:p0.y
                             x1:p1.x andy1:p1.y
                             x2:p2.x andy2:p2.y
                             x3:p3.x andy3:p3.y
                           path:path];
    }
    
    return path;
}


-(void) getControlPointx0:(CGFloat)x0  andy0:(CGFloat)y0
                       x1:(CGFloat)x1  andy1:(CGFloat)y1
                       x2:(CGFloat)x2  andy2:(CGFloat)y2
                       x3:(CGFloat)x3  andy3:(CGFloat)y3
                     path:(UIBezierPath*) path
{
    CGFloat smooth_value = 1;
    CGFloat ctrl1_x;
    CGFloat ctrl1_y;
    CGFloat ctrl2_x;
    CGFloat ctrl2_y;
    
    CGFloat xc1 = (x0 + x1) /2.0;
    CGFloat yc1 = (y0 + y1) /2.0;
    CGFloat xc2 = (x1 + x2) /2.0;
    CGFloat yc2 = (y1 + y2) /2.0;
    CGFloat xc3 = (x2 + x3) /2.0;
    CGFloat yc3 = (y2 + y3) /2.0;
    
    CGFloat len1 = sqrt((x1-x0) * (x1-x0) + (y1-y0) * (y1-y0));
    CGFloat len2 = sqrt((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1));
    CGFloat len3 = sqrt((x3-x2) * (x3-x2) + (y3-y2) * (y3-y2));
    
    CGFloat k1 = len1 / (len1 + len2);
    CGFloat k2 = len2 / (len2 + len3);
    CGFloat xm1 = xc1 + (xc2 - xc1) * k1;
    CGFloat ym1 = yc1 + (yc2 - yc1) * k1;
    CGFloat xm2 = xc2 + (xc3 - xc2) * k2;
    CGFloat ym2 = yc2 + (yc3 - yc2) * k2;
    
    ctrl1_x = xm1 + (xc2 - xm1) * smooth_value + x1 - xm1;
    ctrl1_y = ym1 + (yc2 - ym1) * smooth_value + y1 - ym1;
    ctrl2_x = xm2 + (xc2 - xm2) * smooth_value + x2 - xm2;
    ctrl2_y = ym2 + (yc2 - ym2) * smooth_value + y2 - ym2;
    
    [path addCurveToPoint:CGPointMake(x2, y2) controlPoint1:CGPointMake(ctrl1_x, ctrl1_y)controlPoint2:CGPointMake(ctrl2_x, ctrl2_y)];
}

@end
