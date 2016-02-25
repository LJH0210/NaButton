//
//  NAStatusButton.m
//  NaButton
//
//  Created by ND on 16/2/17.
//  Copyright © 2016年 LJH. All rights reserved.
//

#import "NAStatusButton.h"
#import "NAThirdOrderBerzier.h"

@interface NAStatusButton (){

}
@property (assign,nonatomic) bool isNaIsLoading;
- (void)initCommonSetting;
@end

@implementation NAStatusButton

+ (NAStatusButton *)buttonWithNaButtonType:(NAStatusButtonType)buttonType{
    NAStatusButton *bt;
    switch (buttonType) {
        case NAStatusButtonNormal:
        {
            bt = [NAStatusButton buttonWithType:UIButtonTypeCustom];
            bt.backgroundColor = [UIColor blueColor];
            [bt initCommonSetting];
        }
            break;
            
        default:
            break;
    }
    return bt;
}

- (void)initCommonSetting{
    [self addTarget:self action:@selector(naButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    _isNaIsLoading = NO;
}

- (void)setIsNaIsLoading:(bool)isNaIsLoading {
    if (_isNaIsLoading != isNaIsLoading) {
        _isNaIsLoading = isNaIsLoading;
        if (_isNaIsLoading) {
            NSLog(@"dra");
            
            
            
        }else{
            if (_na_statusButtonDoneBlock) {
                _na_statusButtonDoneBlock();
            }
        }
    }
}

- (void)naButtonClick:(NAStatusButton *)bt{
    self.isNaIsLoading = YES;
[self setNeedsDisplay];
    __weak typeof(self) weakself = self;
    if (_na_StatusButtontouchUpInsideBlock) {
        _na_StatusButtontouchUpInsideBlock(weakself);
    }
}

- (void)statusButtonDone {
    self.isNaIsLoading = NO;
}
CGFloat na_degreesToRadians(CGFloat degrees) { return degrees * M_PI / 180; };
CGFloat na_radiansToDegrees(CGFloat radians) { return radians * 180 / M_PI; };
- (void)drawRect:(CGRect)rect{

    Point2D cp0;
    cp0.x = 0;
    cp0.y = 0;
    Point2D cp1;
    cp1.x = 0.17;
    cp1.y = 0.67;
    Point2D cp2;
    cp2.x = 0.83;
    cp2.y = 0.67;
    Point2D cp3;
    cp3.x = 1;
    cp3.y = 0;
    Point2D (cpa)[4] = {cp0,cp1,cp2,cp3};
    Point2D po[30];
    PointsOnCubicBezier(cpa, 30, po);
    
    
    float speedBerzier[30];
    float radiusBerzier[30];
    int maxSpeed = 30;
    for (int i = 0; i < 30; i++) {
        Point2D point = po[i];
        float radius = 360.0 * point.y;
        float speed = point.y * maxSpeed;
        speedBerzier[i] = speed;
        radiusBerzier[i] = radius;
    }
    
    
    
//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    CGContextBeginPath(ref);
//    CGContextMoveToPoint(ref, 0, 0);
//    for (int i = 0; i<30; i++) {
//        Point2D po2 = po[i];
//        float x = po2.x * 44;
//        float y = po2.y * 44;
//        
//        CGContextAddLineToPoint(ref, x, y);
//        NSLog(@"before %f %f",po2.x,po2.y);
//        NSLog(@" %f  %f",x,y);
//    }
//    CGContextSetFillColorWithColor(ref, [UIColor redColor].CGColor);
//    CGContextStrokePath(ref);
    
    
    
    
    
    
    
    
}



@end
