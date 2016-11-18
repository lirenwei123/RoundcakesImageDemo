//
//  RoundcakesView.m
//  RoundcakesImageDemo
//
//  Created by rwli on 16/11/18.
//  Copyright © 2016年 companyName. All rights reserved.
//

#import "RoundcakesView.h"

@implementation RoundcakesView


- (void)drawRect:(CGRect)rect {
    if (self.dataArry.count==0) {
        self.dataArry=[NSArray arrayWithObjects:@.2,@.3,@.4,@.1, nil];
    }
    CGPoint center =CGPointMake(rect.size.width*.5, rect.size.height*.5);
    CGFloat startAngel=0;
    CGFloat r =MIN(rect.size.width, rect.size.height)*0.45;
    for (int i=0; i<self.dataArry.count; i++) {
        CGFloat endAngel =startAngel+M_PI*2*[self.dataArry[i] floatValue];
        UIBezierPath *path =[UIBezierPath bezierPathWithArcCenter:center radius:r startAngle:startAngel endAngle:endAngel clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1] set];
        [path fill];
        
        startAngel =endAngel;
    }

}


-(void)setDataArry:(NSArray *)dataArry{
    _dataArry =dataArry;
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    self.dataArry=[NSArray arrayWithObjects:@.1,@.2,@.3,@.15,@.15,@.1, nil];

    }
@end
