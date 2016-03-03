//
//  GoodProductsRootModel.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "GoodProductsRootModel.h"

@implementation GoodProductsRootModel

-(instancetype) initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    if (self) {
        
        if (![dictionary [@"data"] isKindOfClass:[NSNull class]]) {
            
//            把JSON中的data所对应的数据转换成GoodProductsDataModel数据模型
            self.data = [[GoodProductsDataModel alloc] initWithDictionary:[dictionary objectForKey:@"data"]];
            
        }
        if (dictionary[@"result"] != 0) {
            
            self.result = [dictionary[@"result"] integerValue];
        }
        
    }
    return self;
}

-(void)toDictionary{
    
//    当创建一个模型的时候，要思考有没有必要对模型做归档操作
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder{

    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    return self;
}

@end
