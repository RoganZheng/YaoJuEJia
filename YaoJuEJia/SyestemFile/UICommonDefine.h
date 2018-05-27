//
//  UICommonDefine.h
//  robotmonitoring
//
//  Created by drogan Zheng on 2018/4/13.
//  Copyright © 2018年 ChuangZe. All rights reserved.
//

#ifndef UICommonDefine_h
#define UICommonDefine_h

//自定义颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define NAVIGATIONBARCOLOR COLOR(240, 123, 166, 1)
#define kWhiteColor [UIColor whiteColor]
#define kClearColor  [UIColor clearColor]

//自定义字体
#define TEXTFONTSIZE10 [UIFont systemFontOfSize:10]
#define TEXTFONTSIZE12 [UIFont systemFontOfSize:12]
#define TEXTFONTSIZE13 [UIFont systemFontOfSize:13]
#define TEXTFONTSIZE15 [UIFont systemFontOfSize:15]
#define TEXTFONTSIZE16 [UIFont systemFontOfSize:16]
#define TEXTFONTSIZE17 [UIFont systemFontOfSize:17]
#define TEXTFONTSIZEB18 [UIFont boldSystemFontOfSize:18]
#define TEXTFONTSIZE18 [UIFont systemFontOfSize:18]

//自定义布局
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define kNavigationHeight 64.f
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

//字体大小放大比例，此处可修改
#define SizeScale (IS_IPHONE_6P ? 1.2 : 1)
#define kSuitFont(_font) [UIFont systemFontOfSize:_font * SizeScale]
//不适配机型字体大小
#define kUnSuitFont(_font) [UIFont systemFontOfSize:_font]



#define WIDTH(view) view.frame.size.width
#define HEIGHT(view) view.frame.size.height
#define X(view) view.frame.origin.x
#define Y(view) view.frame.origin.y
#define LEFT(view) view.frame.origin.x
#define TOP(view) view.frame.origin.y
#define BOTTOM(view) (view.frame.origin.y + view.frame.size.height)
#define RIGHT(view) (view.frame.origin.x + view.frame.size.width)

//根据iPhone6取长度
#ifdef IS_BefIPHONE_6
#define MasonryValue(value) value/2.0/1.12
#define MasonrySmaillValue(value) value/1.12
#else
#define MasonryValue(value) value/2.0
#define MasonrySmaillValue(value) value
#endif
//通用X间距
#define paddingWidth MasonryValue(30)
//通用Y间距
#define paddingHeigh MasonryValue(20)

#endif /* UICommonDefine_h */
