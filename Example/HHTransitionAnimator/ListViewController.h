//
//  ListViewController.h
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface ListViewCell : UITableViewCell
@property (nonatomic, weak  ) UIImageView *imageV;
@end


@interface ListViewController : UIViewController

@property (nonatomic, weak  ) UITableView *tableView;
@property (nonatomic, weak  ) ListViewCell *currentCell;


@end

NS_ASSUME_NONNULL_END
