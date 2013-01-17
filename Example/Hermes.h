//
//  Hermes.h
//  paperwoven
//
//  Created by Alex Reynolds on 9/28/12.
//  Copyright (c) 2012 OutCoursing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "testingAppDelegate.h"
#import <QuartzCore/QuartzCore.h>


#ifndef HERMES_CUSTOM_BUTTON_CLASS
    #define HERMES_CUSTOM_BUTTON_CLASS = 0
#endif

/*
 *  System Versioning Preprocessor Macros
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


@class Hermes;

typedef enum{
    HermesButtonLeft = 1,
    HermesButtonRight,
    HermesButtonTop,
    HermesButtonBottom
}HermesButtonPlaces;

typedef enum{
    HermesRedButton = 1,
    HermesBlueButton,
    HermesBlackButton
}HermesButtonColor;

@interface Hermes : UIView{
    @private
    int _marginLeft;
    int _marginRight;
    int _marginTop;
    int _halfBtnWidth;
    int _fullBtnWidth;
    int _hermesWidth;
    HermesButtonPlaces btnPosition;
    UIView *_alertBox;
    UIFont *_hermesFont;
    int _numberOfButtonRows;
    NSString *_message;
    UIButton *_hermesButton;
    HermesButtonColor _hermesButtonColor;
}

-(id) initWithMessage:(NSString *)message;
-(void) setHermesWidthPercent:(float)widthPercent;
- (void) addActionButton:(NSString*)title position:(HermesButtonPlaces)position action:(SEL)buttonAction delegate:(id)delegate;
- (void) addDismissButton:(NSString*)title position:(HermesButtonPlaces)position;
- (void) dismissModal;
- (void) show;
- (void) fadeInAndOut:(float)delay;
@end
