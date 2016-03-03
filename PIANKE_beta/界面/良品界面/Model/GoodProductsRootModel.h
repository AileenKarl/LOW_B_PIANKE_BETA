//
//  GoodProductsRootModel.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodProductsDataModel.h"

@interface GoodProductsRootModel : NSObject<NSCoding>

@property (strong, nonatomic) GoodProductsDataModel *data;
@property (assign, nonatomic) NSInteger result;

//数据转模型方法
-(instancetype) initWithDictionary:(NSDictionary *)dictionary;
//模型数据方法
-(void)toDictionary;

@end
