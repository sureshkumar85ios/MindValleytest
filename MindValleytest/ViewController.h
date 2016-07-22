//
//  ViewController.h
//  MindValleytest
//
//  Created by ADDC on 7/20/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RACollectionViewReorderableTripletLayout.h"

@interface ViewController : UIViewController<RACollectionViewDelegateReorderableTripletLayout, RACollectionViewReorderableTripletLayoutDataSource,UIGestureRecognizerDelegate>
@property (strong, nonatomic) NSArray *data;


@end

