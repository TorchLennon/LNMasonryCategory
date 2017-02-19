//
//  NSArray+LNMASAdditions.m
//  Pods
//
//  Created by Ning.liu on 2017/2/19.
//
//

#import "NSArray+LNMASAdditions.h"

@implementation NSArray (LNMASAdditions)
- (void)ln_mas_distributeViewsAlongAxis:(MASAxisType)axisType withLeadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing{
    if (self.count < 2) {
        NSAssert(self.count>1,@"views to distribute need to more than one");
        return;
    }
    SEL superViewSEL = NSSelectorFromString(@"mas_commonSuperviewOfViews");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    UIView *superView = [self performSelector:superViewSEL];
#pragma clang diagnostic pop
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
    NSMutableArray *tempViews = [NSMutableArray array];
    for (NSInteger i = self.count-1; i > 0; i --) {
        UIView *tempView = [[UIView alloc] init];
        [superView addSubview:tempView];
        [mutableArray insertObject:tempView atIndex:i];
        [tempViews addObject:tempView];
    }
    UIView *leadView = [[UIView alloc] init];
    UIView *tailView = [[UIView alloc] init];
    [superView addSubview:leadView];
    [superView addSubview:tailView];
    
    if (MASAxisTypeHorizontal == axisType) {
        [leadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(leadSpacing)).priorityLow();
            make.left.equalTo(@(0));
        }];
        [tailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(0));
            make.width.equalTo(@(tailSpacing)).priorityLow();
        }];
        if (self.count == 2) {
            [@[leadView,tailView] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(tempViews.firstObject);
            }];
        }
        [tempViews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(tempViews.firstObject);
        }];
        [self.firstObject mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leadView.mas_right);
        }];
        [self.lastObject mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(tailView.mas_left);
        }];
        [tempViews enumerateObjectsUsingBlock:^(UIView *tempView, NSUInteger idx, BOOL * _Nonnull stop) {
            [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo([self[idx] mas_right]);
                make.right.equalTo([self[idx+1] mas_left]);
            }];
        }];
    }else{
        [leadView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(leadSpacing)).priorityLow();
            make.top.equalTo(@(0));
        }];
        [tailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(@(0));
            make.height.equalTo(@(tailSpacing)).priorityLow();
        }];
        if (self.count == 2) {
            [@[leadView,tailView] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(tempViews.firstObject);
            }];
        }
        [tempViews mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(tempViews.firstObject);
        }];
        [self.firstObject mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(leadView.mas_bottom);
        }];
        [self.lastObject mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(tailView.mas_top);
        }];
        [tempViews enumerateObjectsUsingBlock:^(UIView *tempView, NSUInteger idx, BOOL * _Nonnull stop) {
            [tempView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo([self[idx] mas_bottom]);
                make.bottom.equalTo([self[idx+1] mas_top]);
            }];
        }];
    }
}
@end
