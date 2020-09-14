//
//  DetailViewController.m
//  HHTransitionAnimatorDemo
//
//  Created by herui on 2020/9/11.
//  Copyright © 2020 test. All rights reserved.
//

#import "DetailViewController.h"
#import <Masonry/Masonry.h>

@interface DetailViewController ()
@end

@implementation DetailViewController

- (void)dealloc
{
    NSLog(@"dealloc - %@", NSStringFromClass([self class]));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [UIImageView new];
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.contentMode = UIViewContentModeRedraw;
    [self.view addSubview:imageView];
    
    self.imageView = imageView;
    
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.adjustsFontSizeToFitWidth = YES;
    label.minimumScaleFactor = 0.1;
    label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;

    label.text = @"在历经8个多月惊心动魄的抗疫大战之后，9月8日，全国抗击新冠肺炎疫情表彰大会在京举行。这是一场致敬英雄、表彰先进的大会，也是一场总结经验、启示未来的大会。在这场举世瞩目的大会上，习近平总书记首次全面阐述伟大抗疫精神。\n\n在表彰大会上，钟南山被授予“共和国勋章”，张伯礼、张定宇、陈薇被授予“人民英雄”国家荣誉称号。2016年1月1日起施行的《中华人民共和国国家勋章和国家荣誉称号法》明确，国家勋章和国家荣誉称号是国家最高荣誉。去年9月29日，我国首次开展国家勋章和国家荣誉称号集中评选颁授，8人被授予共和国勋章，6人被授予友谊勋章，28人被授予国家荣誉称号。据介绍，国家勋章和国家荣誉称号一般每5年授予1次，在中华人民共和国成立“逢五、逢十”周年时进行，有需要时可以及时授予。时隔一年，打破常规，再次颁授，足见重视。\n\n";
    [self.view addSubview:label];
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeContactAdd];
    close.transform = CGAffineTransformMakeRotation(M_PI_4);
    [self.view addSubview:close];


    [imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.equalTo(imageView.mas_width).multipliedBy(300/374.0);
    }];
    [label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView).offset(10);
        make.right.equalTo(imageView).offset(-10);
        make.top.equalTo(imageView.mas_bottom).offset(20);
    }];
    [close mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView).offset(40);
        make.right.equalTo(imageView).offset(-20);
    }];

    [close addTarget:self action:@selector(onClose) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)onClose
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
