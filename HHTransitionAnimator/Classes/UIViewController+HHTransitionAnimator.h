//
//  UIViewController+HHTransitionAnimator.h
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHTransitionAnimator.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (HHTransitionAnimator) <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) HHTransitionAnimator *hh_transitionAnimator;

@end

NS_ASSUME_NONNULL_END
