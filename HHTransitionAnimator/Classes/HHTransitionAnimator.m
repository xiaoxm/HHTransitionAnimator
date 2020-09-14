//
//  HHTransitionAnimator.m
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import "HHTransitionAnimator.h"



@interface HHTransitionAnimator()


@end

@implementation HHTransitionAnimator

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext;
{
    return self.transitionDuration ?: 1;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext;
{
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [[transitionContext containerView] addSubview:toView];
    
    HHTransitionAnimateBlock block = self.presentAnimate;
    if(self.transitionType == HHViewControllerTransitionTypeDismiss){
        block = self.dismissAnimate;
        [[transitionContext containerView] sendSubviewToBack:toView];
    }
    
    if(block){
        block(transitionContext);
    }else{
        [transitionContext completeTransition:YES];
    }
}




#pragma mark - 手势控制相关
- (void)setGestureVC:(UIViewController *)gestureVC
{
    _gestureVC = gestureVC;
    [self addGestureToViewController:gestureVC];
}

- (void)addGestureToViewController:(UIViewController *)vc
{
    UIScreenEdgePanGestureRecognizer *ges = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    ges.edges = UIRectEdgeLeft;
    [vc.view addGestureRecognizer:ges];
}

- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)ges
{
    CGFloat progress = [ges translationInView:ges.view].x / ges.view.bounds.size.width;
    
    switch (ges.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interacting = YES;
            [self.gestureVC dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            [self updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            self.interacting = NO;
            if (progress < 0.3) {
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
        }
            break;
        default: break;
    }
}


#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.transitionType = HHViewControllerTransitionTypePresent;
    return self;
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transitionType = HHViewControllerTransitionTypeDismiss;
    return self;
}
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator;
{
    return self.interacting ? self : nil;
}

@end
