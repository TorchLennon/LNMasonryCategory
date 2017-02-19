# LNMasonryCategory

[![CI Status](http://img.shields.io/travis/ning.lennon@gmail.com/LNMasonryCategory.svg?style=flat)](https://travis-ci.org/ning.lennon@gmail.com/LNMasonryCategory)
[![Version](https://img.shields.io/cocoapods/v/LNMasonryCategory.svg?style=flat)](http://cocoapods.org/pods/LNMasonryCategory)
[![License](https://img.shields.io/cocoapods/l/LNMasonryCategory.svg?style=flat)](http://cocoapods.org/pods/LNMasonryCategory)
[![Platform](https://img.shields.io/cocoapods/p/LNMasonryCategory.svg?style=flat)](http://cocoapods.org/pods/LNMasonryCategory)

## MASConstraint+LNMasonryCategory  

基于优先级的约束管理对于复合界面布局来说非常方便，小小的问题是对于判断后使用activate/deactivate略显繁琐（比如在RAC的绑定上）
由此添加`ln_installed`,其实内部也还是调用Masonry的判断  
![Activate](http://ww1.sinaimg.cn/large/742f86cdgy1fcw6g6mk4dg20ab0iyju8)
## NSArray+LNMASAdditions  
Masonry本身提供的多视图等间距排列的方法只能适用于多个视图宽度或者高度相等的情况
```objc
- (void)ln_mas_distributeViewsAlongAxis:(MASAxisType)axisType withLeadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;
```
通过添加辅助视图的方式进行布局 
![Array](http://ww1.sinaimg.cn/large/742f86cdgy1fcw6her9ivj20ku12aq44)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LNMasonryCategory is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LNMasonryCategory"
```

## Author

ning.lennon@gmail.com, lennon@memeboxglobal.com

## License

LNMasonryCategory is available under the MIT license. See the LICENSE file for more info.


