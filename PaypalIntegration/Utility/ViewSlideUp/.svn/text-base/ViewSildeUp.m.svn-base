//
//  ViewSildeUp.m
//  PaypalIntegration
//
//  Created by Paresh Bafna on 1/30/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "ViewSildeUp.h"


static ViewSildeUp *_instance = nil;

// constant for moving keyboard upward
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;



@implementation ViewSildeUp

#pragma mark - Singleton methods

+ (ViewSildeUp *)sharedUserDefaults
{
    @synchronized(self) {
        if (nil == _instance) {
            _instance = [[super allocWithZone:NULL] init];
        }
    }
    
    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedUserDefaults];
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

/*- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

- (oneway void)release
{
    // nothing
}

- (id)autorelease
{
    return self;
}
*/

#pragma mark - Slide View Up Events

-(void)SlideViewUpward:(UITextField *)textField relatedView:(UIView *)view
{
    CGRect textFieldRect =
    [view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =
    [view.window convertRect:view.bounds fromView:view];
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator =
    midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    
    CGFloat denominator =
    (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)
    * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    
    CGRect viewFrame = view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

#pragma mark - Slide View Down Events

-(void)SlideViewDownward:(UITextField *)textField relatedView:(UIView *)view
{
    /*.....*/
    // CGRect imageFrame=_sampleimage.frame;
    
    CGRect viewFrame =view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [view setFrame:viewFrame];
    
    [UIView commitAnimations];
    
}

@end
