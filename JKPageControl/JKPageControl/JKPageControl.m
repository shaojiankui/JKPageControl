//
//  JKPageControl.m
//  JKPageControl
//
//  Created by Jakey on 15/1/19.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "JKPageControl.h"
@implementation JKPageControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buidView];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self buidView];
}

-(void)buidView{
    
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext() ;
    CGContextSaveGState(context) ;
    CGContextSetAllowsAntialiasing(context, TRUE) ;
    CGFloat dotsWidth = self.numberOfPages * self.itemWidth + MAX(0, self.numberOfPages - 1) * self.itemMargin;
    CGFloat x = CGRectGetMidX(self.bounds) - dotsWidth / 2 ;
    CGFloat y = CGRectGetMidY(self.bounds) - self.itemWidth / 2 ;
    
    UIColor *drawOnColor = self.selectColor ? self.selectColor : [UIColor colorWithWhite: 1.0f alpha: 1.0f];
    UIColor *drawOffColor = self.normalColor ? self.normalColor : [UIColor colorWithWhite: 0.7f alpha: 0.5f];
    
    for (int i = 0; i < self.numberOfPages; i++)
    {
        CGRect dotRect;
        
        if (i == self.currentPage)
        {
            if (self.type == StyleColor)
            {
                CGRect dotRect = CGRectMake(x, y, self.itemWidth, self.itemWidth) ;
                
                CGContextSetFillColorWithColor(context, drawOnColor.CGColor);
                CGContextFillRect(context, dotRect);
            }
            else{
                [self.selectImage drawInRect:dotRect];

            }
          
        }
        else
        {
            if (self.type == StyleColor)
            {
                dotRect = CGRectMake(x, y, self.itemWidth, self.itemWidth) ;
                
                CGContextSetFillColorWithColor(context, drawOffColor.CGColor);
                CGContextFillRect(context, dotRect);
                
            }else
            {
                [self.normalImage drawInRect:dotRect];
            }
          
            
        }
        
        x += self.itemWidth + self.itemMargin;
    }
    
    CGContextRestoreGState(context) ;
}

- (void)setCurrentPage:(NSInteger)pageNumber
{
    if (_currentPage == pageNumber)
        return ;
    _currentPage = MIN(MAX(0, pageNumber), _numberOfPages - 1) ;
    
    [self setNeedsDisplay] ;
}

- (void)setNumberOfPages:(NSInteger)numOfPages
{
    _numberOfPages = MAX(0, numOfPages) ;
    
    _currentPage = MIN(MAX(0,_currentPage),_numberOfPages - 1) ;
    
    self.bounds = self.bounds ;
    [self setNeedsDisplay] ;
}
- (void)setSelectColor:(UIColor *)selectColor
{
    _selectColor = selectColor ;
    [self setNeedsDisplay] ;
}

- (void)setNormalColor:(UIColor *)normalColor
{
    
    _normalColor = normalColor ;
    [self setNeedsDisplay] ;
}
-(void)setClickHandler:(TouchedBlock)touchHandler{
    if (touchHandler) {
        _touchHandler = [touchHandler copy];
    }
}

#pragma mark Touches handlers
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *theTouch = [touches anyObject];
    CGPoint point = [theTouch locationInView:self];
    self.currentPage =  point.x/(self.itemMargin/2+self.itemWidth);
    if (_touchHandler) {
        _touchHandler(self.currentPage);
    }
    //[self sendActionsForControlEvents: UIControlEventValueChanged] ;
    
}
@end
