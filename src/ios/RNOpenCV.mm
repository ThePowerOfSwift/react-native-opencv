#import "RNOpenCV.h"
#import <opencv2/opencv.hpp>

@implementation RNOpenCV

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(test)
{
    NSLog(@"Hello");
    // Your implementation here
}

RCT_EXPORT_METHOD(makeGrayscale:(NSString *)imageBase64 showResult:(RCTResponseSenderBlock) showResult)
{
    
}

@end