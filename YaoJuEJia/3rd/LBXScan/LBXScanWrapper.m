//
//  LBXScanWrapper.m
//
//
//  Created by lbxia on 15/3/4.
//  Copyright (c) 2015年 lbxia. All rights reserved.
//

#import "LBXScanWrapper.h"
#import "LBXScanNative.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@interface LBXScanWrapper ()
{
}

//ios7之后native封装
@property(nonatomic, strong) LBXScanNative *scanNativeObj;
/**
   @brief  扫码类型
 */
@property(nonatomic, strong) NSArray *arrayBarCodeType;

//是否指定使用ZXing库
@property(nonatomic, assign) BOOL isUseZXingLib;


@end


@implementation LBXScanWrapper


+ (BOOL)isSysIos7Later
{
    // return NO;

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        return YES;
    }
    return NO;
}

+ (BOOL)isSysIos8Later
{
    // return NO;

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        return YES;
    }
    return NO;
}

- (instancetype)initWithPreView:(UIView *)preView ArrayObjectType:(NSArray *)arrayBarCodeType cropRect:(CGRect)cropRect
                        success:(void (^)(NSArray<LBXScanResult *> *array))blockScanResult
{
    if (self = [super init])
    {
        self.isUseZXingLib = NO;

        self.arrayBarCodeType = arrayBarCodeType;


        CGRect frame = preView.frame;
        frame.origin = CGPointZero;

        _scanNativeObj = [[LBXScanNative alloc]initWithPreView:preView
                                                    ObjectType:arrayBarCodeType
                                                      cropRect:cropRect
                                                       success:^(NSArray<LBXScanResult *> *array) {
            if (blockScanResult)
            {
                blockScanResult(array);
            }
        }];
        [_scanNativeObj setNeedCaptureImage:YES];
    }

    return self;
}

/*!
 *  开始扫码
 */
- (void)startScan
{
    [_scanNativeObj startScan];
}

/*!
 *  停止扫码
 */
- (void)stopScan
{
    [_scanNativeObj stopScan];
}

- (void)openFlash:(BOOL)bOpen
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

    if ([device hasTorch] && [device hasFlash])
    {
        [_scanNativeObj setTorch:bOpen];
    }
}

- (void)openOrCloseFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];

    if ([device hasTorch] && [device hasFlash])
    {
        [_scanNativeObj changeTorch];
    }
}

/*!
 *  修改扫码类型
 *
 *  @param objType 扫码类型
 */
- (void)changeScanObjType:(NSArray *)objType
{
    if ([LBXScanWrapper isSysIos7Later] && !_isUseZXingLib)
    {
        [_scanNativeObj changeScanType:objType];
    }
}

#pragma mark- 震动、声音效果

#define SOUNDID  1109  //1012 -iphone   1152 ipad  1109 ipad
+ (void)systemVibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+ (void)systemSound
{
    AudioServicesPlaySystemSound(SOUNDID);
}

#pragma mark -相机、相册权限
+ (BOOL)isGetCameraPermission
{
    BOOL isCameraValid = YES;
    //ios7之前系统默认拥有权限
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];

        if (authStatus == AVAuthorizationStatusDenied)
        {
            isCameraValid = NO;
        }
    }
    return isCameraValid;
}

+ (BOOL)isGetPhotoPermission
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
    {
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];

        if (author == ALAuthorizationStatusDenied)
        {
            return NO;
        }
        return YES;
    }

    PHAuthorizationStatus authorStatus = [PHPhotoLibrary authorizationStatus];
    if (authorStatus == PHAuthorizationStatusDenied)
    {
        return NO;
    }
    return YES;
}

#pragma mark -生成二维码

/*!
 *  生成二维码
 *
 *  @param str  二维码字符串
 *  @param size 二维码图片大小
 *
 *  @return 返回生成的图像
 */
+ (UIImage *)createQRWithString:(NSString *)str size:(CGSize)size
{
    return [LBXScanWrapper createNonInterpolatedUIImageFormCIImage:[LBXScanWrapper createQRForString:str]
                                                          withSize:size.width];
}

/**
   @brief  图像中间加logo图片
   @param srcImg    原图像
   @param LogoImage logo图像
   @param logoSize  logo图像尺寸
   @return 加Logo的图像
 */
