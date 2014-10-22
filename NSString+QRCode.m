//
//  NSString+QRCode.m
//  JYLibrary
//
//  Created by nero on 14-10-22.
//  Copyright (c) 2014年 姜沂. All rights reserved.
//

#import "NSString+QRCode.h"

@implementation NSString (QRCode)
- (UIImage *)createQRCode
{

    // 1. 实例化一个滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 1.1 设置filter的默认值
    // 因为之前如果使用过滤镜，输入有可能会被保留，因此，在使用滤镜之前，最好设置恢复默认值
    [filter setDefaults];
    
    // 2. 将传入的字符串转换为NSData
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3. 将NSData传递给滤镜(通过KVC的方式，设置inputMessage)
    [filter setValue:data forKey:@"inputMessage"];
    
    // 4. 由filter输出图像
    CIImage *outputImage = filter.outputImage;
    
    // 5. 将CIImage转换为UIImage
    return [UIImage imageWithCIImage:outputImage];


}
@end
