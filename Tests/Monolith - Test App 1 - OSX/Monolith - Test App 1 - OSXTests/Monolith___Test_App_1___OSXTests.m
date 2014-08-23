//
//  Monolith___Test_App_1___OSXTests.m
//  Monolith - Test App 1 - OSXTests
//
//  Created by Hoon H. on 2014/08/23.
//  Copyright (c) 2014 Eonil. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>

@interface Monolith___Test_App_1___OSXTests : XCTestCase

@end

@implementation Monolith___Test_App_1___OSXTests

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
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
