#import "RNOpenCV.h"

#import <opencv2/opencv.hpp>

@implementation RNOpenCV

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(makeGrayscale:(NSString *)imageBase64 showResult:(RCTResponseSenderBlock) showResult)
{
    cv::Mat matrix = [self cvMatFromUIImage:[self UIImagefromBase64:imageBase64]];
    cv::Mat gray = [self convertToGray:matrix];
    UIImage *output = [self UIImageFromCVMat:gray];
    NSString *outputBase64 = [self Base64StringFromUIImage:output];
    showResult(@[[NSString stringWithFormat:@"%s%@","data:image/jpg;base64,",outputBase64]]);
}


//TODO move to core and utils
- (UIImage *)UIImagefromBase64:imageBase64 {
    NSData *data =  [NSData dataWithContentsOfURL:((NSURL *)[[NSURL alloc] initWithString:imageBase64])];
    return [UIImage imageWithData:data];
}

- (NSString *)Base64StringFromUIImage:(UIImage *)image {
    return [UIImageJPEGRepresentation(image, 1.0f) base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
}

- (cv::Mat)convertToGray:(cv::Mat)mat{
    cv::Mat greyMat;
    cv::cvtColor(mat, greyMat, CV_BGR2GRAY);
    return greyMat;
}

// href : http://docs.opencv.org/2.4/doc/tutorials/ios/image_manipulation/image_manipulation.html#opencviosimagemanipulation
- (cv::Mat)cvMatFromUIImage:(UIImage *)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels (color channels + alpha)
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    return cvMat;
}

-(UIImage *)UIImageFromCVMat:(cv::Mat)cvMat
{
    NSData *data = [NSData dataWithBytes:cvMat.data length:cvMat.elemSize()*cvMat.total()];
    CGColorSpaceRef colorSpace;
    
    if (cvMat.elemSize() == 1) {
        colorSpace = CGColorSpaceCreateDeviceGray();
    } else {
        colorSpace = CGColorSpaceCreateDeviceRGB();
    }
    
    CGDataProviderRef provider = CGDataProviderCreateWithCFData((__bridge CFDataRef)data);
    
    // Creating CGImage from cv::Mat
    CGImageRef imageRef = CGImageCreate(cvMat.cols,                                 //width
                                        cvMat.rows,                                 //height
                                        8,                                          //bits per component
                                        8 * cvMat.elemSize(),                       //bits per pixel
                                        cvMat.step[0],                            //bytesPerRow
                                        colorSpace,                                 //colorspace
                                        kCGImageAlphaNone|kCGBitmapByteOrderDefault,// bitmap info
                                        provider,                                   //CGDataProviderRef
                                        NULL,                                       //decode
                                        false,                                      //should interpolate
                                        kCGRenderingIntentDefault                   //intent
                                        );
    
    
    // Getting UIImage from CGImage
    UIImage *finalImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpace);
    
    return finalImage;
}

@end