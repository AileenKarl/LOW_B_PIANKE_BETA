//
//  DetailVC.h
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/4.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailVC : UIViewController

//单纯的赋值方法，并不是构造方法,用这种方法给不暴露的属性赋值
-(void)initWithId:(NSString *)contentId;

@end
