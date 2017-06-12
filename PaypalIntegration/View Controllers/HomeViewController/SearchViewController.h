//
//  SearchViewController.h
//  PaypalIntegration
//
//  Created by Paresh Bafna on 1/29/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchWebService.h"
#import "ServiceDelegate.h"


@class ToolsViewController;
@class InformationViewController;

@interface SearchViewController : UIViewController<UITextFieldDelegate,UIScrollViewDelegate,ServiceDelegate>
{
    IBOutlet UILabel *headingLabelObj;
    IBOutlet UILabel *firstTextFieldTitleLabel,*secondTextFieldTitleLabel,*thirdTextFieldTitleLabel,*forthTextFieldTitleLabel,*fifthTextFieldTitleLabel,*sixthTextFieldTitleLabel;
    IBOutlet UILabel *realizerButtonTitleLabel,*bottomLabelObj;
    IBOutlet UILabel *searchButtonLabelObj,*settingButtonLabelObj,*infoButtonLabelObj;
    
    IBOutlet UIScrollView *scrollViewObj;
    
    IBOutlet UIButton *searchButton,*settingButton,*infoButton;
    IBOutlet UIView *registrationView;
    
    IBOutlet UITextField *nameTextField,*emailTextField,*lastNameTextField,*surnameTextField,*countryTextField,*recordIDTextField;


}

-(IBAction)realizerButtonClicked:(id)sender;
-(IBAction)searchButtonClicked:(id)sender;
-(IBAction)settingButtonClicked:(id)sender;
-(IBAction)informationButtonClicked:(id)sender;

@property(nonatomic,strong) ToolsViewController *toolsViewController;
@property(nonatomic,strong) InformationViewController *informationViewController;
@property (strong, nonatomic) SearchWebService *taxiService;



@end
