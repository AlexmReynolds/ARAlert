//
//  testingViewController.m
//  Example
//
//  Created by Alex Reynolds on 1/16/13.
//  Copyright (c) 2013 Alex Reynolds. All rights reserved.
//

#import "testingViewController.h"
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
    // Init our Hermes Messenger
    _hermesView = [[Hermes alloc] initWithMessage:@"test \n this is a message \n so deal"];

    // Add an action button
    [_hermesView addActionButton:@"test" position:HermesButtonFull action:@selector(testButon:) delegate:self];
    // Add a dismiss button
    [_hermesView addDismissButton:@"close" position:HermesButtonFull];
    // Show the message and store a reference to Hermes
    [_hermesView show];

}

-(void)testButon:(Hermes*)hermes
{
    // Use our reference to dismiss
    [_hermesView dismissModal];
    
    //Take additional action
    NSLog(@"test %@", hermes);
}
@end
