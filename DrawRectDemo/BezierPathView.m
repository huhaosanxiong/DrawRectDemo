//
//  BezierPathView.m
//  DrawRectDemo
//
//  Created by mac-333 on 16/4/15.
//  Copyright © 2016年 HHSX. All rights reserved.
//

#import "BezierPathView.h"
#import <QuartzCore/QuartzCore.h>
@interface BezierPathView ()
{
    UIBezierPath *path;
}
@end
@implementation BezierPathView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (Class)layerClass{
    
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.points = [NSMutableArray array];
        
        self.backgroundColor = [UIColor whiteColor];
        
//        ((CAShapeLayer *)self.layer).fillColor = nil;
        
//        ((CAShapeLayer *)self.layer).strokeColor = [UIColor blueColor].CGColor;
    }
    return self;
}
- (void)clean
{
    [path removeAllPoints];
    [self.points removeAllObjects];
    [self updatePathsWith:1];
}
- (void)updatePathsWith:(CGFloat)strokeEnd
{
    if ([self.points count]>1) {
        
        path = [[UIBezierPath alloc]init];
        
        [path moveToPoint:[[self.points firstObject] CGPointValue]];
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, [self.points count] - 1)];
        
        [self.points enumerateObjectsAtIndexes:indexSet options:0 usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            [path addLineToPoint:[obj CGPointValue]];
        }];
        CAShapeLayer *shapeLayer = ((CAShapeLayer *)self.layer);
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [UIColor blueColor].CGColor;
        shapeLayer.fillColor = [[UIColor clearColor] CGColor];
        shapeLayer.lineWidth = 2;
        
        shapeLayer.strokeStart = 0;
        shapeLayer.strokeEnd = strokeEnd;
        
    }else{
        
        ((CAShapeLayer *)self.layer).path = nil;
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    
    [self.points addObject:[NSValue valueWithCGPoint:point]];
    
    [self updatePathsWith:1];
}
@end
