//
//  WZContentView.h
//  WZTanMuDemo
//
//  Created by TuChuan on 2016/11/22.
//  Copyright © 2016年 TuChuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZImage;
@interface WZContentView : UIView

/**
 在该视图上面添加图片

 @param image <#image description#>
 */
- (void)addImage:(WZImage *)image;
@end
