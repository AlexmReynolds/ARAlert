//
//  testingViewController.m
//  Example
//
//  Created by Alex Reynolds on 1/16/13.
//  Copyright (c) 2013 Alex Reynolds. All rights reserved.
//

#import "testingViewController.h"
#import "AppDelegate.h"

@interface testingViewController (){
    
    __weak IBOutlet UISegmentedControl *animationOutType;
    __weak IBOutlet UISegmentedControl *animationInType;
    __weak IBOutlet UITextField *titleText;
    __weak IBOutlet UITextField *subTitleText;
}

@end

@implementation testingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testtt:(id)sender {
    
    NSDictionary *options = @{
                              kARAlertTextKey: titleText.text,
                              kARAlertSubtitleTextKey : subTitleText.text,
                              kARAlertButtonsKey : @[
                                @{kARAlertButtonTextKey:@"Goodbye" , kARAlertButtonTypeKey : @(ARAlertButtonTypeAction)},
                                @{kARAlertButtonTextKey:@"Goodbye2" , kARAlertButtonTypeKey : @(ARAlertButtonTypeAction)},
                                @{kARAlertButtonTextKey : @"Hello"}
                                ],
                              kARAlertAnimationInTypeKey : [self getInAnimation],
                              kARAlertAnimationOutTypeKey : [self getOutAnimation]
                              };
    // Init our Hermes Messenger
    _arAlert = [ARAlert showAlertWithOptions:options completionBlock:^{
        
    }];


}

-(NSNumber *)getInAnimation
{
    switch (animationInType.selectedSegmentIndex) {
        case 0:
            return @(ARAlertAnimationTypeNone);
            break;
        case 1:
            return @(ARAlertAnimationTypePop);
            break;
        case 2:
            return @(ARAlertAnimationTypeFade);
            break;
        case 3:
            return @(ARAlertAnimationTypeSpring);
            break;
        default:
            break;
    }
}

-(NSNumber *)getOutAnimation
{
    switch (animationOutType.selectedSegmentIndex) {
        case 0:
            return @(ARAlertAnimationTypeNone);
            break;
            
        case 1:
            return @(ARAlertAnimationTypePop);
            break;
        case 2:
            return @(ARAlertAnimationTypeFade);
            break;
        case 3:
            return @(ARAlertAnimationTypeSpring);
            break;
        default:
            break;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
