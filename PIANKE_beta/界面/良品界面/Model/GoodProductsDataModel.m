//
//  GoodProductsDataModel.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "GoodProductsDataModel.h"

@implementation GoodProductsDataModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    
    if (self) {
        
        if (![dictionary [@"list"] isKindOfClass:[NSNull class]]) {
//            假如list所对应的数组不为空，则给模型的list属性赋值
//            存放GoodProductsListModel数据模型
            NSMutableArray *listArr = [NSMutableArray array];
            for (NSDictionary *itemDic in dictionary [@"list"]) {
//                拿到list数组中的每一个元素（字典）
//                然后转换成模型
                GoodProductsListModel *listModel = [[GoodProductsListModel alloc] initWithDictionary:itemDic];
                [listArr addObject:listModel];
            }
            self.list = [NSArray arrayWithArray:listArr];
            
        }
        
        if (dictionary [@"total"] !=  0) {
            
            self.total = [dictionary [@"total"] integerValue];
            
        }
    }
    
    return self;
}

@end
