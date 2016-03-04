//
//  GoodProductsListModel.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "GoodProductsListModel.h"

@implementation GoodProductsListModel

-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super init];
    
    if (self) {
        
        if (! [dictionary [@"buyurl"] isKindOfClass:[NSNull class]]) {
            
            self.buyurl = dictionary [@"buyurl"];
        }
        
        if (! [dictionary [@"contentid"] isKindOfClass:[NSNull class]]) {
            
            
            self.contentid = dictionary [@"contentid"];
        }
        
        if (! [dictionary [@"coverimg"] isKindOfClass:[NSNull class]]) {
            
            self.coverimg = dictionary [@"coverimg"];
        }
        if (! [dictionary [@"title"] isKindOfClass:[NSNull class]]) {
            
            self.title = dictionary [@"title"];
        }
    }
    
    return self;
}
@end
