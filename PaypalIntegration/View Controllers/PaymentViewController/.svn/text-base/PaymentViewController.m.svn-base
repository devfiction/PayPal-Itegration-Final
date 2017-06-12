//
//  PaymentViewController.m
//  PaypalIntegration
//
//  Created by Paresh Bafna on 1/30/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "PaymentViewController.h"

@interface PaymentViewController ()

@end

@implementation PaymentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    backGroundLabel.text=NSLocalizedString(@"BackButtonTitle", nil);
    paymentHeadingLabel.text=NSLocalizedString(@"PaymentHeading", nil);
    costInfoLabel.text=NSLocalizedString(@"FirstCostLabel", nil);
    infoLabel.text=NSLocalizedString(@"DetailInfoLabelTitle", nil);
    lastInfoLabel.text=NSLocalizedString(@"QuestionLabelTitle", nil);
    purchaseButtonLabel.text=NSLocalizedString(@"ThirdLabelTitle", nil);
}

#pragma mark - Button Click Events

-(IBAction)backButtonClick:(id)sender
{
    [backGroundLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:1]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)purchseButtonClicked:(id)sender
{
    if ([self checkNetworkStatus])
    {
        [MBProgressHUD showGlobalProgressHUDWithTitle:nil];
        [[MKStoreManager sharedManager] buyFeature:kInAppPurchaseProUpgradeProductId
                                        onComplete:^(NSString* purchasedFeature, NSData* purchasedReceipt, NSArray* availableDownloads)
                                        {
                                            [MBProgressHUD dismissGlobalHUD];
                                            NSLog(@"Purchased: %@", purchasedFeature);
                                            [purchaseButtonLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:1]];
                                            ResultsViewController *resultsViewControllerObj=[[ResultsViewController alloc]initWithNibName:ResultsViewControllerXIB bundle:nil];
                                            UIViewController *lastViewController = [self presentingViewController];
                                            [self dismissViewControllerAnimated:YES completion:^{
                                                [lastViewController presentViewController:resultsViewControllerObj animated:YES completion:nil];                                                
                                            }];
                                        }
                                        onCancelled:^()
                                        {
                                            [MBProgressHUD dismissGlobalHUD];
                                            NSLog(@"User Cancelled Transaction ::::");
                                            [[[UIAlertView alloc]initWithTitle:@"Paypal Integration" message:@"In-app transaction canceled" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
                                        }];
    }
    else
    {
        [[[UIAlertView alloc]initWithTitle:@"Paypal Integration" message:@"Network not available" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}

-(BOOL)checkNetworkStatus
{
    Reachability* reachability =  [Reachability reachabilityForInternetConnection];
    NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
    return (remoteHostStatus == NotReachable) ? NO : YES;
}

@end
