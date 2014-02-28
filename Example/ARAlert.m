//
//  Hermes.m
//  paperwoven
//
//  Created by Alex Reynolds on 9/28/12.
//  Copyright (c) 2012 OutCoursing. All rights reserved.
//

#import "ARAlert.h"
#import <QuartzCore/QuartzCore.h>


@interface ARAlertView : UIView
@property (nonatomic, strong) ARAlert *alert;
@end

#pragma mark - Option Constant Definitions

NSString *const kARAlertWidthKey                            = @"kARAlertWidthKey";
NSString *const kARAlertWidthTypeKey                        = @"kARAlertWidthTypeKey";
NSString *const kARAlertRoundedCornersKey                   = @"kARAlertRoundedCornersKey";
NSString *const kARAlertCornerRadiusKey                     = @"kARAlertCornerRadiusKey";
NSString *const kARAlertEdgeInsetsKey                       = @"kARAlertEdgeInsetsKey";

NSString *const kARAlertAnimationInTypeKey                  = @"kARAlertAnimationInTypeKey";
NSString *const kARAlertAnimationOutTypeKey                 = @"kARAlertAnimationOutTypeKey";

NSString *const kARAlertAnimationInTimeIntervalKey          = @"kARAlertAnimateInTimeInterval";
NSString *const kARAlertTimeIntervalKey                     = @"kARAlertTimeIntervalKey";
NSString *const kARAlertAnimationOutTimeIntervalKey         = @"kARAlertAnimateOutTimeInterval";

NSString *const kARAlertAnimationSpringDampingKey           = @"kARAlertAnimationSpringDampingKey";
NSString *const kARAlertAnimationSpringInitialVelocityKey   = @"kARAlertAnimateSpringVelocityKey";
NSString *const kARAlertAnimationGravityMagnitudeKey        = @"kARAlertAnimationGravityMagnitudeKey";

NSString *const kARAlertTextKey                             = @"kARAlertTextKey";
NSString *const kARAlertFontKey                             = @"kARAlertFontKey";
NSString *const kARAlertTextColorKey                        = @"kARAlertTextColorKey";
NSString *const kARAlertTextAlignmentKey                    = @"kARAlertTextAlignmentKey";
NSString *const kARAlertTextShadowColorKey                  = @"kARAlertTextShadowColorKey";
NSString *const kARAlertTextShadowOffsetKey                 = @"kARAlertTextShadowOffsetKey";
NSString *const kARAlertTextMaxNumberOfLinesKey             = @"kARAlertTextMaxNumberOfLinesKey";

NSString *const kARAlertSubtitleTextKey                     = @"kARAlertSubtitleTextKey";
NSString *const kARAlertSubtitleFontKey                     = @"kARAlertSubtitleFontKey";
NSString *const kARAlertSubtitleTextColorKey                = @"kARAlertSubtitleTextColorKey";
NSString *const kARAlertSubtitleTextAlignmentKey            = @"kARAlertSubtitleTextAlignmentKey";
NSString *const kARAlertSubtitleTextShadowColorKey          = @"kARAlertSubtitleTextShadowColorKey";
NSString *const kARAlertSubtitleTextShadowOffsetKey         = @"kARAlertSubtitleTextShadowOffsetKey";
NSString *const kARAlertSubtitleTextMaxNumberOfLinesKey     = @"kARAlertSubtitleTextMaxNumberOfLinesKey";

NSString *const kARAlertBackgroundColorKey                  = @"kARAlertBackgroundColorKey";

NSString *const kARAlertButtonsKey                          = @"kARAlertButtonsKey";
NSString *const kARAlertButtonTypeKey                       = @"kARAlertButtonTypeKey";
NSString *const kARAlertButtonTextKey                       = @"kARAlertButtonTextKey";
NSString *const kARAlertButtonFontKey                       = @"kARAlertButtonFontKey";
NSString *const kARAlertButtonTextColorKey                  = @"kARAlertButtonTextColorKey";
NSString *const kARAlertButtonBackgroundColorKey            = @"kARAlertButtonBackgroundColorKey";

#pragma mark - Option Defaults


static ARAlertAnimationType         kARAnimationTypeDefaultIn               = ARAlertAnimationTypeNone;
static ARAlertAnimationType         kARAnimationTypeDefaultOut              = ARAlertAnimationTypeNone;

static ARAlertButtonWidth           ARAlertButtonWidthFullTypeDefault       = ARAlertButtonWidthFull;
static NSString *                   kAREdgeInsetsDefault                   = @"{10,10,10,10}";

