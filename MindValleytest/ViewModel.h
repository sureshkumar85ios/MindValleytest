//
//  ViewModel.h
//  MindValleytest
//
//  Created by ADDC on 7/20/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "Model.h"

@class UIViewController;

@interface ViewModel : NSObject

+ (id)sharedInstanceWithViewController:(ViewController *)viewController;
@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) Model *model;

@end
