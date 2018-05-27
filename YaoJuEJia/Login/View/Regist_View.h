//
//  Regist_View.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/9.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@interface Regist_View : BaseView
@property (weak, nonatomic) IBOutlet UITextField *idCardText;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;

@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegate;
+(Regist_View *)loadView;

@end