static bool                         kARRoundedCornersDefault                = YES;
static CGFloat                      kARRoundedCornerRadiusDefault           = 4.0f;
static NSTimeInterval               kARAnimateInTimeIntervalDefault         = 0.4;
static NSTimeInterval               kARTimeIntervalDefault                  = 2.0f;
static NSTimeInterval               kARAnimateOutTimeIntervalDefault        = 0.4;

static CGFloat                      kARSpringDampingDefault                 = 0.6;
static CGFloat                  	kARSpringInitialVelocityDefault         = 1.0;

static CGFloat                      kARAlertWidthDefault                    = 300.0;

static NSString *                   kARTextDefault                          = @"";
static UIFont   *                   kARFontDefault                          = nil;
static UIColor  *               	kARTextColorDefault                     = nil;
static NSTextAlignment          	kARTextAlignmentDefault                 = NSTextAlignmentCenter;
static UIColor  *               	kARTextShadowColorDefault               = nil;
static CGSize                   	kARTextShadowOffsetDefault;
static NSInteger                    kARTextMaxNumberOfLinesDefault          = 0;

static NSString *                   kARSubtitleTextDefault                          = nil;
static UIFont   *                   kARSubtitleFontDefault                          = nil;
static UIColor  *               	kARSubtitleTextColorDefault                     = nil;
static NSTextAlignment          	kARSubtitleTextAlignmentDefault                 = NSTextAlignmentCenter;
static UIColor  *               	kARSubtitleTextShadowColorDefault               = nil;
static CGSize                   	kARSubtitleTextShadowOffsetDefault;
static NSInteger                    kARSubtitleTextMaxNumberOfLinesDefault          = 0;

static UIColor  *                   kARBackgroundColorDefault               = nil;
static UIImage  *                   kARImageDefault                         = nil;

static UIFont   *                   kARButtonFontDefault                          = nil;
static UIColor  *               	kARButtonTextColorDefault                     = nil;
static UIColor  *                   kARButtonBackgroundColorDefault         = nil;
static NSArray  *                   kARButtonsDefault                       = nil;




static CGFloat CRGetScreenWidth() {
    if (UIDeviceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        return [UIScreen mainScreen].bounds.size.width;
    }
    return [UIScreen mainScreen].bounds.size.height;
}



@implementation ARAlert
+ (void)initialize {
    if (self == [ARAlert class]) {
        kARFontDefault = [UIFont systemFontOfSize:16];
        kARTextColorDefault = [UIColor whiteColor];
        kARBackgroundColorDefault = [UIColor darkGrayColor];
        kARTextShadowOffsetDefault = CGSizeZero;
        
        kARSubtitleFontDefault = [UIFont systemFontOfSize:12];
        kARSubtitleTextColorDefault = [UIColor whiteColor];
        kARSubtitleTextShadowOffsetDefault = CGSizeZero;
        
        kARButtonsDefault = @[
  @{kARAlertButtonTextKey:@"confirm", kARAlertButtonTypeKey :@(ARAlertButtonTypeAction),kARAlertWidthTypeKey:@(ARAlertButtonWidthHalf)},
  @{kARAlertButtonTextKey: @"cancel", kARAlertButtonTypeKey:@(ARAlertButtonTypeDismiss), kARAlertWidthTypeKey:@(ARAlertButtonWidthHalf)}
  ];
        
        kARButtonFontDefault = [UIFont systemFontOfSize:16];
        kARButtonTextColorDefault = [UIColor whiteColor];
        kARButtonBackgroundColorDefault = [UIColor lightGrayColor];
    }
}
- (instancetype)init {
    self = [super init];
    if (self) {
        UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        alertWindow.backgroundColor = [UIColor clearColor];
        alertWindow.userInteractionEnabled = YES;
        alertWindow.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        alertWindow.windowLevel = UIWindowLevelStatusBar;
        alertWindow.rootViewController = [UIViewController new];
        alertWindow.rootViewController.view.clipsToBounds = YES;
        self.alertWindow = alertWindow;
        

    }
    return self;
}

+ (instancetype)showAlertWithMessage:(NSString*)message completionBlock:(void (^)(void))completion{
    ARAlert *alert = [[self alloc] init];
    alert.options = @{kARAlertTextKey : message};
    alert.completion = completion;
    [alert displayAlert:alert];
    return alert;
    
}
+ (instancetype)showAlertWithOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion{
    ARAlert *alert = [[self alloc] init];
    alert.options = options;
    alert.completion = completion;
    [alert displayAlert:alert];
    return alert;
}


