//
//  HomeAppDelegate.m
//  PaypalIntegration
//
//  Created by Paresh Bafna on 1/29/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "HomeAppDelegate.h"
#import "SearchViewController.h"
#import "ToolsViewController.h"
#import "InformationViewController.h"
#import "ResultsViewController.h"
#import "RiskViewController.h"
#import "ConstantFile.h"
#import "MKStoreManager.h"



@implementation HomeAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:AppRunForFirstTime])
    {
        [[MKStoreManager sharedManager] removeAllKeychainData];
        [[NSUserDefaults standardUserDefaults] setValue:@"1strun" forKey:AppRunForFirstTime];

    }
    
    [MKStoreManager sharedManager];
    
    self.splashScreenView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.splashScreenView.backgroundColor=[UIColor redColor];
    
    int height = [UIScreen mainScreen].bounds.size.height;
    
    UILabel *loadingLabel=[[UILabel alloc]init];
    loadingLabel.frame=CGRectMake(144, (height>500)? 380 : 340,100,30);
    loadingLabel.text=UITextAlignmentLeft;
    loadingLabel.backgroundColor=[UIColor clearColor];
    loadingLabel.font=[UIFont fontWithName:HelveticaNeue size:20];
    loadingLabel.font=[UIFont boldSystemFontOfSize:20];
    loadingLabel.text=NSLocalizedString(LoadingLabel, nil);
    [loadingLabel setTextColor:[UIColor colorWithRed:88.0/255.0f green:2.0/255.0f blue:14.0/255.0f alpha:1]];
    
    activityIndicator=[[UIActivityIndicatorView alloc]init];
    activityIndicator.frame=CGRectMake(85,(height>500)? 380 : 340,30,30);
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.color=[UIColor blackColor];
    activityIndicator.transform=CGAffineTransformMakeScale(1.5f, 1.5f);
    [activityIndicator startAnimating];
    
    self.splashScreenImageView=[[UIImageView alloc]init];
    self.splashScreenImageView.frame=CGRectMake(0, 0, 320, height);
    if(height>500)
        [self.splashScreenImageView setImage:[UIImage imageNamed:SplashImage_iPhone5]];
    else
        [self.splashScreenImageView setImage:[UIImage imageNamed:SplashImage]];
    
    
    
    [self.window makeKeyAndVisible];
    [self.window addSubview:self.splashScreenImageView];
    [self.window addSubview:activityIndicator];
    [self.window addSubview:loadingLabel];
    
    

    NSTimeInterval afterTimeInterval=3.0f;
    [NSTimer scheduledTimerWithTimeInterval:afterTimeInterval target:self selector:@selector(loadData) userInfo:nil repeats:NO];
    
    return YES;
}

-(void) loadData
{
    [activityIndicator stopAnimating];
    [self.splashScreenImageView removeFromSuperview];
    
    self.searchViewController = [[SearchViewController alloc] initWithNibName:SearchViewControllerXIB bundle:nil];
    self.window.rootViewController = self.searchViewController;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    for (UIWindow* window in [UIApplication sharedApplication].windows)
    {
        NSArray* subviews = window.subviews;
        [self checkViews:subviews];
    }
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)checkViews:(NSArray *)subviews
{
    Class ATClass = [UITextField class];
    
    for (UIView * subview in subviews)
    {
        if([subview isKindOfClass:ATClass])
        {
            [(UITextField *)subview resignFirstResponder];
        }
        else
        {
            [self checkViews:subview.subviews];
        }
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
