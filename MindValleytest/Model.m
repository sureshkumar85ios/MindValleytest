//
//  Model.m
//  MindValleytest
//
//  Created by ADDC on 7/20/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import "Model.h"
#import "NSURLSessionHelper.h"

@implementation Model

NSURLSessionHelper *help;

+ (id)sharedInstance {
    // this prevents duplicated instances and create a shared one
    // ideal when working with databases
    
    static Model *data = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        data = [[self alloc] init];
    });
    
    return data;
}

- (id)init {
    self = [super init];
    
    if (self) {
        // loading the initial data via KVC
        [self loadData];
        
        // do your initialization stuff here
        
    }
    
    return self;
}

- (void)loadData {
    // setting the initial data, observed with NSKeyValueObservingOptionInitial
    
    //instagram loading
    NSString *urlstring = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/media/recent/?access_token=1169819734.ed841fe.cfa77c6390234c759bb3e882a9e9b864"];
    NSLog(@"the urlstring is %@",urlstring);
        help = [NSURLSessionHelper sharedHelper];
        [help fetchDataFromURL:urlstring completion:^(NSData *data) {
    
            NSError* JSerror;
    
              NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSerror];
                if(!JSerror){
                    NSMutableArray *temp_Arr = [responseData valueForKeyPath:@"data.images.standard_resolution.url"];

    
                    [self setValue:temp_Arr forKey:@"dataArray"];

                    NSLog(@"the pin data sources is %@",temp_Arr);
                }
                else{
                    NSString *err = [JSerror localizedDescription];
                    NSLog(@"Encountered error parsing: %@", err);
                }
        }];

}

- (void)setNewData {
    
    //pintrest loading
    NSString *urlstring = [NSString stringWithFormat:@"https://api.pinterest.com/v3/pidgets/boards/highquality/Sports/pins/"];
    NSLog(@"the urlstring is %@",urlstring);

    [help fetchDataFromURL:urlstring completion:^(NSData *data) {
    
            NSError* JSerror;
        NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSerror];

    
        NSMutableArray *temp_Arr = [responseData valueForKeyPath:@"data.pins.images.237x.url"];
        
        [self setValue:temp_Arr forKey:@"dataArray"];
        
        NSLog(@"the array is %@",temp_Arr);
        
        
                if(!JSerror){
    
                }
                else{
                    NSString *err = [JSerror localizedDescription];
                    NSLog(@"Encountered error parsing: %@", err);
                }
        }];
}

@end
