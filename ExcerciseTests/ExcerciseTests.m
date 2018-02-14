//
//  ExcerciseTests.m
//  ExcerciseTests
//
//  Created by MFS on 2/14/18.
//  Copyright © 2018 WiproTest. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Item.h"

@interface ExcerciseTests : XCTestCase

@end

@implementation ExcerciseTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
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

- (void)testValidWebServiceCall {
    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"];
    XCTestExpectation *expectation = [[XCTestExpectation alloc] initWithDescription:@"Status Code: 200"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:NSOperationQueue.mainQueue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (error) {
            XCTFail(@"Error: %@",error.localizedDescription);
        }
        else if (httpResponse.statusCode == 200) {
            [expectation fulfill];
        }
        else {
            XCTFail(@"Status Code: %ld",httpResponse.statusCode);
        }
    }];
    //[self waitForExpectationsWithTimeout:30 handler:nil];
}

- (void)testParsingNilResponse {
    NSDictionary *response = nil;
    Item *item = [[Item alloc] initWithDictionary:response];
    if (item.title != nil) {
        XCTFail(@"Title should be nil while there is no data available");
    }
    else if (item.details != nil) {
        XCTFail(@"Details should be nil while there is no data available");
    }
}

- (void)testParsingEmptyResponse {
    NSDictionary *response = @{};
    Item *item = [[Item alloc] initWithDictionary:response];
    if (item.title != nil) {
        XCTFail(@"Title should be nil while there is no data available");
    }
    else if (item.details != nil) {
        XCTFail(@"Details should be nil while there is no data available");
    }
}

- (void)testParsingNullResponse {
    NSDictionary *response = @{@"title":NSNull.null,@"rows":NSNull.null};
    Item *item = [[Item alloc] initWithDictionary:response];
    if (item.title != nil) {
        XCTFail(@"Title should be nil while there is Null data available");
    }
    else if (item.details != nil) {
        XCTFail(@"Details should be nil while there is Null data available");
    }
}

- (void)testParsingTitleOnlyResponse {
    NSDictionary *response = @{@"title":@"Title"};
    Item *item = [[Item alloc] initWithDictionary:response];
    if (item.title == nil) {
        XCTFail(@"Title should not be nil while response having title");
    }
    else if (item.details != nil) {
        XCTFail(@"Details should be nil while there is no data available");
    }
}

@end
