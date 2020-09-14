//
//  HHTransitionAnimator.h
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HHViewControllerTransitionTypePresent,
    HHViewControllerTransitionTypeDismiss,
    
} HHViewControllerTransitionType;


typedef void(^HHTransitionAnimateBlock)(id <UIViewControllerContextTransitioning> _Nonnull transitionContext);

NS_ASSUME_NONNULL_BEGIN


@interface HHTransitionAnimator : UIPercentDrivenInteractiveTransition <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>

@property (nonatomic, assign) HHViewControllerTransitionType transitionType;;

//动画时长，默认1s
@property (nonatomic, assign) NSTimeInterval transitionDuration;

//自定义转场动画
@property (nonatomic, copy  ) HHTransitionAnimateBlock presentAnimate;
@property (nonatomic, copy  ) HHTransitionAnimateBlock dismissAnimate;

//支持手势驱动返回
@property (nonatomic, assign) BOOL interacting; 
@property (nonatomic, weak  ) UIViewController *gestureVC;
- (void)addGestureToViewController:(UIViewController *)vc;

@end

NS_ASSUME_NONNULL_END
