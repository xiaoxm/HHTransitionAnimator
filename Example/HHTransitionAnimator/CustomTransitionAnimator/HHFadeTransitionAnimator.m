//
//  HHFadeTransitionAnimator.m
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import "HHFadeTransitionAnimator.h"

@implementation HHFadeTransitionAnimator

- (instancetype)init
{
    if(self = [super init]){
        
        self.transitionDuration = 0.3;
        
        __weak typeof(self) weakSelf = self;
        self.presentAnimate = ^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {

            UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
            toView.alpha = 0;
            [UIView animateWithDuration:weakSelf.transitionDuration animations:^{
                toView.alpha = 1;
            }completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
            
        };
        self.dismissAnimate = ^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            
            UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
            fromView.alpha = 1;
            [UIView animateWithDuration:weakSelf.transitionDuration animations:^{
                fromView.alpha = 0;
            }completion:^(BOOL finished) {
                [transitionContext completeTransition:YES];
            }];
        };
        
    }
    return self;
}

@end
