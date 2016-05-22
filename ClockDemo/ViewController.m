//
//  ViewController.m
//  ClockDemo
//
//  Created by 吴铭彦 on 16/5/18.
//  Copyright © 2016年 MingYan. All rights reserved.
//

#import "ViewController.h"
#import "ClockView.h"

#define CURRENTSECOND [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ClockView *cw = [[ClockView alloc] init];
    
    [self.view addSubview:cw];
    
    [cw setNeedsDisplay];
    
    [cw start];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
