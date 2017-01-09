//
//  ViewController.m
//  CountDownAnimation
//
//  Created by wangdemin on 16/10/28.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2, [UIScreen mainScreen].bounds.size.height - 200, 100, 50);
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickBtn {
    [self countDown:10];
}

-(void)countDown:(int)count {
    if(count <=0){
        //倒计时已到，作需要作的事吧。
        return;
    }
    
    UILabel* lblCountDown = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2, 120, 100, 100)];
    lblCountDown.textColor = [UIColor blackColor];
    lblCountDown.textAlignment = NSTextAlignmentCenter;
    lblCountDown.font = [UIFont boldSystemFontOfSize:80];
    lblCountDown.backgroundColor = [UIColor clearColor];
    lblCountDown.text = [NSString stringWithFormat:@"%d", count];
    [self.view addSubview:lblCountDown];
    
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        lblCountDown.alpha = 0.5;
        lblCountDown.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
    } completion:^(BOOL finished) {
        [lblCountDown removeFromSuperview];
        //递归调用，直到计时为零
        [self countDown:count -1];
    }];
}

@end
