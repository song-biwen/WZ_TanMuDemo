//
//  WZMainViewController.m
//  WZTanMuDemo
//
//  Created by TuChuan on 2016/11/22.
//  Copyright © 2016年 TuChuan. All rights reserved.
//

#import "WZMainViewController.h"
#import "WZContentView.h"
#import "WZImage.h"

@interface WZMainViewController ()
@property (nonatomic,weak) IBOutlet WZContentView *contentView;
@property (nonatomic, assign) CGFloat originalX;
@end

@implementation WZMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.originalX = self.view.frame.size.width;
}


/**
 给界面添加点击事件，点击一下视图，添加一个弹幕

 @param touches <#touches description#>
 @param event <#event description#>
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击了一下界面");
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"image2.png" ofType:nil];
    WZImage *image = [[WZImage alloc] initWithContentsOfFile:filePath];
    image.originY = arc4random_uniform(self.view.frame.size.height - image.size.height);
    image.originX = self.originalX;
    
    [self.contentView addImage:image];
    self.originalX -= 3;
    if (self.originalX < 0) {
        self.originalX = self.view.frame.size.width;
    }
}
@end
