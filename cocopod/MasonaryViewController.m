//
//  MasonaryViewController.m
//  cocopod
//
//  Created by 江苏齐欣技术部电脑 on 16/2/2.
//  Copyright © 2016年 江苏齐欣技术部电脑. All rights reserved.
//

#import "MasonaryViewController.h"
#import <Masonry.h>
@interface MasonaryViewController ()
{
    UIView * sv;
    UIView * sv2;
    UIView * sv3;
}
@end

@implementation MasonaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    sv =[[UIView alloc]init];
    sv.backgroundColor = [UIColor redColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(@74);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.bottom.equalTo(@-10);
       
    }];
    
    sv2 =[[UIView alloc]init];
    sv2.backgroundColor = [UIColor orangeColor];
    [sv addSubview:sv2];
    
    sv3 = [[UIView alloc]init];
    sv3.backgroundColor = [UIColor orangeColor];
    [sv addSubview:sv3];
    
    
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(@10);
        make.right.equalTo(sv3.mas_left).with.offset(-10);
        make.top.equalTo(sv.mas_top).with.offset(10);
        make.bottom.equalTo(sv.mas_bottom).with.offset(-10);
        make.width.equalTo(sv3.mas_width);
    
        
    }];
    
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.mas_equalTo(sv2.mas_right).with.offset(10);
        make.right.mas_equalTo(sv.mas_right).with.offset(-10);
        make.height.equalTo(@150);
        make.width.equalTo(sv2.mas_width);
        
    }];
    
    

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:2.0 animations:^{
        [sv3 mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(sv.mas_centerY);
            make.left.mas_equalTo(sv2.mas_right).with.offset(10);
            make.right.mas_equalTo(sv.mas_right).with.offset(-10);
            make.top.mas_equalTo(sv.mas_top).with.offset(10);
            make.bottom.mas_equalTo(sv.mas_bottom).with.offset(-10);
            make.width.equalTo(sv2.mas_width);
        }];

    } completion:nil];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
