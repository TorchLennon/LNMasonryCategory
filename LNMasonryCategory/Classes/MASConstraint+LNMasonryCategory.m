//
//  MASConstraint+LNMasonryCategory.m
//  Pods
//
//  Created by Ning.liu on 2017/2/19.
//
//

#import "MASConstraint+LNMasonryCategory.h"
#import <objc/runtime.h>

@implementation MASConstraint (LNMasonryCategory)
- (void)setLn_installed:(BOOL)ln_installed{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:ln_installed?@selector(activate):@selector(deactivate)];
#pragma clang diagnostic pop
}
- (BOOL)ln_installed{
    SEL installedConstraint = NSSelectorFromString(@"hasBeenInstalled");
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    BOOL isInstalled = [self performSelector:installedConstraint];
#pragma clang diagnostic pop

    return isInstalled;

}
@end
