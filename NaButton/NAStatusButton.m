//
//  NAStatusButton.m
//  NaButton
//
//  Created by ND on 16/2/17.
//  Copyright © 2016年 LJH. All rights reserved.
//

#import "NAStatusButton.h"
#import "NAThirdOrderBerzier.h"
#import <QuartzCore/QuartzCore.h>

@interface NAStatusButton () {
}
@property(assign, nonatomic) bool isNaIsLoading;
- (void)initCommonSetting;
@end

@implementation NAStatusButton

+ (NAStatusButton *)buttonWithNaButtonType:(NAStatusButtonType)buttonType {
  NAStatusButton *bt;
  switch (buttonType) {
  case NAStatusButtonNormal: {
    bt = [NAStatusButton buttonWithType:UIButtonTypeCustom];
    bt.backgroundColor = [UIColor blueColor];
    [bt initCommonSetting];
  } break;

  default:
    break;
  }
  return bt;
}

- (void)initCommonSetting {
  [self addTarget:self
                action:@selector(naButtonClick:)
      forControlEvents:UIControlEventTouchUpInside];
  _isNaIsLoading = NO;
}

- (void)setIsNaIsLoading:(bool)isNaIsLoading {
  if (_isNaIsLoading != isNaIsLoading) {
    _isNaIsLoading = isNaIsLoading;
    if (_isNaIsLoading) {
      NSLog(@"dra");

    } else {
      if (_na_statusButtonDoneBlock) {
        _na_statusButtonDoneBlock();
      }
    }
  }
}

- (void)naButtonClick:(NAStatusButton *)bt {
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
- (void)drawRect:(CGRect)rect {

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
  Point2D(cpa)[4] = {cp0, cp1, cp2, cp3};
  Point2D po[30];
  PointsOnCubicBezier(cpa, 30, po);

  float degreeArray[30];
  float berzier[30];
  for (int i = 0; i < 30; i++) {
    Point2D point = po[i];
    degreeArray[i] = 180 * point.y;
  }

  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, 1);
  CGContextAddArc(context, 100, 100, 40, 0, 90, 1);
  CGContextDrawPath(context, kCGPathStroke);
}

@end
