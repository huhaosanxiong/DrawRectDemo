//
//  CustomView.m
//  DrawRectDemo
//
//  Created by mac-333 on 16/4/15.
//  Copyright © 2016年 HHSX. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(CGRect)rect {
#if 0    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);

    //1
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 100, 100);
    
    CGPathAddArcToPoint(path, NULL, 100, 200, 200, 200, 100);
    
    CGContextAddPath(context, path);
    
    //2
    CGMutablePathRef path1 = CGPathCreateMutable();
    
    CGPathMoveToPoint(path1, NULL, 200, 200);
    
    CGPathAddArcToPoint(path1, NULL, 300, 200, 300, 100, 100);
    
    CGContextAddPath(context, path1);
    
    CGContextStrokePath(context);


    //正弦函数
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 0, 200);
    
    CGPathAddCurveToPoint(path, NULL, 150, 0, 150, 400, 300, 200);
    
    CGContextAddPath(context, path);
    
    CGContextStrokePath(context);
#endif
}


@end
