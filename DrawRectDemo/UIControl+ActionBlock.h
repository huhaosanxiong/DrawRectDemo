//
//  UIControl+ActionBlock.h
//  P2P_Demo
//
//  Created by mac-333 on 16/4/12.
//  Copyright © 2016年 mac-333. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ControlActionBlock) (id sender);

@interface UIControl (ActionBlock)

- (void) handleControlEvent:(UIControlEvents)event withBlock:(ControlActionBlock)action;

@end