+ (void)setDefaultOptions:(NSDictionary*)defaultOptions {
    
    if (defaultOptions[kARAlertAnimationInTypeKey])
        kARAnimationTypeDefaultIn = [defaultOptions[kARAlertAnimationInTypeKey] integerValue];
    
    if (defaultOptions[kARAlertRoundedCornersKey])
        kARRoundedCornersDefault = [defaultOptions[kARAlertRoundedCornersKey] boolValue];
    
    if (defaultOptions[kARAlertEdgeInsetsKey])
        kAREdgeInsetsDefault = defaultOptions[kARAlertEdgeInsetsKey];
    
    if (defaultOptions[kARAlertAnimationOutTypeKey])
        kARAnimationTypeDefaultOut = [defaultOptions[kARAlertAnimationOutTypeKey] integerValue];
    
    if (defaultOptions[kARAlertAnimationInTimeIntervalKey])         kARAnimateInTimeIntervalDefault         = [defaultOptions[kARAlertAnimationInTimeIntervalKey] doubleValue];
    if (defaultOptions[kARAlertTimeIntervalKey])                    kARTimeIntervalDefault                  = [defaultOptions[kARAlertTimeIntervalKey] doubleValue];
    if (defaultOptions[kARAlertAnimationOutTimeIntervalKey])        kARAnimateOutTimeIntervalDefault        = [defaultOptions[kARAlertAnimationOutTimeIntervalKey] doubleValue];
    
    if (defaultOptions[kARAlertAnimationSpringDampingKey])
        kARSpringDampingDefault = [defaultOptions[kARAlertAnimationSpringDampingKey] floatValue];
    
    if (defaultOptions[kARAlertAnimationSpringInitialVelocityKey])
        kARSpringInitialVelocityDefault = [defaultOptions[kARAlertAnimationSpringInitialVelocityKey] floatValue];
    
    if (defaultOptions[kARAlertWidthKey])
        kARAlertWidthDefault = [defaultOptions[kARAlertWidthKey] floatValue];
    

    
    //Text
    
    if (defaultOptions[kARAlertTextKey])
        kARTextDefault = defaultOptions[kARAlertTextKey];
    
    if (defaultOptions[kARAlertFontKey])
        kARFontDefault = defaultOptions[kARAlertFontKey];
    
    if (defaultOptions[kARAlertTextColorKey])                       kARTextColorDefault                     = defaultOptions[kARAlertTextColorKey];
    
    if (defaultOptions[kARAlertTextAlignmentKey])
        kARTextAlignmentDefault = [defaultOptions[kARAlertTextAlignmentKey] integerValue];
    
    if (defaultOptions[kARAlertTextShadowColorKey])                 kARTextShadowColorDefault               = defaultOptions[kARAlertTextShadowColorKey];
    if (defaultOptions[kARAlertTextShadowOffsetKey])                kARTextShadowOffsetDefault              = [defaultOptions[kARAlertTextShadowOffsetKey] CGSizeValue];
    if (defaultOptions[kARAlertTextMaxNumberOfLinesKey])            kARTextMaxNumberOfLinesDefault          = [defaultOptions[kARAlertTextMaxNumberOfLinesKey] integerValue];
    
    if (defaultOptions[kARAlertSubtitleTextKey])                            kARSubtitleTextDefault                          = defaultOptions[kARAlertSubtitleTextKey];
    if (defaultOptions[kARAlertSubtitleFontKey])                            kARSubtitleFontDefault                          = defaultOptions[kARAlertSubtitleFontKey];
    if (defaultOptions[kARAlertSubtitleTextColorKey])                       kARSubtitleTextColorDefault                     = defaultOptions[kARAlertSubtitleTextColorKey];
    if (defaultOptions[kARAlertSubtitleTextAlignmentKey])                   kARSubtitleTextAlignmentDefault                 = [defaultOptions[kARAlertSubtitleTextAlignmentKey] integerValue];
    if (defaultOptions[kARAlertSubtitleTextShadowColorKey])                 kARSubtitleTextShadowColorDefault               = defaultOptions[kARAlertSubtitleTextShadowColorKey];
    if (defaultOptions[kARAlertSubtitleTextShadowOffsetKey])                kARSubtitleTextShadowOffsetDefault              = [defaultOptions[kARAlertSubtitleTextShadowOffsetKey] CGSizeValue];
    if (defaultOptions[kARAlertSubtitleTextMaxNumberOfLinesKey])            kARSubtitleTextMaxNumberOfLinesDefault          = [defaultOptions[kARAlertSubtitleTextMaxNumberOfLinesKey] integerValue];
    
    if (defaultOptions[kARAlertBackgroundColorKey])
        kARBackgroundColorDefault = defaultOptions[kARAlertBackgroundColorKey];
    
    //Button Options
    if (defaultOptions[kARAlertButtonTextColorKey])
        kARButtonTextColorDefault = defaultOptions[kARAlertButtonTextColorKey];
    if (defaultOptions[kARAlertButtonFontKey])
        kARButtonFontDefault = defaultOptions[kARAlertButtonFontKey];
    if (defaultOptions[kARAlertButtonBackgroundColorKey])
        kARButtonBackgroundColorDefault = defaultOptions[kARAlertButtonBackgroundColorKey];

}

