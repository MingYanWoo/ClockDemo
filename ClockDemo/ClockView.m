//
//  ClockView.m
//  ClockDemo
//
//  Created by 吴铭彦 on 16/5/18.
//  Copyright © 2016年 MingYan. All rights reserved.
//

#import "ClockView.h"

#define CURRENTSECOND [[NSCalendar currentCalendar] component:NSCalendarUnitSecond fromDate:[NSDate date]]
#define CURRENTMINUTE [[NSCalendar currentCalendar] component:NSCalendarUnitMinute fromDate:[NSDate date]]
#define CURRENTHOUR [[NSCalendar currentCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]]
#define CURRENTNANOSECOND [[NSCalendar currentCalendar] component:NSCalendarUnitNanosecond fromDate:[NSDate date]]

@interface ClockView ()


@end


@implementation ClockView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"12"];
        
        self.frame = CGRectMake(63, 100, image.size.width, image.size.height);
        
        self.backgroundColor = [UIColor colorWithPatternImage:image];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(self.center.x - 63, self.center.y - 100);
    
    //从底往上添加时针、分针、秒针
    //hourHand
    [self timePointerWithCenter:center angle:M_PI * 2 / 12 * CURRENTHOUR - M_PI_2 + (CURRENTMINUTE *M_PI*2/12/60) radius:50 lineWidth:5.0 color:[UIColor blackColor]];

    //minuteHand
    [self timePointerWithCenter:center angle:M_PI * 2 / 60 * CURRENTMINUTE - M_PI_2 + (CURRENTSECOND * M_PI *2/60/60) radius:70 lineWidth:4.0 color:[UIColor blackColor]];
    
    //secondHand
    //M_PI_2 / 15 * CURRENTSECOND - M_PI_2
    [self timePointerWithCenter:center angle:M_PI_2 / 15 * CURRENTSECOND - M_PI_2 + (CURRENTNANOSECOND * M_PI *2/60/1000000000) radius:90 lineWidth:1.0 color:[UIColor redColor]];
    
    //绘制时钟中心点
    //黑圈
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:5 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    path.lineWidth = 3.0;
    
    [[UIColor yellowColor] set];
    
    [path stroke];
    
    //黄色填充
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:center radius:4 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    [[UIColor blackColor] set];
    
    [path1 fill];
}

//绘制指针
- (void)timePointerWithCenter:(CGPoint)center angle:(CGFloat)angle radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth color:(UIColor *)color
{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:angle endAngle:angle clockwise:YES];
    
    path.lineWidth = lineWidth;
    
    path.lineCapStyle = kCGLineCapRound;
    
    [path addLineToPoint:center];
    
    [color set];
    
    [path stroke];
    

//使用计时器来更新UI
- (void)start
{
    [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
}

@end
