//
//  XSHFPSLabel.h
//  XSHMonitorFPS
//
//  Created by 轩辕辉 on 2018/3/20.
//  Copyright © 2018年 轩辕辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XSHFPSLabel : UILabel
/** 单例 */
+(instancetype)shareFPS;
/** 显示 FPS */
-(void)showFPS;
/** 隐藏 FPS */
-(void)hiddenFPS;
@end
