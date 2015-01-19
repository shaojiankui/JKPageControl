//
//  JKPageControl.h
//  JKPageControl
//
//  Created by Jakey on 15/1/19.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    StyleColor,
    StyleImage
}PageControlType ;

typedef void (^TouchedBlock)(NSInteger tag);

@interface JKPageControl : UIControl
{
    TouchedBlock _touchHandler;
}
-(void)setClickHandler:(TouchedBlock)touchHandler;

@property(nonatomic) NSInteger numberOfPages;
@property(nonatomic) NSInteger currentPage;

@property (nonatomic) UIColor *normalColor;
@property (nonatomic) UIColor *selectColor;

@property (nonatomic) UIImage *normalImage;
@property (nonatomic) UIImage *selectImage;


@property (nonatomic) CGFloat itemWidth;
@property (nonatomic) CGFloat itemMargin;

@property (nonatomic) PageControlType type;

@end
