//
//  UIButton+FYLagerTouchClick.h
//  TZCarShare
//
//  Created by 冯宇的Mac mini on 2019/1/21.
//  Copyright © 2019 冯宇的Mac mini. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FYLagerTouchClick)

/**
 将按钮响应区域扩大

 @param top 向上延伸 top 距离
 @param right <#right description#>
 @param bottom <#bottom description#>
 @param left <#left description#>
 */
- (void)setFyLargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

- (void)setFylargeEdge:(CGFloat) size;

@end

NS_ASSUME_NONNULL_END
