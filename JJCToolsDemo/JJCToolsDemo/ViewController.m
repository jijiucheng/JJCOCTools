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
    
    
    UIImage *image1 = [UIImage jjc_image_getScreenCaptureWithViewController:self];
    NSLog(@"image1 ---------- %@", image1);
    
    NSData *imagePNGData1 = UIImagePNGRepresentation(image1);
    [imagePNGData1 writeToFile:@"/Users/jijiucheng/Desktop/testDemoPNG1.png" atomically:YES];

    
    UIImage *image2 = [UIImage jjc_image_getScreenCaptureWithViewController:self viewFrame:CGRectMake(0, 0, 300, 300) cornerRadius:20];
    NSLog(@"image2 ---------- %@", image2);
    
    NSData *imagePNGData2 = UIImagePNGRepresentation(image2);
    [imagePNGData2 writeToFile:@"/Users/jijiucheng/Desktop/testDemoPNG2.png" atomically:YES];
    
    
    UIImage *image3 = [UIImage jjc_image_getImageWithColor:[UIColor blackColor] alpha:0];
    NSLog(@"image3 ---------- %@", image3);
    
    NSData *imagePNGData3 = UIImagePNGRepresentation(image3);
    [imagePNGData3 writeToFile:@"/Users/jijiucheng/Desktop/testDemoPNG3.png" atomically:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
