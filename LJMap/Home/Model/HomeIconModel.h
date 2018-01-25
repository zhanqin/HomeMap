//
//  HomeIconModel.h
//  LJMap
//
//  Created by QQ on 2018/1/25.
//  Copyright © 2018年 zhanqin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeIconModel : NSObject

@property(nonatomic,assign) int locationIndex;
@property(nonatomic,copy) NSString * locationName;
@property(nonatomic,copy) NSString * icon;
@property(nonatomic,assign) BOOL isHaveMessage;
@property(nonatomic,assign) float centerX;
@property(nonatomic,assign) float centerY;

@end
