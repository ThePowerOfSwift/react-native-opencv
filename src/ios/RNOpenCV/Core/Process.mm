//
//  RNProcess.m
//  RNOpenCV
//
//  Created by AnujKosambi on 01/06/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "Process.h"
using namespace cv;

@interface Process()

@end

@implementation Process

Mat processMatrix = Mat();

-(instancetype)initWithMatrix:(Mat)matrix {
    self = [super init];
    processMatrix = matrix;
    return self;
}

-(instancetype)convertColor:(int)convertionFlag {
    cvtColor(processMatrix, processMatrix, convertionFlag);
    return self;
}

-(instancetype)cannyFrom:(int)thresold to:(int)secondThresold {
    Canny(processMatrix, processMatrix, thresold, secondThresold);
    return self;
}
-(instancetype)cannyFrom:(int)thresold to:(int)secondThresold forApertureSize:(int)apertureSize {
    return self;
}
-(instancetype)cannyFrom:(int)thresold to:(int)secondThresold forApertureSize:(int)apertureSize l2gradient:(bool)L2gradient {
    return self;
}

-(instancetype)medianBlur:(int)blurSize {
    medianBlur(processMatrix, processMatrix, blurSize);
    return self;
}

-(Mat)apply {
    return processMatrix;
};

@end
