//
//  Login_View.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login_View : UIView

- (IBAction)rememberBtn:(UIButton *)sender;
- (IBAction)loginBtn:(id)sender;
- (IBAction)registBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *UserText;
@property (weak, nonatomic) IBOutlet UITextField *pwdText;
@property (weak, nonatomic) IBOutlet UIButton *RememberBtn;

@property (nonatomic,weak) id<UIViewCollectEventsDelegate> delegate;
@property (nonatomic,assign) BOOL isRemember;

+(Login_View *)loadView;

@end
