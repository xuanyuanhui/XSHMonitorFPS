# XSHMonitorFPS
A simple code to monitor FPS.
一个简单的检测 FPS 代码
使用时首先导入头文件
#import "XSHFPSLabel.h"

在要检测的地方调用
    //显示FPS
    [[XSHFPSLabel shareFPS] showFPS];
    
隐藏时在需要使用的地方调用
    //隐藏FPS
    [[XSHFPSLabel shareFPS] hiddenFPS];
    
