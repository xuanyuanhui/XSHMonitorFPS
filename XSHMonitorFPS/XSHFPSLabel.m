//
//  XSHFPSLabel.m
//  XSHMonitorFPS
//
//  Created by 轩辕辉 on 2018/3/20.
//  Copyright © 2018年 轩辕辉. All rights reserved.
//

#import "XSHFPSLabel.h"

@interface XSHFPSLabel()<NSCopying,NSMutableCopying>
@property (nonatomic,strong) CADisplayLink *displayLink;
@property (nonatomic,assign) NSTimeInterval lastTime;
@property (nonatomic,assign) NSInteger count;
@end

@implementation XSHFPSLabel
static XSHFPSLabel *_instance;
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}
+(instancetype)shareFPS{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}
-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

#pragma mark 布局
-(void)setUpUI{
    self.frame = CGRectMake(10,100,75, 25);
    self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.25];
    self.textAlignment = NSTextAlignmentCenter;
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = YES;
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLineMotherd)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark displayLine
-(void)displayLineMotherd{
    if (self.lastTime == 0) {
        self.lastTime = self.displayLink.timestamp;
        return;
    }
    self.count ++;
    NSTimeInterval timeout = self.displayLink.timestamp - self.lastTime;
    if (timeout < 1) return;
    self.lastTime = self.displayLink.timestamp;
    float fps = self.count / timeout;
    self.count = 0;
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d  FPS",(int)round(fps)]];
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, text.length - 3)];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(text.length - 3, 3)];
    [text addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0, text.length)];
    [text addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:4] range:NSMakeRange(text.length - 4, 1)];
    self.attributedText = text;
}

#pragma mark 显示
-(void)showFPS{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self];
    [window insertSubview:self atIndex:999];
}

#pragma mark 隐藏
-(void)hiddenFPS{
    if (self.displayLink) {
        [self.displayLink invalidate];
        self.displayLink = nil;
    }
    [self removeFromSuperview];
}
@end
