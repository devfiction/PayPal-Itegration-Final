//
//  ToolsViewController.m
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/30/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "ToolsViewController.h"
#import "InformationViewController.h"
#import "SearchViewController.h"
#import "ConstantFile.h"

@interface ToolsViewController ()

@end

@implementation ToolsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headingLabel.text=NSLocalizedString(@"HeadingForHerramientas", nil);
    self.noticiasLabel.text=NSLocalizedString(@"FirstTopLeftLabel", nil);
    self.radioLabel.text=NSLocalizedString(@"SecondTopRightLabel", nil);
    self.ascesoraLabel.text=NSLocalizedString(@"ThirdBottomLeftLabel", nil);
    self.alertasLabel.text=NSLocalizedString(@"FourthBottomRightLabel", nil);

    //setting labels to tab bar buttons
    self.searchButtonLabel.text=NSLocalizedString(@"FirstButtonTitle",nil);
    [self.searchButtonLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:0.6]];
   
    self.settingButtonLabel.text=NSLocalizedString(@"SecondButtonTitle",nil);
    [self.settingButtonLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:1]];

    self.infoButtonLabel.text=NSLocalizedString(@"ThirdButtonTitle",nil);
     [self.infoButtonLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:0.6]];
    
    int height = [UIScreen mainScreen].bounds.size.height;
    if(height>500)
    {
        [self.backgroundImageView setImage:[UIImage imageNamed:backImage]];
        [self.topLeftButton setFrame:CGRectMake(10, 40, 150, 222)];
        [self.topRightButton setFrame:CGRectMake(160, 40, 150, 222)];
        [self.bottomLeftButton setFrame:CGRectMake(10, 262, 150, 221)];
        [self.bottomRightButton setFrame:CGRectMake(160, 262, 150, 221)];
        
        [self.verticalView setFrame:CGRectMake(160, 40, 1, 355)];
        [self.horizontalView setFrame:CGRectMake(10, 262, 300, 1)];
        
        [self.noticiasLabel setFrame:CGRectMake(10, 166, 150, 55)];
        [self.radioLabel setFrame:CGRectMake(160, 166, 150, 55)];
        [self.ascesoraLabel setFrame:CGRectMake(10, 390, 150, 55)];
        [self.alertasLabel setFrame:CGRectMake(160, 390, 150, 55)];
        
        [self.topLeftButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [self.topRightButton setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [self.bottomLeftButton setContentEdgeInsets:UIEdgeInsetsMake(-60, 0, 0, 0)];
        [self.bottomRightButton setContentEdgeInsets:UIEdgeInsetsMake(-60, 0, 0, 0)];
    }
    [self setTopCenteredAlignLabelText:self.noticiasLabel];
    [self setTopCenteredAlignLabelText:self.radioLabel];
    [self setTopCenteredAlignLabelText:self.ascesoraLabel];
    [self setTopCenteredAlignLabelText:self.alertasLabel];

}

-(void)setTopCenteredAlignLabelText:(UILabel *)label
{
    label.textAlignment = NSTextAlignmentCenter;
    [label setNumberOfLines:0];
    [label sizeToFit];
    
    CGRect myFrame = label.frame;
    myFrame = CGRectMake(myFrame.origin.x, myFrame.origin.y, 150, myFrame.size.height);
    label.frame = myFrame;
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
}

-(IBAction)informationButtonClicked:(id)sender
{
    self.informationViewController=[[InformationViewController alloc]initWithNibName:InformationViewControllerXIB bundle:nil];
    [self presentViewController:self.informationViewController animated:YES completion:nil];
}

-(IBAction)firstTopLeftButtonClicked:(id)sender
{
    NSURL *url = [NSURL URLWithString:FirstLink];
    [[UIApplication sharedApplication] openURL:url];
}

-(IBAction)firstTopRightButtonClicked:(id)sender
{
    NSURL *url = [NSURL URLWithString:SecondLink];
    [[UIApplication sharedApplication] openURL:url];
}

-(IBAction)firstBotttomLeftButtonClicked:(id)sender
{
    NSURL *url = [NSURL URLWithString:ThirdLink];
    [[UIApplication sharedApplication] openURL:url];
}

-(IBAction)firstBottomRightButtonClicked:(id)sender
{
    NSURL *url = [NSURL URLWithString:ForthLink];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidUnload {
    [self setTopLeftButton:nil];
    [self setTopRightButton:nil];
    [self setBottomLeftButton:nil];
    [self setBottomRightButton:nil];
    [self setHorizontalView:nil];
    [self setVerticalView:nil];
    [self setBackgroundImageView:nil];
    [super viewDidUnload];
}
@end
