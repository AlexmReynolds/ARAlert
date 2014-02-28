//
//  testingViewController.m
//  Example
//
//  Created by Alex Reynolds on 1/16/13.
//  Copyright (c) 2013 Alex Reynolds. All rights reserved.
//

#import "testingViewController.h"
#import "AppDelegate.h"

@interface testingViewController ()

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
                              kARAlertTextKey: @"hello world",
                              kARAlertButtonsKey : @[@{kARAlertButtonTextKey:@"Goodbye"}, @{kARAlertButtonTextKey : @"Hello"}]
                              };
    // Init our Hermes Messenger
    _arAlert = [ARAlert showAlertWithOptions:options completionBlock:^{
        
    }];


}

-(void)testButon:(ARAlert*)hermes
{
    // Use our reference to dismiss
    [_arAlert dismiss];
    
    //Take additional action
    NSLog(@"test %@", hermes);
}
@end
