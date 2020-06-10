//
//  OpenCVWrapper.m
//  usingOpenCV
//
//  Created by Nguyen Manh Quynh on 1/30/20.
//  Copyright © 2020 Admin. All rights reserved.
//


#ifdef __cplusplus
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import <opencv2/videoio/cap_ios.h>
#import "OpenCVWrapper.h"

#pragma clang pop
#endif

using namespace cv;
using namespace std;

@implementation OpenCVWarpper
+ (NSString *)openCVVersionString {
    return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
}


+ void resizeImage{
    
}
@end
