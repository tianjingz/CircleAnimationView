//
//  ViewController.m
//  Circle
//
//  Created by fsjx on 2017/7/17.
//  Copyright © 2017年 tj. All rights reserved.
//

#import "ViewController.h"
#import "CircleAnimationView.h"
@interface ViewController (){
    
 CircleAnimationView *_circleview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor lightGrayColor];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        _circleview = [[CircleAnimationView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 85/2, 20, 85, 85)];
    _circleview.score = 0.5;
        [self.view addSubview:_circleview];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
