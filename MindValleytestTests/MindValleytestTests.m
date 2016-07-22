//
//  MindValleytestTests.m
//  MindValleytestTests
//
//  Created by ADDC on 7/20/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURLSessionHelper.h"

@interface MindValleytestTests : XCTestCase

@end

@implementation MindValleytestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
- (void)testpinterest
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSURLSessionHelper *help = [NSURLSessionHelper sharedHelper];
    
  NSString *urlstring = [NSString stringWithFormat:@"https://api.pinterest.com/v3/pidgets/boards/highquality/Sports/pins/"];
    [help fetchDataFromURL:urlstring completion:^(NSData *data) {
        NSError* error;
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        XCTAssertNil(error, @"dataTaskWithURL error %@", error);
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }
        
        XCTAssert(data, @"data nil");
        
        // do additional tests on the contents of the `data` object here, if you want
        
        // when all done, signal the semaphore
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    long rc = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60.0 * NSEC_PER_SEC));
    XCTAssertEqual(rc, 0, @"network request timed out");
}
- (void)testinstagram
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSURLSessionHelper *help = [NSURLSessionHelper sharedHelper];

    NSString *urlstring = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/self/media/recent/?access_token=1169819734.ed841fe.cfa77c6390234c759bb3e882a9e9b864"];
    [help fetchDataFromURL:urlstring completion:^(NSData *data) {
        NSError* error;
        
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        XCTAssertNil(error, @"dataTaskWithURL error %@", error);
        
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
            XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
        }
        
        XCTAssert(data, @"data nil");
        
        // do additional tests on the contents of the `data` object here, if you want
        
        // when all done, signal the semaphore
        
        dispatch_semaphore_signal(semaphore);
    }];
    
    long rc = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 60.0 * NSEC_PER_SEC));
    XCTAssertEqual(rc, 0, @"network request timed out");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
