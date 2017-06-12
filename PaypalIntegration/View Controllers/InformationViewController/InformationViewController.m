//
//  InformationViewController.m
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/30/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "InformationViewController.h"
#import "ToolsViewController.h"
#import "SearchViewController.h"
#import "ConstantFile.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //setting labels to tab bar buttons
    self.searchButtonLabel.text=NSLocalizedString(@"FirstButtonTitle",nil);
    [self.searchButtonLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:0.6]];
    self.settingButtonLabel.text=NSLocalizedString(@"SecondButtonTitle",nil);
    [self.settingButtonLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:0.6]];

    self.infoButtonLabel.text=NSLocalizedString(@"ThirdButtonTitle",nil);
    [self.infoButtonLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:1]];

    self.infoHeadingTitle.text=NSLocalizedString(@"HeadingTitleForAcercaDe", nil);
    self.firstLable.text=NSLocalizedString(@"FirstHeadLabelTitle", nil);
    self.secondLable.text=NSLocalizedString(@"SecondLabelTitle", nil);
    self.thirdLabel.text=NSLocalizedString(@"ThirdLabelUnderSecond", nil);
    self.fourthlabel.text=NSLocalizedString(@"FourthLabelTitle", nil);
    self.fifthLabel.text=NSLocalizedString(@"FifthLabelUnderFourth", nil);
    
    int height = [UIScreen mainScreen].bounds.size.height;
    if(height>500)
       [self.backgroundView setFrame:CGRectMake(12, 185, 296, 120)];
}

#pragma mark - Button Clicked Methods

-(IBAction)serachButtonClicked:(id)sender
{
    NSLog(@"inside search button clicked");
    
    SearchViewController *searchViewControllerObj=[[SearchViewController alloc]initWithNibName:SearchViewControllerXIB bundle:nil];
    [self presentViewController:searchViewControllerObj animated:YES completion:nil];
}

-(IBAction)settingButtonClicked:(id)sender
{
    NSLog(@"inside setting view controller");
    //to set animation style while presenting another view controller
    
   /* infoViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:infoViewController animated:YES completion:nil];*/
    
    //to flip out of it
    
    //    [self dismissViewControllerAnimated:YES completion:nil];

    
    self.toolsViewController=[[ToolsViewController alloc]initWithNibName:ToolsViewControllerXIB bundle:nil];
   // self.settingViewController.modalTransitionStyle=UIModalTransitionStylePartialCurl;
    [self presentViewController:self.toolsViewController animated:YES completion:nil];
}

-(IBAction)informationButtonClicked:(id)sender
{
    NSLog(@"Inside information clicked button");
}

- (void)viewDidUnload {
    [self setBackgroundView:nil];
    [super viewDidUnload];
}
@end
