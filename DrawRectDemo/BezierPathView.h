//
//  BezierPathView.h
//  DrawRectDemo
//
//  Created by mac-333 on 16/4/15.
//  Copyright © 2016年 HHSX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BezierPathView : UIView
@property (nonatomic, strong) NSMutableArray *points;
- (void)updatePathsWith:(CGFloat)strokeEnd;
- (void)clean;
@end
