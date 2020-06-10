//
//  OpenCVWrapper.h
//  usingOpenCV
//
//  Created by Nguyen Manh Quynh on 1/30/20.
//  Copyright © 2020 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWarpper : NSObject
+ (NSString *)openCVVersionString;
+ (NSNumber *)returnAnyNumber;
+ void resizeImage;
@end

NS_ASSUME_NONNULL_END
