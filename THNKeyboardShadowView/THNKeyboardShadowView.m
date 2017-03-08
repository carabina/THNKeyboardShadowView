//
//  THNKeyboardShadowView.m
//  UnitTest
//
//  Created by ZhangHonglin on 2017/3/8.
//  Copyright © 2017年 h.enc. All rights reserved.
//

#import "THNKeyboardShadowView.h"

@interface THNKeyboardShadowView ()

@property (nonatomic, strong) UIView *firstResponderView;

@end

@implementation THNKeyboardShadowView

+ (void)load {
    [THNKeyboardShadowView sharedInstance].enabled = YES;
}

+ (instancetype)sharedInstance {
    static THNKeyboardShadowView *shadowViewInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shadowViewInstance = [[THNKeyboardShadowView alloc] init];
    });
    return shadowViewInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(show) name:UIKeyboardWillShowNotification object:nil];
        self.windowLevel = UIWindowLevelStatusBar;
    }
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)show {
    if (!self.enabled) return;
    self.firstResponderView = [self getFirstResponderView];
    self.hidden = NO;
}

- (void)dismiss {
    self.hidden = YES;
    self.firstResponderView = nil;
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

#pragma mark - Touch
// 判断点击window时点击事件是否响应：点击的位置不是第一响应者的位置时，响应点击事件，否则不响应
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.firstResponderView) {
        CGPoint targetPoint = [self convertPoint:point toView:self.firstResponderView.window];
        UIView *hitView = [self.firstResponderView.window hitTest:targetPoint withEvent:event];
        if (hitView && hitView == self.firstResponderView) {
            return nil;
        }
    }
    
    return self;
}

// 点击生效时，键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}

#pragma mark - Utility

- (UIView *)getFirstResponderView {
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *item in windows) {
        UIView *responderView = [item performSelector:@selector(firstResponder)];
        if (responderView && [responderView isKindOfClass:[UIView class]]) {
            return responderView;
        }
    }
    
    return nil;
}

@end
