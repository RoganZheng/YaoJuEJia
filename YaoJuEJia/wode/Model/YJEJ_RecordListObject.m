//
//  YJEJ_RecordListObject.m
//  YaoJuEJia
//
//  Created by drogan Zheng on 2018/5/15.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#import "YJEJ_RecordListObject.h"

@implementation YJEJ_RecordListObject

- (NSString *)diaodupeizai
{
    if (!_diaodupeizai) {
        _diaodupeizai = @"无";
    }
    return _diaodupeizai;
}

@end
