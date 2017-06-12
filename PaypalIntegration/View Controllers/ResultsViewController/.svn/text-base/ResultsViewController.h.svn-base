//
//  ResultsViewController.h
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/31/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiskViewController.h"
@class RiskViewController;

@interface ResultsViewController : UIViewController
{
    
}
@property(nonatomic,strong) IBOutlet UILabel *headingLabel,*detailInfoLabelForResults,*firstRiskLabel,*secondRiskLabel,*thirdRiskLabel,*backButtonLabel;

@property(nonatomic,strong) RiskViewController *riskViewController;
//labels for percent of risk

@property(nonatomic,strong) IBOutlet UILabel *firstRiskNumber,*secondRiskNumber,*thirdRiskNumber;
@property(nonatomic,strong)NSString *stringToHoldFirstRisk,*stringToHoldSecondRisk,*stringToHoldThirdRisk;

@property(nonatomic,strong) NSMutableDictionary *tableInfoArray;

- (IBAction)firstRiskButtonPressed:(id)sender;
- (IBAction)secondRiskButtonPressed:(id)sender;
- (IBAction)thirdRiskButtonPressed:(id)sender;

-(IBAction)backButtonClicked:(id)sender;

@end
