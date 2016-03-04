//
//  HeaderViewModel.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/4.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "HeaderViewModel.h"

@implementation HeaderViewModel

-(instancetype) initWithDictionary:(NSDictionary *)dic{
    
    self = [super init];
    
    if (self) {
        
//      title
        
        if (![[dic valueForKeyPath:@"title"] isKindOfClass:[NSNull class]]) {
            
            self.title = [dic valueForKeyPath:@"title"];
        }
        
//      groupInfoTitleLabText
        
        if (![[[dic valueForKeyPath:@"groupInfo"] valueForKeyPath:@"title"] isKindOfClass:[NSNull class]]) {
                
            self.groupInfoTitleLabText = [[dic valueForKeyPath:@"groupInfo"] valueForKeyPath:@"title"];
                
        }
        
//       unameLabText
        
        if (![[[dic valueForKeyPath:@"userinfo"] valueForKeyPath:@"uname"] isKindOfClass:[NSNull class]]) {
         
            self.unameLabText = [[dic valueForKeyPath:@"userinfo"] valueForKeyPath:@"uname"];
            
        }
        
//      addTime_f_LabText
        
        if (![[dic valueForKeyPath:@"addtime_f"] isKindOfClass:[NSNull class]]) {
            
            self.addTime_f_LabText = [dic valueForKeyPath:@"addtime_f"];
        }
        
//
        
        if (![[[dic valueForKeyPath:@"userinfo"] valueForKeyPath:@"icon"] isKindOfClass:[NSNull class]]) {
            
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[[dic valueForKeyPath:@"userinfo"] valueForKeyPath:@"icon"]]];
            self.userInfoIconImage = [UIImage imageWithData:data];
            
        }
        
    }
    return self;
}

@end
