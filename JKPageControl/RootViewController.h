//
//  RootViewController.h
//  JKPageControl
//
//  Created by Jakey on 15/1/19.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKPageControl.h"

@interface RootViewController : UIViewController
{
    JKPageControl *pageControl;
}
@property (weak, nonatomic) IBOutlet JKPageControl *pg;

- (IBAction)nextTouched:(id)sender;
@end
