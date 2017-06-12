//
//  ToolsViewController.h
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/30/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InformationViewController;

@interface ToolsViewController : UIViewController
{
    
}
@property(nonatomic,strong) IBOutlet UILabel *headingLabel,*noticiasLabel,*radioLabel,*ascesoraLabel,*alertasLabel;

//labels on tabbar buttons

@property(nonatomic,strong)IBOutlet UILabel *searchButtonLabel,*settingButtonLabel,*infoButtonLabel;

@property (strong, nonatomic) IBOutlet UIButton *topLeftButton;
@property (strong, nonatomic) IBOutlet UIButton *topRightButton;
@property (strong, nonatomic) IBOutlet UIButton *bottomLeftButton;
@property (strong, nonatomic) IBOutlet UIButton *bottomRightButton;
@property (strong, nonatomic) IBOutlet UIView *horizontalView;
@property (strong, nonatomic) IBOutlet UIView *verticalView;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;



@property(nonatomic,strong) InformationViewController *informationViewController;

-(IBAction)serachButtonClicked:(id)sender;
-(IBAction)settingButtonClicked:(id)sender;
-(IBAction)informationButtonClicked:(id)sender;
-(IBAction)firstTopLeftButtonClicked:(id)sender;
-(IBAction)firstTopRightButtonClicked:(id)sender;
-(IBAction)firstBotttomLeftButtonClicked:(id)sender;
-(IBAction)firstBottomRightButtonClicked:(id)sender;





@end
