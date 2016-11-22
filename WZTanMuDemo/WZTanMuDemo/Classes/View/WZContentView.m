//
//  WZContentView.m
//  WZTanMuDemo
//
//  Created by TuChuan on 2016/11/22.
//  Copyright © 2016年 TuChuan. All rights reserved.
//

#import "WZContentView.h"
#import "WZImage.h"


@interface WZContentView ()

/**
 定时器
 */
@property (nonatomic,strong) CADisplayLink *link;

/**
 保存显示在屏幕上面的图片
 */
@property (nonatomic, strong) NSMutableArray *originalMutableArr;

/**
 保存不再显示在屏幕上面的图片
 */
@property (nonatomic, strong) NSMutableArray *removeMutableArr;
@end

@implementation WZContentView

- (NSMutableArray *)removeMutableArr {
    if (_removeMutableArr == nil) {
        _removeMutableArr = [[NSMutableArray alloc] init];
    }
    return _removeMutableArr;
}
//懒加载
- (NSMutableArray *)originalMutableArr {
    if (_originalMutableArr == nil) {
        _originalMutableArr = [[NSMutableArray alloc] init];
    }
    return _originalMutableArr;
}

- (void)drawRect:(CGRect)rect {
    for (int i = 0; i < self.originalMutableArr.count; i ++) {
        WZImage *image = self.originalMutableArr[i];
        [image drawAtPoint:CGPointMake(image.originX, image.originY)];
        image.originX -= 3;
        CGFloat imageW = image.size.width;
        if (image.originX + imageW < 0) {
            //保存不在屏幕上面显示的图片
            [self.removeMutableArr addObject:image];
        }
    }
    
    //删除不再屏幕上面显示的图片
    [self.originalMutableArr removeObjectsInArray:self.removeMutableArr];
    [self.removeMutableArr removeAllObjects];
    if (self.originalMutableArr.count == 0) {
        //注销定时器
        [self.link invalidate];
        self.link = nil;
    }
}

/**
 添加定时器
 */
- (void)addTimer {
    if (self.link) {
        return;
    }
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;
}

/**
 在该视图上面添加图片
 
 @param image <#image description#>
 */
- (void)addImage:(WZImage *)image {
    [self.originalMutableArr addObject:image];
    [self addTimer];
}

@end