#pragma mark - Alert View Helpers

- (UIView*)alertView {
    CGSize size = CGSizeMake(self.alertWidth, 300); //[self getAlertSize];
    
    ARAlertView *alertView = [[ARAlertView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    alertView.alert = self;
    return alertView;
}




#pragma mark - Overrides
- (CGFloat)alertWidth {
    return _options[kARAlertWidthKey] ?
    [_options[kARAlertWidthKey] floatValue] :
    kARAlertWidthDefault;
}
-(NSString *)edgeInsetsString{
    return _options[kARAlertEdgeInsetsKey] ?: kAREdgeInsetsDefault;
}
- (NSString*)backgroundColor {
    return _options[kARAlertBackgroundColorKey] ?: kARBackgroundColorDefault;
}

- (NSString*)text {
    return _options[kARAlertTextKey] ?: kARTextDefault;
}

- (UIFont*)font {
    return _options[kARAlertFontKey] ?: kARFontDefault;
}

- (UIColor*)textColor {
    return _options[kARAlertTextColorKey] ?: kARTextColorDefault;
}

- (NSString*)subtitleText {
    return _options[kARAlertSubtitleTextKey] ?: kARSubtitleTextDefault;
}

- (UIColor*)subtitleTextColor {
    return _options[kARAlertSubtitleTextColorKey] ?: kARSubtitleTextColorDefault;
}

- (UIFont*)subtitleFont {
    return _options[kARAlertSubtitleFontKey] ?: kARSubtitleFontDefault;
}

- (NSTextAlignment)textAlignment {
    return [_options[kARAlertTextAlignmentKey] integerValue] ?: kARTextAlignmentDefault;
}

- (BOOL)hasRoundedCorners {
    return [_options[kARAlertRoundedCornersKey] boolValue] ?: kARRoundedCornersDefault;
}

- (CGFloat)cornerRadius {
    return [_options[kARAlertCornerRadiusKey] floatValue] ?: kARRoundedCornerRadiusDefault;
}

- (UIColor*)buttonTextColor {
    return _options[kARAlertTextColorKey] ?: kARButtonTextColorDefault;
}

- (UIFont*)buttonFont {
    return _options[kARAlertButtonFontKey] ?: kARButtonFontDefault;
}

- (UIColor*)buttonBackgroundColor {
    return _options[kARAlertButtonBackgroundColorKey] ?: kARButtonBackgroundColorDefault;
}

-(NSArray *)buttons
{
    return _options[kARAlertButtonsKey] ?: kARButtonsDefault;
}



- (void)displayAlert:(ARAlert*)alert {
    _alertWindow.hidden = NO;
    
    UIView *alertView = alert.alertView;
    alertView.frame = [self getAlertFrameInWindow:_alertWindow forAlert:alertView];
    [_alertWindow.rootViewController.view addSubview:alertView];
}

-(CGRect)getAlertFrameInWindow:(UIWindow *)window forAlert:(UIView*)alert
{
    CGFloat x = (window.frame.size.width - alert.frame.size.width)/2;
    CGFloat y = (window.frame.size.height - alert.frame.size.height)/2;
    return CGRectMake(x, y, alert.frame.size.width, alert.frame.size.height);
}


// dismissModal removes the Hermes view from the superview.
- (void) dismiss
{
    _alertWindow.hidden = YES;
   [self.alertView removeFromSuperview];
}

@end


#pragma mark - ARAlertView
static CGFloat                  	kARButtonWidthHalf                      = 0.5;
static CGFloat                  	kARButtonWidthFull                      = 1.0;
static CGFloat                  	kARButtonHeight                         = 44.0;


@interface ARAlertView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UIView *buttonView;
@property (nonatomic, strong) UIView *contentView;
@end


@implementation ARAlertView{
    BOOL _buttonRowCompleted;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UIView *contentView = [[UIView alloc] initWithFrame:self.bounds];
        self.contentView = contentView;
        contentView.userInteractionEnabled = YES;
        [self addSubview:contentView];

        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        [contentView addSubview:label];
        self.label = label;
        
        UILabel *subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [contentView addSubview:subtitleLabel];
        self.subtitleLabel = subtitleLabel;
        
        UIView *buttonView = [[UILabel alloc] initWithFrame:CGRectZero];
        buttonView.userInteractionEnabled = YES;
        [contentView addSubview:buttonView];
        buttonView.backgroundColor = [UIColor blackColor];
        self.buttonView = buttonView;
    }
    return self;
}
- (void)updateLayout {
    CGRect bounds = _contentView.bounds;
    CGFloat height = [self getTextHeightForWidth:bounds.size.width forText:self.alert.text withFont:self.alert.font];
    
    if (self.alert.subtitleText == nil) {
        [self updateLayoutWithOutSubtitleInBounds:bounds withTextHeight:height];
    } else {
        [self updateLayoutWithSubtitleInBounds:bounds withTextHeight:height];


    }
    [self sizeToFit];
}

-(void)sizeToFit
{
    UIEdgeInsets inset = UIEdgeInsetsFromString(_alert.edgeInsetsString);

    [super sizeToFit];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, _contentView.frame.size.width + inset.left + inset.right, _contentView.frame.size.height +inset.top + inset.bottom);
}

