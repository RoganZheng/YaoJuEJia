//
//  URLHeader.h
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/8.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#ifndef URLHeader_h
#define URLHeader_h

#define API_HOST @"http://ffj.chuangze.cn"
//#define API_HOST @"http://robotinterface.chuangze.cn:8000"

#define PATH(_path)             [NSString stringWithFormat:_path, API_HOST]

//用户登录
#define Request_userLogin         PATH(@"%@/WebServices/UsersWebService.asmx/AdminLogin")

//用户注册
#define Request_MobileUserReg        PATH(@"%@/WebServices/UsersWebService.asmx/MobileUserReg")

//根据身份证获取用户详细信息
#define Request_GetUserInfoBysfhm   PATH(@"%@/WebServices/UsersWebService.asmx/GetUserInfoBysfhm")

//根据药具代码，返回药具介绍URL
#define Request_GetContraceptiveInfo    PATH@(@"%@/WebServices/GetInfo.asmx/GetContraceptiveInfo")

//根据经纬度，获取指定半径范围内药店信息
#define Request_GetNearbyPharmacy   PATH@(@"%@/WebServices/GetInfo.asmx/GetNearbyPharmacy")

#endif /* URLHeader_h */
