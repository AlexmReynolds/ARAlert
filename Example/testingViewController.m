//
//  testingViewController.m
//  Example
//
//  Created by Alex Reynolds on 1/16/13.
//  Copyright (c) 2013 Alex Reynolds. All rights reserved.
//

#import "testingViewController.h"
#import "Hermes.h"
#import "testingAppDelegate.h"

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
    Hermes *message = [[Hermes alloc] initWithMessage:@"test \n this is a message \n so deal"];
    [message fadeInAndOut:10.0];

}
@end
