//
//  UIViewController+HHTransitionAnimator.m
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import "UIViewController+HHTransitionAnimator.h"
#import <objc/runtime.h>

@implementation UIViewController (HHTransitionAnimator)

- (void)hh_presentViewController:(UIViewController *)vc animated:(BOOL)flag animator:(HHTransitionAnimator *)animator completion:(void (^ __nullable)(void))completion;
{
    self.hh_transitionAnimator = animator;
    self.hh_transitionAnimator.gestureVC = vc;
    vc.transitioningDelegate = self.hh_transitionAnimator;
    vc.modalPresentationStyle = UIModalPresentationCustom;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:vc animated:flag completion:completion];
    });
}


#pragma mark - getter & setter
- (void)setHh_transitionAnimator:(HHTransitionAnimator *)hh_transitionAnimator
{
    objc_setAssociatedObject(self, @selector(hh_transitionAnimator), hh_transitionAnimator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (HHTransitionAnimator *)hh_transitionAnimator
{
    return objc_getAssociatedObject(self, @selector(hh_transitionAnimator));
}


@end
