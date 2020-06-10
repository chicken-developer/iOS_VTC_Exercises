//
//  OpenCVWarpper.mm
//  testMultiCode
//
//  Created by Nguyen Manh Quynh on 1/30/20.
//  Copyright © 2020 Admin. All rights reserved.
//
#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCVWarpper.h"

using namespace cv;
using namespace std;

@implementation OpenCVWarpper
+ (NSString *)openCVVersionString {
    return [NSString stringWithFormat:@"OpenCV Version %s",  CV_VERSION];
}
@end
