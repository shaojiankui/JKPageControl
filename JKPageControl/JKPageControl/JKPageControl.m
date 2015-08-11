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
    CGContextClearRect(context, self.bounds);
    CGContextSaveGState(context) ;
    CGContextSetAllowsAntialiasing(context, TRUE) ;
    
     CGFloat x,y;
      //垂直显示
     if (self.direction == JKPageControlDirectionVertical)
     {
         CGFloat dotsHeight = self.numberOfPages * self.itemSize.height + MAX(0, self.numberOfPages - 1) * self.itemMargin;
         x = CGRectGetMidX(self.bounds) - self.itemSize.width / 2 ;
         y = CGRectGetMidY(self.bounds) - dotsHeight / 2;

     }
     else
     {
         CGFloat dotsWidth = self.numberOfPages * self.itemSize.width + MAX(0, self.numberOfPages - 1) * self.itemMargin;
         x = CGRectGetMidX(self.bounds) - dotsWidth / 2;
         y = CGRectGetMidY(self.bounds) - self.itemSize.width / 2 ;
     }
   
    
    UIColor *drawOnColor = self.selectColor ? self.selectColor : [UIColor colorWithWhite: 1.0f alpha: 1.0f];
    UIColor *drawOffColor = self.normalColor ? self.normalColor : [UIColor colorWithWhite: 0.7f alpha: 0.5f];
    
    for (int i = 0; i < self.numberOfPages; i++)
    {
        CGRect dotRect = CGRectZero;
        
        if (self.style==JKPageControlStyleStrokedCircle || self.style==JKPageControlStyleDefault){
            if (i == self.currentPage)
            {
                CGRect dotRect = CGRectMake(x-1, y-1, self.itemSize.width+2, self.itemSize.height+2) ;
                
                CGContextSetFillColorWithColor(context, drawOnColor.CGColor);
                //            CGContextFillRect(context, dotRect);
                CGContextFillEllipseInRect(context, dotRect);
                //[seletedImage drawInRect:dotRect];
            }
            else
            {
                dotRect = CGRectMake(x, y, self.itemSize.width, self.itemSize.height) ;
                
                CGContextSetFillColorWithColor(context, drawOffColor.CGColor);
                //            CGContextFillRect(context, dotRect);
                CGContextFillEllipseInRect(context, dotRect);
            }
            
        }
        if (self.style==JKPageControlStyleRectangle){
            
            if (i == self.currentPage)
            {
                CGRect dotRect = CGRectMake(x, y, self.itemSize.width, self.itemSize.height) ;
                
                CGContextSetFillColorWithColor(context, drawOnColor.CGColor);
                //            CGContextFillRect(context, dotRect);
                CGContextFillRect(context, dotRect);
                //[seletedImage drawInRect:dotRect];
            }
            else
            {
                dotRect = CGRectMake(x, y, self.itemSize.width, self.itemSize.height) ;
                
                CGContextSetFillColorWithColor(context, drawOffColor.CGColor);
                //            CGContextFillRect(context, dotRect);
                CGContextFillRect(context, dotRect);
            }
            
        }
        
        
        if (self.style==JKPageControlStyleImage){
            
            if (i == self.currentPage)
            {
                CGRect dotRect = CGRectMake(x, y, self.itemSize.width, self.itemSize.height) ;
                
                
                [self.selectImage drawInRect:dotRect];
            }
            else
            {
                dotRect = CGRectMake(x, y, self.itemSize.width, self.itemSize.height) ;
                [self.normalImage drawInRect:dotRect];
                
            }
            
        }
        //垂直显示
        if (self.direction == JKPageControlDirectionVertical) {
            y += self.itemSize.height + self.itemMargin;

        }else{
            x += self.itemSize.width + self.itemMargin;
        }
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
-(void)setSelectImage:(UIImage *)selectImage{
    _selectImage = selectImage;
    [self setNeedsDisplay];

}
-(void)setNormalImage:(UIImage *)normalImage{
    _normalImage = normalImage;
    [self setNeedsDisplay];
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
-(void)setStyle:(JKPageControlStyle)style{
    _style = style;
    [self setNeedsDisplay] ;

}
-(void)setDirection:(JKPageControlDirection)direction{
    _direction = direction;
    [self setNeedsDisplay] ;

}
#pragma mark Touches handlers
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    UITouch *theTouch = [touches anyObject];
//    CGPoint point = [theTouch locationInView:self];
//    self.currentPage =  point.x/(self.itemMargin/2+self.itemWidth);
//    if (_touchHandler) {
//        _touchHandler(self.currentPage);
//    }
//    //[self sendActionsForControlEvents: UIControlEventValueChanged] ;
//    
}
@end
