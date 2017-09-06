//
//  ViewController.m
//  JJCToolsDemo
//
//  Created by 苜蓿鬼仙 on 2017/9/6.
//  Copyright © 2017年 苜蓿鬼仙. All rights reserved.
//

#import "ViewController.h"

#import "JJCTools.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString *message = [NSString stringWithFormat:@"AppIcon：%@\nDisplayName：%@\nBundleName：%@\nShortVersion：%@\nBundleVersion：%@\nBundleIdentifier：%@\n", [JJCToolsObject jjc_getAppIconImageString], [JJCToolsObject jjc_getAppBundleDisplayNameString], [JJCToolsObject jjc_getAppBundleNameString], [JJCToolsObject jjc_getAppBundleShortVersionString], [JJCToolsObject jjc_getAppBundleVersionString], [JJCToolsObject jjc_getAppBundleIdentifierString]];
    
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:action];
    
    
    [self presentViewController:alertVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
