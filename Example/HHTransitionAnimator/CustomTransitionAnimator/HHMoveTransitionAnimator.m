//
//  HHMoveTransitionAnimator.m
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import "HHMoveTransitionAnimator.h"
#import <Masonry/Masonry.h>

#import "ListViewController.h"
#import "DetailViewController.h"

@implementation HHMoveTransitionAnimator

- (instancetype)init
{
    if(self = [super init]){
        
        self.transitionDuration = 3;
        
        __weak typeof(self) weakSelf = self;
        self.presentAnimate = ^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            
            ListViewController *listVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            DetailViewController *detailVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

            CGRect finalFrame = [transitionContext finalFrameForViewController:detailVC];
            CGRect initialFrame = CGRectInset(listVC.currentCell.frame, 20, 20);
            initialFrame.origin.y -= listVC.tableView.contentOffset.y;
            
            detailVC.view.frame = initialFrame;
            detailVC.view.clipsToBounds = YES;
            detailVC.view.layer.cornerRadius = listVC.currentCell.imageV.layer.cornerRadius;

            [UIView animateKeyframesWithDuration:weakSelf.transitionDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                
                [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:2/3.0 animations:^{
                    
                    CGFloat scale = CGRectGetWidth(initialFrame) / CGRectGetWidth(finalFrame);
                    CGRect frame = initialFrame;
                    frame.size.height = CGRectGetHeight(finalFrame) * scale;
                    frame.origin.y = (CGRectGetHeight(finalFrame) - frame.size.height) * 0.5;
                    detailVC.view.frame = frame;
                }];
                [UIView addKeyframeWithRelativeStartTime:2/3.0 relativeDuration:1/3.0 animations:^{
                    
                    CGFloat scale = CGRectGetWidth(finalFrame) / CGRectGetWidth(initialFrame);
                    detailVC.view.transform = CGAffineTransformMakeScale(scale, scale);
                }];
                
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

        };
        self.dismissAnimate = ^(id<UIViewControllerContextTransitioning>  _Nonnull transitionContext) {
            
            ListViewController *listVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
            DetailViewController *detailVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

            CGRect finalFrame = CGRectInset(listVC.currentCell.frame, 20, 20);
            finalFrame.origin.y -= listVC.tableView.contentOffset.y;


            [UIView animateKeyframesWithDuration:weakSelf.transitionDuration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                
                [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1/3.0 animations:^{
                    detailVC.view.transform = CGAffineTransformIdentity;
                }];
                [UIView addKeyframeWithRelativeStartTime:1/3.0 relativeDuration:2/3.0 animations:^{
                    detailVC.view.frame = finalFrame;
                }];
                
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];

        };
        
    }
    return self;
}



- (void)addGestureToViewController:(UIViewController *)vc
{
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [vc.view addGestureRecognizer:ges];
}

- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)ges
{
    CGFloat progress = [ges translationInView:ges.view].y / 300;
    
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



@end
