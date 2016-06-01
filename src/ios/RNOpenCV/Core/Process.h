//
//  RNProcess.h
//  RNOpenCV
//
//  Created by AnujKosambi on 01/06/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>

@interface Process : NSObject

-(instancetype)initWithMatrix:(cv::Mat)matrix;

-(instancetype)convertColor:(int)convertionFlag;

-(instancetype)cannyFrom:(int)thresold to:(int)secondThresold;
-(instancetype)cannyFrom:(int)thresold to:(int)secondThresold forApertureSize:(int)apertureSize;
-(instancetype)cannyFrom:(int)thresold to:(int)secondThresold forApertureSize:(int)apertureSize l2gradient:(bool)L2gradient;


//TODO make separte blur
-(instancetype)medianBlur:(int)blurSize;

-(cv::Mat)apply;

@end
