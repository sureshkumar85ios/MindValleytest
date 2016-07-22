//
//  Model.h
//  MindValleytest
//
//  Created by ADDC on 7/20/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

+ (id)sharedInstance;
- (void)loadData;
- (void)setNewData;

@property(nonatomic,strong)NSArray *pinDatasources;
@property (strong, nonatomic) NSArray *dataArray;

@end
