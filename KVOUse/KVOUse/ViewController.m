//
//  ViewController.m
//  KVOUse
//
//  Created by 紫冬 on 13-8-28.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize data = _data;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    MyData *aData = [[MyData alloc] init];
    self.data = aData;
    
    //第一步：以对象数据成员字符串为关键字，设置数据成员的值
    [self.data setValue:@"改变之前" forKey:@"_name"];
    [self.data setValue:[NSNumber numberWithFloat:10.0] forKey:@"_price"];
    
    //第二步：为对象添加观察者，指定观察者监听对象的哪些属性数据成员
    [self.data addObserver:self forKeyPath:@"_name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    [self.data addObserver:self forKeyPath:@"_price" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    
    labelName.textColor = [UIColor redColor];
    labelName.text = [self.data valueForKey:@"_name"];
    
    labelPrice.textColor = [UIColor redColor];
    labelPrice.text = [NSString stringWithFormat:@"%@", [self.data valueForKey:@"_price"]];
    
    [aData release];
}

-(IBAction)onClickButton:(id)sender
{
    NSLog(@"开始改变属性");
    
    //第三步：改变对象的属性值
    [self.data setValue:@"改变之后" forKey:@"_name"];
    [self.data setValue:[NSNumber numberWithFloat:20.0] forKey:@"_price"];
    
    labelName.textColor = [UIColor greenColor];
    labelName.text = [self.data valueForKey:@"_name"];
    
    labelPrice.textColor = [UIColor greenColor];
    labelPrice.text = [NSString stringWithFormat:@"%@", [self.data valueForKey:@"_price"]];
    
}

//第四步：当观察者监听到对象的属性数据发生变化的时候，自动调用这个方法
//重写回调函数，当观察者监听到属性值被修改的时候，调用这个方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if ([object isEqual:self.data])   //如果发生改变对象是self.data
    {
        if ([keyPath isEqualToString:@"_name"])  //如果发生改变的属性是_name
        {
            NSLog(@"更改了属性_name的值");
        }
        else if ([keyPath isEqualToString:@"_price"])  //如果发生改变的属性是_price
        {
            NSLog(@"更改了属性_price的值");
        }
    }
}

-(void)dealloc
{
    //最后一步：移除观察者
    [self.data removeObserver:self forKeyPath:@"_name"];
    [self.data removeObserver:self forKeyPath:@"_length"];
    self.data = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
