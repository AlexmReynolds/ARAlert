//
//  testingViewController.m
//  Example
//
//  Created by Alex Reynolds on 1/16/13.
//  Copyright (c) 2013 Alex Reynolds. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@interface RootViewController (){
    
    __weak IBOutlet UISegmentedControl *animationOutType;
    __weak IBOutlet UISegmentedControl *animationInType;
    __weak IBOutlet UITextField *titleText;
    __weak IBOutlet UITextField *subTitleText;
    __weak IBOutlet UISwitch *roundedCorners;
    __weak IBOutlet UISlider *animationTime;
    __weak IBOutlet UILabel *durationLabel;
}

@end

@implementation RootViewController

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
                              kARAlertAnimationOutTypeKey : [self getOutAnimation],
                              kARAlertRoundedCornersKey : @(roundedCorners.on),
                              kARAlertAnimationInTimeIntervalKey : @(animationTime.value),
                              kARAlertAnimationOutTimeIntervalKey : @(animationTime.value)
                              };
    // Init our Hermes Messenger
    _arAlert = [ARAlert showAlertWithOptions:options completionBlock:^{
        
    }];
    _arAlert.delegate = self;


}
-(void)buttonClickedAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button clicked in modal at index %i", buttonIndex);
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
- (IBAction)durationChanged:(UISlider *)slider {
    durationLabel.text = [NSString stringWithFormat:@"%.2f", slider.value];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
@end
