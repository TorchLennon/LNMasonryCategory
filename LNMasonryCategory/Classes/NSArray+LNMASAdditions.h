//
//  NSArray+LNMASAdditions.h
//  Pods
//
//  Created by Ning.liu on 2017/2/19.
//
//

#import <Foundation/Foundation.h>
#import "Masonry.h"

@interface NSArray (LNMASAdditions)
/**
 多个视图等间距排列
 
 @param axisType    方向
 @param leadSpacing
 @param tailSpacing
 */
- (void)ln_mas_distributeViewsAlongAxis:(MASAxisType)axisType withLeadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;
@end
