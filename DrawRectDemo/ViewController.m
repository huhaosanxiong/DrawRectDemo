//
//  ViewController.m
//  DrawRectDemo
//
//  Created by mac-333 on 16/4/15.
//  Copyright © 2016年 HHSX. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "BezierPathView.h"
#import "UIControl+ActionBlock.h"
@interface ViewController ()
{
    BezierPathView *view;
}
@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UIButton *cleanButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CustomView *view = [[CustomView alloc]initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    
    view = [[BezierPathView alloc]initWithFrame:self.view.bounds];

    [self.view addSubview:view];
    
    
    
    
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 50, 200, 30)];
    _slider.minimumValue = 0;
    _slider.maximumValue = 1;
    _slider.value = 1;
    [self.view addSubview:_slider];
    __weak typeof(self)weakSelf = self;

    [_slider handleControlEvent:UIControlEventValueChanged withBlock:^(id sender) {
        [view updatePathsWith:weakSelf.slider.value];
    }];
    
    _cleanButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 200, 30)];
    [_cleanButton setTitle:@"clean" forState:UIControlStateNormal];
    [_cleanButton setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:_cleanButton];
    [_cleanButton handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        [view clean];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
