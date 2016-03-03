//
//  CreateVC.m
//  PIANKE_beta
//
//  Created by 宫西宁 on 16/3/2.
//  Copyright © 2016年 宫西宁. All rights reserved.
//

#import "CreateVC.h"

@interface CreateVC ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@end

@implementation CreateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.createView];
    
    
    [self.createView.SexBtnMan addTarget:self
                                  action:@selector(changeSexMan)
                        forControlEvents:UIControlEventTouchUpInside];
    
    [self.createView.sexBtnWoman addTarget:self
                                    action:@selector(changeSexWoman)
                          forControlEvents:UIControlEventTouchUpInside];
    
    [self.createView.backBtn addTarget:self
                                action:@selector(backView)
                      forControlEvents:UIControlEventTouchUpInside];
    
    [self.createView.logoImageViewBtn addTarget:self
                                         action:@selector(openActionSheet)
                               forControlEvents:UIControlEventTouchUpInside];
    
}
#pragma mark -
#pragma mark - 自定义方法

-(void)openActionSheet{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"上传头像"
                                                                   message:@"请选择图片来源"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"相册"
                                                    style:UIAlertActionStyleDestructive
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      
                                                      UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                                                      imagePicker.delegate = self;
                                                      imagePicker.allowsEditing = YES;
                                                      [self presentViewController:imagePicker
                                                                         animated:YES
                                                                       completion:nil];
                                                      
                                                      NSLog(@"0");
                                                      
                                                  }];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                       
                                                       NSLog(@"1");
                                                       
                                                   }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消"
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    [alert addAction:album];
    [alert addAction:camera];
    [alert addAction:cancel];
    
    [self presentViewController:alert
                       animated:YES
                     completion:nil];
}

-(void)changeSexMan{
    
    self.createView.SexBtnMan.selected =YES;
    self.createView.sexBtnWoman.selected =NO;
    
}

-(void)changeSexWoman{
    
    self.createView.SexBtnMan.selected =NO;
    self.createView.sexBtnWoman.selected =YES;
    
}

#pragma mark -
#pragma mark - imagePickerController代理方法

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    [self.createView.logoImageViewBtn setImage:image
                                      forState:UIControlStateNormal];
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
    NSString *homePath  = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    NSString *realPath  = [homePath stringByAppendingPathComponent:@"headLogo.png"];
    [UIImageJPEGRepresentation(image, 1.0f) writeToFile:realPath
                                             atomically:YES];
    
       
    
}




#pragma mark -
#pragma mark - 返回界面

-(void)backView{
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
    
}


-(CreateView *)createView{
    
    if (!_createView) {
        
        _createView = [[CreateView alloc] initWithFrame:self.view.bounds];
        _createView.backgroundColor = [UIColor whiteColor];
        
    }
    return _createView;
    
}
@end
