//
//  ListViewController.m
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import "ListViewController.h"
#import <Masonry/Masonry.h>
#import "DetailViewController.h"
#import "UIViewController+HHTransitionAnimator.h"
#import "HHFadeTransitionAnimator.h"
#import "HHMoveTransitionAnimator.h"


@interface ListViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [tableView registerClass:[ListViewCell class] forCellReuseIdentifier:@"identifier"];
    self.tableView = tableView;

}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:@"identifier"];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    self.currentCell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    HHTransitionAnimator *animator = [HHMoveTransitionAnimator new];
    [self hh_presentViewController:[DetailViewController new] animated:YES animator:animator completion:nil];

}
@end





@implementation ListViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"1.jpg"];
        imageView.contentMode = UIViewContentModeRedraw;
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 20;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(20);
            make.right.bottom.offset(-20);
        }];
        self.imageV = imageView;
        
    }
    return self;
}

@end
