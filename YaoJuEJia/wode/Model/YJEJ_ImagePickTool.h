//
//  YJEJ_ImagePickTool.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJEJ_ImagePickTool : NSObject

+ (BOOL)openImagePicker:(UIImagePickerControllerSourceType)type delegate:(id <UINavigationControllerDelegate, UIImagePickerControllerDelegate>) delegate baseController:(UIViewController *)controller allowEdit:(BOOL)allowEdit;


@end
