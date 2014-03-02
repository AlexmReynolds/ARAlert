//
//  Hermes.h
//  paperwoven
//
//  Created by Alex Reynolds on 9/28/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ARAlertDelegate <NSObject>

-(void)buttonClickedAtIndex:(NSInteger)buttonIndex;

@end

typedef NS_ENUM(NSInteger, ARAlertAnimationType) {
    ARAlertAnimationTypeNone = 1,
    ARAlertAnimationTypePop,
    ARAlertAnimationTypeSpring,
    ARAlertAnimationTypeFade
};

typedef NS_ENUM(NSInteger, ARAlertButtonType) {
    ARAlertButtonTypeDismiss,
    ARAlertButtonTypeAction
};

typedef NS_ENUM(NSInteger, ARAlertButtonWidth) {
    ARAlertButtonWidthFull = 1,
    ARAlertButtonWidthHalf
};
extern NSString *const kARAlertWidthKey;
extern NSString *const kARAlertWidthTypeKey;
extern NSString *const kARAlertRoundedCornersKey;
extern NSString *const kARAlertCornerRadiusKey;
extern NSString *const kARAlertEdgeInsetsKey;


extern NSString *const kARAlertAnimationInTypeKey;
extern NSString *const kARAlertAnimationOutTypeKey;

extern NSString *const kARAlertAnimationInTimeIntervalKey;
extern NSString *const kARAlertTimeIntervalKey;
extern NSString *const kARAlertAnimationOutTimeIntervalKey;

extern NSString *const kARAlertAnimationSpringDampingKey;
extern NSString *const kARAlertAnimationSpringInitialVelocityKey;
extern NSString *const kARAlertAnimationGravityMagnitudeKey;

extern NSString *const kARAlertTextKey;
extern NSString *const kARAlertFontKey;
extern NSString *const kARAlertTextColorKey;
extern NSString *const kARAlertTextAlignmentKey;
extern NSString *const kARAlertTextShadowColorKey;
extern NSString *const kARAlertTextShadowOffsetKey;
extern NSString *const kARAlertTextMaxNumberOfLinesKey;

extern NSString *const kARAlertSubtitleTextKey;
extern NSString *const kARAlertSubtitleFontKey;
extern NSString *const kARAlertSubtitleTextColorKey;
extern NSString *const kARAlertSubtitleTextAlignmentKey;
extern NSString *const kARAlertSubtitleTextShadowColorKey;
extern NSString *const kARAlertSubtitleTextShadowOffsetKey;
extern NSString *const kARAlertSubtitleTextMaxNumberOfLinesKey;

extern NSString *const kARAlertBackgroundColorKey;

extern NSString *const kARAlertButtonsKey;
extern NSString *const kARAlertButtonTypeKey;
extern NSString *const kARAlertButtonTextKey;
extern NSString *const kARAlertButtonFontKey;
extern NSString *const kARAlertButtonTextColorKey;
extern NSString *const kARAlertButtonBackgroundColorKey;

@interface ARAlert : NSObject


//Top Level Properties
@property (nonatomic, strong) UIWindow *alertWindow;
@property (nonatomic, strong) NSDictionary *options;
@property (nonatomic, copy) void(^completion)(void);
@property (nonatomic, weak) id <ARAlertDelegate> delegate;

//Views and Layout Data

@property (nonatomic, readonly) UIView *alertView;


//Read Only Convinence Properties Providing Default Values or Values from Options
@property (nonatomic, readonly) ARAlertAnimationType inAnimationType;
@property (nonatomic, readonly) ARAlertAnimationType outAnimationType;

@property (nonatomic, readonly) BOOL hasRoundedCorners;
@property (nonatomic, readonly) CGFloat cornerRadius;
@property (nonatomic, readonly) NSString *edgeInsetsString;

@property (nonatomic, readonly) NSTimeInterval animateInTimeInterval;
@property (nonatomic, readonly) NSTimeInterval timeInterval;
@property (nonatomic, readonly) NSTimeInterval animateOutTimeInterval;

@property (nonatomic, readonly) CGFloat animationSpringDamping;
@property (nonatomic, readonly) CGFloat animationSpringInitialVelocity;
@property (nonatomic, readonly) CGFloat animationGravityMagnitude;

@property (nonatomic, readonly) NSString *text;
@property (nonatomic, readonly) UIFont *font;
@property (nonatomic, readonly) UIColor *textColor;
@property (nonatomic, readonly) NSTextAlignment textAlignment;
@property (nonatomic, readonly) UIColor *textShadowColor;
@property (nonatomic, readonly) CGSize textShadowOffset;
@property (nonatomic, readonly) NSInteger textMaxNumberOfLines;

@property (nonatomic, readonly) NSString *subtitleText;
@property (nonatomic, readonly) UIFont *subtitleFont;
@property (nonatomic, readonly) UIColor *subtitleTextColor;
@property (nonatomic, readonly) NSTextAlignment subtitleTextAlignment;
@property (nonatomic, readonly) UIColor *subtitleTextShadowColor;
@property (nonatomic, readonly) CGSize subtitleTextShadowOffset;
@property (nonatomic, readonly) NSInteger subtitleTextMaxNumberOfLines;

@property (nonatomic, readonly) UIColor *backgroundColor;
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) UIColor *buttonBackgroundColor;
@property (nonatomic, readonly) UIColor *buttonTextColor;
@property (nonatomic, readonly) UIFont *buttonFont;


+ (void)setDefaultOptions:(NSDictionary*)defaultOptions;
+ (instancetype)showAlertWithMessage:(NSString*)message completionBlock:(void (^)(void))completion;
+ (instancetype)showAlertWithOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion;
- (void) dismiss;
@end
