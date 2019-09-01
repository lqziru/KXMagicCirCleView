//
//  CAMagicLineLayer.h
//  KXMagicCirCleView
//
//  Created by ldhonline on 2019/9/1.
//  Copyright © 2019 com.aidoutu.kit. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAMagicLineLayer : CAShapeLayer
@property (nonatomic, assign) NSInteger offset;
@property (nonatomic, assign) CFTimeInterval animDuration;

- (void)startWithDelay:(CGFloat)delay;
@end

NS_ASSUME_NONNULL_END
