//
//  ViewController.m
//  XSHMonitorFPS
//
//  Created by 轩辕辉 on 2018/3/20.
//  Copyright © 2018年 轩辕辉. All rights reserved.
//

#import "ViewController.h"
#import "XSHFPSLabel.h"

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //显示FPS
    [[XSHFPSLabel shareFPS] showFPS];
}

//-(void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    //隐藏FPS
//    [[XSHFPSLabel shareFPS] hiddenFPS];
//}

@end
