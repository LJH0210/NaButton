//
//  NAThirdOrderBerzier.h
//  NaButton
//
//  Created by ND on 16/2/19.
//  Copyright © 2016年 LJH. All rights reserved.
//

#ifndef NAThirdOrderBerzier_h
#define NAThirdOrderBerzier_h

#include <stdio.h>

#endif /* NAThirdOrderBerzier_h */


typedef struct
{
    float x;
    float y;
}
Point2D;

Point2D PointOnCubicBezier( Point2D* cp, float t );
void PointsOnCubicBezier(Point2D *cp,int keyFrame,Point2D *cpResult);