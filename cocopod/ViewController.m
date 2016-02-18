//
//  ViewController.m
//  cocopod
//
//  Created by 江苏齐欣技术部电脑 on 16/2/1.
//  Copyright © 2016年 江苏齐欣技术部电脑. All rights reserved.
//

#import "ViewController.h"
#import<UIImageView+WebCache.h>
#import "Download.h"
@interface ViewController ()
{
  
    NSOperationQueue * queue;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100) ];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    Download * load =[[Download alloc]init];
    [load DownloadTextFile:nil fileName:nil];
    
}
- (void)clickButton
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"path:  %@",path);
    
   // NSString *str = @"UpdateFrame.framework";
    NSString *destPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/UpdateFrame.framework"];
    
    NSBundle *bundleFrame = [NSBundle bundleWithPath:destPath];
    
    if (bundleFrame && [bundleFrame load]) {
        NSLog(@"load success");
    }else{
        NSLog(@"load fail");
        return;
    }
    
    Class testClass = NSClassFromString(@"FrameWorkStart");
    //Class testClass = [bundleFrame principalClass];
    if (!testClass) {
        NSLog(@"none  testClass");
        return;
    }
    
    NSObject *testObject = [[testClass alloc]init];
    [testObject performSelector:@selector(startWithObject:withBundle:) withObject:self withObject:bundleFrame];
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
