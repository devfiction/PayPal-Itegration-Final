//
//  ResultsViewController.m
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/31/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "ResultsViewController.h"
#import "ConstantFile.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headingLabel.text=NSLocalizedString(@"MainHeadTitle", nil);
    self.detailInfoLabelForResults.text=NSLocalizedString(@"DetailInfoLabelForResults", nil);
    self.firstRiskLabel.text=NSLocalizedString(@"FirstLabel", nil);
    self.secondRiskLabel.text=NSLocalizedString(@"SecondLabel", nil);
    self.thirdRiskLabel.text=NSLocalizedString(@"ThirdLabel", nil);
    self.backButtonLabel.text=NSLocalizedString(@"BackButtonTitle",nil);
    
    self.tableInfoArray=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@[@"Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal "],@"Deuda",@[@"EvacionEvacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal  Fiscal"],@"Deuda1",@[@"EvacionEvacion Fiscal Evacion Fiscal Evacion Fiscal  Fiscal"],@"Deuda2",@[@"EvacionEvacion Fiscal Evacion Fiscal  Fiscal"],@"Deuda3",@[@"EvacionEvacion Fiscal  Fiscal"],@"Deuda4",@[@"EvacionEvacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal  Fiscal"],@"Deuda5",@[@"EvacionEvacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal  Fiscal"],@"Deuda6",@[@"Evacion FiscalEvacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal Evacion Fiscal "],@"Deuda7", nil];
}

#pragma mark - Button Clicked Methods

- (IBAction)firstRiskButtonPressed:(id)sender
{
   //self.firstRiskLabel.text=NSLocalizedString(@"FirstLabelOnRiskScreen", nil);
    self.stringToHoldFirstRisk=NSLocalizedString(@"FirstLabelOnRiskScreen", nil);
    
    self.riskViewController=[[RiskViewController alloc]initWithNibName:RiskViewControllerXIB bundle:nil andheaderLabelString:self.stringToHoldFirstRisk andInfoArray:self.tableInfoArray];
    [self presentViewController:self.riskViewController animated:YES completion:nil];
}

- (IBAction)secondRiskButtonPressed:(id)sender
{
    //self.secondRiskLabel.text=NSLocalizedString(@"SecondLabelOnRiskScreen", nil);
    self.stringToHoldSecondRisk=NSLocalizedString(@"SecondLabelOnRiskScreen", nil);

    NSLog(@"stringtoholdsecondrisk=%@",self.stringToHoldSecondRisk);

    self.riskViewController=[[RiskViewController alloc]initWithNibName:RiskViewControllerXIB bundle:nil andheaderLabelString:self.stringToHoldSecondRisk andInfoArray:self.tableInfoArray];
    [self presentViewController:self.riskViewController animated:YES completion:nil];
}

- (IBAction)thirdRiskButtonPressed:(id)sender
{
    //self.thirdRiskLabel.text=NSLocalizedString(@"ThirdLabelOnRiskScreen", nil);
    self.stringToHoldThirdRisk=NSLocalizedString(@"ThirdLabelOnRiskScreen", nil);
    
    self.riskViewController=[[RiskViewController alloc]initWithNibName:RiskViewControllerXIB bundle:nil andheaderLabelString:self.stringToHoldThirdRisk andInfoArray:self.tableInfoArray];
    [self presentViewController:self.riskViewController animated:YES completion:nil];
}

-(IBAction)backButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
