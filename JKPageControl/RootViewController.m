//
//  RootViewController.m
//  JKPageControl
//
//  Created by Jakey on 15/1/19.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "RootViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    pageControl = [[JKPageControl alloc]initWithFrame:CGRectMake(0, 100, 20, 200)];
    pageControl.numberOfPages  = 10;
    pageControl.currentPage = 0;
    pageControl.itemSize  = CGSizeMake(7, 7);
    pageControl.itemMargin = 5;
    pageControl.selectColor = [UIColor redColor];
    pageControl.normalColor = [UIColor grayColor];
    pageControl.direction = JKPageControlDirectionVertical;
    [pageControl setClickHandler:^(NSInteger tag) {
        NSLog(@"Click%zd",tag);
    }];
    [self.view addSubview:pageControl];
    
   
    self.pg.numberOfPages  = 10;
    self.pg.currentPage = 0;
    self.pg.itemSize  = CGSizeMake(7, 7);
    self.pg.itemMargin = 5;
    self.pg.selectColor = [UIColor redColor];
    self.pg.normalColor = [UIColor grayColor];
    self.pg.direction = JKPageControlDirectionHorizontal;
    [pageControl setClickHandler:^(NSInteger tag) {
        NSLog(@"Click%zd",tag);
    }];

}


- (IBAction)nextTouched:(id)sender {
    pageControl.currentPage ++;
    self.pg.currentPage ++;
}
@end
