//
//  ViewController.h
//  KVOUse
//
//  Created by 紫冬 on 13-8-28.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyData.h"

/*
 KVO原理：
 给一个对象添加一个观察者，该观察者用来监听这个对象的属性的改变，如果当改变该对象的属性的时候，那么该观察者将会自动调用相应的方法。
 步骤：
 第一步：以该对象数据成员字符串为关键字，设置数据成员的值
 第二步：为对象添加观察者，指定观察者监听对象的哪些属性数据成员
 第三步：改变对象的属性值
 第四步：当观察者监听到对象的属性数据发生变化的时候，自动调用这个方法,重写该回调函数，当观察者监听到属性值被修改的时候，调用这个方法
 -(void)observeValueForKeyPath
 最后：移除观察者
 
 
 当我们改变属性值的时候，发生了方法调用，其实还是因为我们重写了setxxx方法的原因，当修改属性的时候，会自动调用setxxx方法，我们再在setxxx方法中
 调用外部方法。所以当我们改变属性值的时候，就好像是自动调用了外部方法一样。
 */

@interface ViewController : UIViewController
{
    IBOutlet UILabel *labelName;
    IBOutlet UILabel *labelPrice;
    IBOutlet UIButton *button;
    
    MyData *_data;
}
@property(nonatomic, retain)MyData *data;

-(IBAction)onClickButton:(id)sender;

@end
