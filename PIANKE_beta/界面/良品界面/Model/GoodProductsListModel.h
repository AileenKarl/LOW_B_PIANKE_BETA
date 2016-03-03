//
//  GoodProductsListModel.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/3.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodProductsListModel : NSObject

@property (copy, nonatomic) NSString *buyurl;
@property (copy, nonatomic) NSString *contentid;
@property (copy, nonatomic) NSString *coverimg;
@property (copy, nonatomic) NSString *title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