-(void)updateLayoutWithSubtitleInBounds:(CGRect)bounds withTextHeight:(CGFloat)height
{
    CGFloat subtitleHeight = [self getTextHeightForWidth:bounds.size.width forText:self.alert.subtitleText withFont:self.alert.subtitleFont];
    
    self.label.frame = CGRectMake(0,
                                  0,
                                  bounds.size.width,
                                  height);
    
    self.subtitleLabel.frame = CGRectMake(0,
                                          height,
                                          bounds.size.width,
                                          subtitleHeight);
    
    _buttonView.frame = CGRectMake(_buttonView.frame.origin.x,
                                   height + subtitleHeight,
                                   _buttonView.frame.size.width,
                                   _buttonView.frame.size.height);
    _contentView.frame = CGRectMake(_contentView.frame.origin.x,
                                    _contentView.frame.origin.y,
                                    self.frame.size.width,
                                    _buttonView.frame.size.height + height + subtitleHeight);
}

-(void)updateLayoutWithOutSubtitleInBounds:(CGRect)bounds withTextHeight:(CGFloat)height
{
    self.label.frame = CGRectMake(0,
                                  0,
                                  bounds.size.width,
                                  height);
    _buttonView.frame = CGRectMake(_buttonView.frame.origin.x,
                                   height,
                                   _buttonView.frame.size.width,
                                   _buttonView.frame.size.height);
    
    _contentView.frame = CGRectMake(_contentView.frame.origin.x,
                                    _contentView.frame.origin.y,
                                    _contentView.frame.size.width,
                                    _buttonView.frame.size.height + height);
}

-(CGFloat)getTextHeightForWidth:(CGFloat)width forText:(NSString *)text withFont:(UIFont*)font
{
    return [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName : font}
                                                context:nil].size.height;
}

-(CGRect) getButtonFrame:(ARAlertButtonWidth)type lastButtonWidthType:(ARAlertButtonWidth)lastWidthType yOffset:(CGFloat*)yOffset
{
    CGRect frame;

    CGRect bounds = _contentView.bounds;
    switch (type){
        case ARAlertButtonWidthHalf:
            if(lastWidthType == ARAlertButtonWidthHalf){
                if(_buttonRowCompleted){
                    // Start new row
                    frame = CGRectMake(0,*yOffset, bounds.size.width * kARButtonWidthHalf, 50);
                    _buttonRowCompleted = NO;
                } else{
                    // Finish old row
                    frame = CGRectMake(bounds.size.width * kARButtonWidthHalf,
                                       *yOffset,
                                       bounds.size.width * kARButtonWidthHalf, kARButtonHeight);
                    _buttonRowCompleted = YES;
                    *yOffset += kARButtonHeight;
                }
                
            } else {
                // start new row
                
                frame = CGRectMake(0,
                                   *yOffset,
                                   bounds.size.width * kARButtonWidthHalf, kARButtonHeight);
                _buttonRowCompleted = NO;
            }
            
            break;
        case ARAlertButtonWidthFull:
            _buttonRowCompleted = YES;

            frame = CGRectMake(0,
                               *yOffset,
                               bounds.size.width * kARButtonWidthFull, kARButtonHeight);
            *yOffset += kARButtonHeight;
            break;
        default:
            _buttonRowCompleted = YES;
            
            frame = CGRectMake(0,
                               *yOffset,
                               bounds.size.width * kARButtonWidthFull, kARButtonHeight);
            *yOffset += kARButtonHeight;

            break;
    }
    return frame;
}
#pragma mark - Overrides

