//
//  ViewController.m
//  iOS扩大按钮点击区域（关联属性）
//
//  Created by 冯宇的Mac mini on 2019/6/10.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+FYLagerTouchClick.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // btn 是居中的，设置 btn 响应区域扩大至背景区域
    CGRect frame = _btn.frame;
    NSLog(@"%@",NSStringFromCGRect(frame));
//    [_btn setFyLargeEdgeWithTop:frame.origin.y right:frame.origin.x bottom:frame.origin.y left:frame.origin.x];
    [_btn setFyLargeEdgeWithTop:10 right:186 bottom:10 left:186];
}

- (IBAction)btnClick:(UIButton *)sender {
    
    [_btn setBackgroundColor:[self randomColor]];
}
- (UIColor *)randomColor
{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}
@end
