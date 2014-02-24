//
//  Example_Tests.m
//  Example Tests
//
//  Created by Alex Reynolds on 2/19/14.
//  Copyright (c) 2014 Alex Reynolds. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ARAlert.h"

@interface Example_Tests : XCTestCase{
    ARAlert * sut;
}

@end

@implementation Example_Tests

- (void)setUp
{
    sut = [ARAlert showAlertWithMessage:@"test" completionBlock:nil];
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSettingBackgroundDefault
{
    [ARAlert setDefaultOptions:@{kARAlertBackgroundColorKey : [UIColor greenColor]}];
    XCTAssertEqual(sut.backgroundColor, [UIColor greenColor], @"Background color was not set");
}

- (void)testSettingCornerRadiusDefault
{
    [ARAlert setDefaultOptions:@{kARAlertCornerRadiusKey : @(4)}];
    XCTAssertEqual(sut.cornerRadius, 4.0f, @"radius was not set");
}

- (void)testSettingRoundedCornersTrueDefault_ShouldSetHasRoundedCornersToTrue
{
    [ARAlert setDefaultOptions:@{kARAlertRoundedCornersKey : @(YES)}];
    XCTAssertTrue(sut.hasRoundedCorners, @"Rounded corners was not true");
}

- (void)testSettingRoundedCornersFalseDefault_ShouldSetHasRoundedCornerToFalse
{
    [ARAlert setDefaultOptions:@{kARAlertRoundedCornersKey : @(NO)}];
    XCTAssertFalse(sut.hasRoundedCorners, @"Rounded corners was true");
}

- (void)testSettingFontArialDefault_ShouldSetFontToArial
{
    [ARAlert setDefaultOptions:@{kARAlertFontKey : [UIFont fontWithName:@"Arial" size:10.0]}];
    XCTAssertTrue([sut.font.familyName isEqualToString:@"Arial"], @"Font was not arial");
}

- (void)testSettingTextColorRedDefault_ShouldSetTextColorToRed
{
    [ARAlert setDefaultOptions:@{kARAlertTextColorKey : [UIColor redColor]}];
    XCTAssertEqual(sut.textColor, [UIColor redColor], @"Text color was not red");
}

- (void)testSettingTextCenterAlignDefault_ShouldSetTextAlignCenter
{
    [ARAlert setDefaultOptions:@{kARAlertTextAlignmentKey : @(NSTextAlignmentCenter)}];
    XCTAssertEqual(sut.textAlignment, NSTextAlignmentCenter, @"Text was not aligned center");
}

- (void)testSettingTextSubtitleDefault_ShouldSetTextSubTitle
{
    [ARAlert setDefaultOptions:@{kARAlertSubtitleTextKey : @"Foo Bar"}];
    XCTAssertTrue([sut.subtitleText isEqualToString:@"Foo Bar"], @"Text was not set to Foo Bar");
}

- (void)testSettingSubtitleColorRedDefault_ShouldSetSubtitleColorToRed
{
    [ARAlert setDefaultOptions:@{kARAlertSubtitleTextColorKey : [UIColor redColor]}];
    XCTAssertEqual(sut.subtitleTextColor, [UIColor redColor], @"Text color was not red");
}

- (void)testSettingSubtitleFontArialDefault_ShouldSetFontToArial
{
    [ARAlert setDefaultOptions:@{kARAlertSubtitleFontKey : [UIFont fontWithName:@"Arial" size:10.0]}];
    XCTAssertTrue([sut.subtitleFont.familyName isEqualToString:@"Arial"], @"Font was not arial");
}
@end