+ (UIImage *)addImageLogo:(UIImage *)srcImg centerLogoImage:(UIImage *)LogoImage logoSize:(CGSize)logoSize
{
    UIGraphicsBeginImageContext(srcImg.size);
    [srcImg drawInRect:CGRectMake(0, 0, srcImg.size.width, srcImg.size.height)];

    CGRect rect = CGRectMake(srcImg.size.width / 2 - logoSize.width / 2, srcImg.size.height / 2 - logoSize.height / 2, logoSize.width, logoSize.height);
    [LogoImage drawInRect:rect];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

//下面引用自 https://github.com/yourtion/Demo_CustomQRCode
#pragma mark - InterpolatedUIImage
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));
    // 创建bitmap;
    size_t width           = CGRectGetWidth(extent) * scale;
    size_t height          = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs     = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CGColorSpaceRelease(cs);
    CIContext *context     = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image
                                           fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    UIImage *aImage = [UIImage imageWithCGImage:scaledImage];
    CGImageRelease(scaledImage);
    return aImage;
}

#pragma mark - QRCodeGenerator
+ (CIImage *)createQRForString:(NSString *)qrString
{
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // 创建filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 设置内容和纠错级别
    [qrFilter setValue:stringData
                forKey:@"inputMessage"];
    [qrFilter setValue:@"M"
                forKey:@"inputCorrectionLevel"];
    // 返回CIImage
    return qrFilter.outputImage;
}

#pragma mark - imageToTransparent
void ProviderReleaseData(void *info, const void *data, size_t size)
{
    free((void *)data);
}

+ (UIImage *)imageBlackToTransparent:(UIImage *)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue
{
    const int imageWidth       = image.size.width;
    const int imageHeight      = image.size.height;
    size_t bytesPerRow         = imageWidth * 4;
    uint32_t *rgbImageBuf      = (uint32_t *)malloc(bytesPerRow * imageHeight);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context       = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                       kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    // 遍历像素
    int pixelNum      = imageWidth * imageHeight;
    uint32_t *pCurPtr = rgbImageBuf;
    for (int i = 0; i < pixelNum; i++, pCurPtr++)
    {
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900)    // 将白色变成透明
        {
            // 改成下面的代码，会将图片转成想要的颜色
            uint8_t *ptr = (uint8_t *)pCurPtr;
            ptr[3] = red; //0~255
            ptr[2] = green;
            ptr[1] = blue;
        }
        else
        {
            uint8_t *ptr = (uint8_t *)pCurPtr;
            ptr[0] = 0;
        }
    }
    // 输出图片
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGImageRef imageRef            = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                                   kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                                   NULL, true, kCGRenderingIntentDefault);
    CGDataProviderRelease(dataProvider);
    UIImage *resultUIImage = [UIImage imageWithCGImage:imageRef];
    // 清理空间
    CGImageRelease(imageRef);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return resultUIImage;
}

#pragma mark - 生成二维码，背景色及二维码颜色设置
//引用自:http://www.jianshu.com/p/e8f7a257b612
+ (UIImage *)createQRWithString:(NSString *)text QRSize:(CGSize)size QRColor:(UIColor *)qrColor bkColor:(UIColor *)bkColor
{
    NSData *stringData = [text dataUsingEncoding:NSUTF8StringEncoding];

    //生成
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [qrFilter setValue:stringData
                forKey:@"inputMessage"];
    [qrFilter setValue:@"H"
                forKey:@"inputCorrectionLevel"];


    //上色
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIFalseColor"
                                       keysAndValues:
                             @"inputImage", qrFilter.outputImage,
                             @"inputColor0", [CIColor colorWithCGColor:qrColor.CGColor],
                             @"inputColor1", [CIColor colorWithCGColor:bkColor.CGColor],
                             nil];

    CIImage *qrImage = colorFilter.outputImage;

    //绘制
    CGImageRef cgImage = [[CIContext contextWithOptions:nil] createCGImage:qrImage
                                                                  fromRect:qrImage.extent];
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationNone);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextDrawImage(context, CGContextGetClipBoundingBox(context), cgImage);
    UIImage *codeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    CGImageRelease(cgImage);

    return codeImage;
}

@end
