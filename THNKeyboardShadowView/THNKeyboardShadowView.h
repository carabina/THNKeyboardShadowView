//
//  THNKeyboardShadowView.h
//  UnitTest
//
//  Created by ZhangHonglin on 2017/3/8.
//  Copyright © 2017年 h.enc. All rights reserved.
//

/**
 * THNKeyboardShadowView function description:
 * When editing UITxtField/UITextView, touch other field, keyboard dismiss,
 * touch same UITextField/UITextView, keyboard still appear.
 */

#import <UIKit/UIKit.h>

@interface THNKeyboardShadowView : UIWindow
/*!
 *  @author HonglinZhang, 17-03-08 12:03:01
 *
 *  @brief enable the shadow function (default is YES)
 */
@property (nonatomic, assign) BOOL enabled;

+ (instancetype)sharedInstance;

@end
