//
//  UIImageView+Async.h
//  MindValleytest
//
//  Created by ADDC on 7/20/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSURLSessionHelper.h"

@interface UIImageView (Async)

- (void)setImageURL:(NSString *)url placeholder:(UIImage *)placeholderImage;


@end
