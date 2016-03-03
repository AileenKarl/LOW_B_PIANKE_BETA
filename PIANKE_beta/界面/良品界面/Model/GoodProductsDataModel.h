//
//  GoodProductsDataModel.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoodProductsListModel.h"

@interface GoodProductsDataModel : NSObject

@property (strong, nonatomic) NSArray *list;
@property (assign, nonatomic) NSInteger total;


//数据转模型
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
