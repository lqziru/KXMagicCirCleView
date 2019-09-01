//
//  ViewController.m
//  KXMagicCirCleView
//
//  Created by ldhonline on 2019/9/1.
//  Copyright © 2019 com.aidoutu.kit. All rights reserved.
//

#import "ViewController.h"
#import "KXMagicCirCleView.h"
#import "KXViewMakerHeader.h"
#import "UIImage+Category.h"
#import "UIColor+Category.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *effectView = [KXMagicCirCleView kx_make:^(KXViewMaker *make, UIView *view) {
        make.addTo(self.view);
    } withFrame:CGRectMake(CGRectGetWidth([UIScreen mainScreen].bounds)/ 2 - 150, 350, 300, 300)];
    
    
    [UIImageView kx_make:^(KXImageViewMaker *make, UIImageView *imageView) {
        UIImage *bg = [UIImage imageNamed:@"page.jpg"];
        make.addTo(self.view)
            .frame(CGRectMake(0, 0, 300, 300))
            .image([bg imageByRoundCornerRadius: bg.size.width/2])
            .layerCornerRadius(150);
        
        imageView.center = effectView.center;
        imageView.layer.shadowColor = [UIColor colorWithHex:@"#40E1CB"].CGColor;
        imageView.layer.shadowOpacity = 0.5;
        imageView.layer.shadowOffset = CGSizeMake(0, 0);
        imageView.layer.shadowRadius = 10;
    }];
}


@end
