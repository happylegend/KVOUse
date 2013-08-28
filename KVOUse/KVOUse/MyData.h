//
//  MyData.h
//  KVOUse
//
//  Created by 紫冬 on 13-8-28.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyData : NSObject
{
    NSString *_name;
    float _price;
}
@property(nonatomic, copy)NSString *name;
@property(nonatomic, assign)float price;

@end
