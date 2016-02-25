//
//  NAStatusButton.h
//  NaButton
//
//  Created by ND on 16/2/17.
//  Copyright © 2016年 LJH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NAStatusButton;
typedef enum : NSUInteger {
    NAStatusButtonNormal = 1 <<1
} NAStatusButtonType;

typedef void(^Na_naStatusButtonTouchUpInside)(__weak NAStatusButton *statusButton);
typedef void(^Na_naStatusButtonLoadDone)();

@interface NAStatusButton : UIButton
@property (nonatomic,copy) Na_naStatusButtonTouchUpInside na_StatusButtontouchUpInsideBlock;
@property (nonatomic,copy) Na_naStatusButtonLoadDone na_statusButtonDoneBlock;
+ (NAStatusButton *)buttonWithNaButtonType:(NAStatusButtonType)buttonType;
- (void)statusButtonDone;
@end
