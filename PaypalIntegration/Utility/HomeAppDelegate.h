//
//  HomeAppDelegate.h
//  PaypalIntegration
//
//  Created by Paresh Bafna on 1/29/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@class SearchViewController;
@class ToolsViewController;
@class InformationViewController;
@class ResultsViewController;
@class RiskViewController;

@interface HomeAppDelegate : UIResponder <UIApplicationDelegate>
{
    IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property (strong, nonatomic) UIView *splashScreenView;
@property (strong, nonatomic) UIImageView *splashScreenImageView;

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SearchViewController *searchViewController;
@property (strong, nonatomic) ToolsViewController *toolsViewController;
@property (strong, nonatomic) InformationViewController *informationViewController;
@property (strong, nonatomic) ResultsViewController *resultsViewController;
@property (strong, nonatomic) RiskViewController *riskViewController;


@end