- (void)setAlert:(ARAlert *)alert {
    _alert = alert;
    _contentView.frame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsFromString(_alert.edgeInsetsString));
    _label.text = alert.text;
    _label.font = alert.font;
    _label.textColor = alert.textColor;
    _label.textAlignment = alert.textAlignment;
    _label.numberOfLines = alert.textMaxNumberOfLines;
    if (alert.subtitleText != nil) {
        _subtitleLabel.text = alert.subtitleText;
        _subtitleLabel.font = alert.subtitleFont;
        _subtitleLabel.textColor = alert.subtitleTextColor;
        _subtitleLabel.textAlignment = alert.subtitleTextAlignment;
        _subtitleLabel.numberOfLines = alert.subtitleTextMaxNumberOfLines;
    }
    if(alert.hasRoundedCorners){
        self.layer.cornerRadius = alert.cornerRadius;
        self.layer.masksToBounds = YES;
    }
    if(alert.buttons != nil){
        
        [self loadButtons:alert.buttons];
    }
    self.backgroundColor = alert.backgroundColor;
    
    [self updateLayout];
}

-(CGRect)getButtonViewFrameToFitSubviews:(NSArray*)subviews
{
    NSMutableArray *yPositions = [[NSMutableArray alloc] init];
    CGFloat maxWidth = 0;
    CGFloat maxY = 0 ;
    CGFloat maxYViewsHeight = 0;
    for(UIView *view in subviews){
        if([yPositions containsObject:@(view.frame.origin.y)]){
            maxWidth +=  view.frame.size.width;
        };
        [yPositions addObject:@(view.frame.origin.y)];
        maxWidth = MAX(maxWidth, view.frame.size.width);
        maxY = MAX(maxY, view.frame.origin.y);
        if(maxY == view.frame.origin.y)
            maxYViewsHeight = view.frame.size.height;
    }
    return CGRectMake(0, 0, maxWidth, maxY + maxYViewsHeight);
}

-(void)loadButtons:(NSArray *)buttons
{
    CGFloat yPosition = 0;
    ARAlertButtonWidth lastWidthType = nil;
    for(NSDictionary * button in buttons){
        [self addButton:button lastWidthType:lastWidthType atYOffset:&yPosition];
        if(!button[kARAlertWidthTypeKey]){
            lastWidthType = ARAlertButtonWidthFullTypeDefault;
        } else {
            lastWidthType = [button[kARAlertWidthTypeKey] integerValue];
        }

    }
    _buttonView.frame = [self getButtonViewFrameToFitSubviews:_buttonView.subviews];

}
- (void) addButton:(NSDictionary*)button lastWidthType:(ARAlertButtonWidth)widthType atYOffset:(CGFloat*)yoffset
{
    // INIT the button in the right location.
    CGRect frame = [self getButtonFrame:[button[kARAlertWidthTypeKey] integerValue] lastButtonWidthType:widthType yOffset:yoffset];
    
    UIButton *modalBtn = [[UIButton alloc] initWithFrame:frame];
    
    [modalBtn setTitle:button[kARAlertButtonTextKey] forState:UIControlStateNormal];
    modalBtn.titleLabel.font = _alert.buttonFont;
    modalBtn.titleLabel.textColor = _alert.buttonTextColor;
    modalBtn.backgroundColor = _alert.buttonBackgroundColor;
    
    if([button[kARAlertButtonTypeKey]integerValue] == ARAlertButtonTypeDismiss)
        [modalBtn addTarget:self.alert action:@selector(dismiss) forControlEvents: UIControlEventTouchUpInside];
    if([button[kARAlertButtonTypeKey]integerValue] == ARAlertButtonTypeAction)
        [modalBtn addTarget:self.alert action:@selector(buttonPressed) forControlEvents: UIControlEventTouchUpInside];
    
    
    [_buttonView addSubview:modalBtn];
}
@end
