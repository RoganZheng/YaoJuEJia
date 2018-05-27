//
//  YJEJ_ImagePickTool.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/14.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_ImagePickTool.h"

@implementation YJEJ_ImagePickTool

+ (BOOL)openImagePicker:(UIImagePickerControllerSourceType)type delegate:(id<UINavigationControllerDelegate,UIImagePickerControllerDelegate>)delegate baseController:(UIViewController *)controller allowEdit:(BOOL)allowEdit
{
    if ([UIImagePickerController isSourceTypeAvailable:type]) {
        UIImagePickerController *pickerController= [[UIImagePickerController alloc] init];
        pickerController.view.backgroundColor = [UIColor whiteColor];
        pickerController.delegate = delegate;
        pickerController.sourceType = type;
        pickerController.allowsEditing = allowEdit;
        [controller presentViewController:pickerController animated:YES completion:nil];
        //        [(UINavigationController *)controller pushViewController:pickerController animated:NO];
        return YES;
    }else {
        return NO;
    }
}

@end
