//
//  UIButton+FYLagerTouchClick.m
//  TZCarShare
//
//  Created by 冯宇的Mac mini on 2019/1/21.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//

#import "UIButton+FYLagerTouchClick.h"
#import <objc/runtime.h>
@implementation UIButton (FYLagerTouchClick)
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;
- (void)setFylargeEdge:(CGFloat) size
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:size], OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (void) setFyLargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (CGRect) fyLargedRect
{
    NSNumber* topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber* rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber* bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber* leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge)
        {
            return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,self.bounds.origin.y - topEdge.floatValue,self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
        }
    else
        {
            return self.bounds;
        }
}
- (UIView*) hitTest:(CGPoint) point withEvent:(UIEvent*) event
{
    CGRect rect = [self fyLargedRect];
    if (CGRectEqualToRect(rect, self.bounds))
        {
            return [super hitTest:point withEvent:event];
        }
   
    return CGRectContainsPoint(rect, point) ? self : nil;
}


@end
