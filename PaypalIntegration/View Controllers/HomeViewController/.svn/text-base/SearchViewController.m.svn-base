//
//  SearchViewController.m
//  PaypalIntegration
//
//  Created by Paresh Bafna on 1/29/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "SearchViewController.h"
#import "ViewSildeUp.h"
#import "ToolsViewController.h"
#import "InformationViewController.h"
#import "PaymentViewController.h"
#import "ConstantFile.h"
#import "MBProgressHUD.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    headingLabelObj.text=NSLocalizedString(@"Heading", nil);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [registrationView addGestureRecognizer:tap];
     
    int tableHeight = [UIScreen mainScreen].bounds.size.height - 220;
    scrollViewObj=[[UIScrollView alloc]initWithFrame:CGRectMake(6, 9, 295, tableHeight)];
    scrollViewObj.contentSize = CGSizeMake(250, 400);
    [scrollViewObj setScrollEnabled:YES];
    scrollViewObj.delegate=self;
    [registrationView addSubview:scrollViewObj];
    
    firstTextFieldTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(7, 12, 250, 20)];
    firstTextFieldTitleLabel.text=NSLocalizedString(@"NameOfTextFieldOne", nil);
    [firstTextFieldTitleLabel setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    firstTextFieldTitleLabel.textColor = [UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    [scrollViewObj addSubview:firstTextFieldTitleLabel];
    
    nameTextField=[[UITextField alloc]initWithFrame:CGRectMake(7, 35, 275, 30)];
    [nameTextField setBorderStyle:UITextBorderStyleNone];
    nameTextField.backgroundColor=[UIColor clearColor];
    nameTextField.returnKeyType = UIReturnKeyNext;
    [nameTextField setBackground:[UIImage imageNamed:TextBoxImage]];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    nameTextField.leftView = paddingView;
    nameTextField.leftViewMode = UITextFieldViewModeAlways;
    nameTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [nameTextField setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    nameTextField.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    nameTextField.keyboardType=UIKeyboardTypeAlphabet;
    nameTextField.delegate=self;
    [scrollViewObj addSubview:nameTextField];
    
    secondTextFieldTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(7, 75, 250, 20)];
    secondTextFieldTitleLabel.text=NSLocalizedString(@"NameOfTextFieldSecond", nil);
    [secondTextFieldTitleLabel setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    secondTextFieldTitleLabel.textColor = [UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    [scrollViewObj addSubview:secondTextFieldTitleLabel];
    
    lastNameTextField=[[UITextField alloc]initWithFrame:CGRectMake(7, 100, 275, 30)];
    [lastNameTextField setBorderStyle:UITextBorderStyleNone];
    lastNameTextField.returnKeyType = UIReturnKeyNext;
    lastNameTextField.backgroundColor=[UIColor clearColor];
    [lastNameTextField setBackground:[UIImage imageNamed:TextBoxImage]];
    
    UIView *paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    lastNameTextField.leftView = paddingView1;
    lastNameTextField.leftViewMode = UITextFieldViewModeAlways;
    lastNameTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [lastNameTextField setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    lastNameTextField.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    lastNameTextField.delegate=self;
    [scrollViewObj addSubview:lastNameTextField];
    
    thirdTextFieldTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(7, 140, 250, 20)];
    thirdTextFieldTitleLabel.text=NSLocalizedString(@"NameOfThirdTextField", nil);
    [thirdTextFieldTitleLabel setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    thirdTextFieldTitleLabel.textColor = [UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    [scrollViewObj addSubview:thirdTextFieldTitleLabel];
    
    surnameTextField=[[UITextField alloc]initWithFrame:CGRectMake(7, 165, 275, 30)];
    [surnameTextField setBorderStyle:UITextBorderStyleNone];
    surnameTextField.returnKeyType = UIReturnKeyNext;
    surnameTextField.backgroundColor=[UIColor clearColor];
    [surnameTextField setBackground:[UIImage imageNamed:TextBoxImage]];
    
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    surnameTextField.leftView = paddingView2;
    surnameTextField.leftViewMode = UITextFieldViewModeAlways;
    surnameTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [surnameTextField setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    surnameTextField.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    surnameTextField.delegate=self;
    [scrollViewObj addSubview:surnameTextField];
    
    forthTextFieldTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(7, 205, 250, 20)];
    forthTextFieldTitleLabel.text=NSLocalizedString(@"NameOfFourthTextField", nil);
    [forthTextFieldTitleLabel setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    forthTextFieldTitleLabel.textColor = [UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    [scrollViewObj addSubview:forthTextFieldTitleLabel];
    
    countryTextField=[[UITextField alloc]initWithFrame:CGRectMake(7, 230, 275, 30)];
    [countryTextField setBorderStyle:UITextBorderStyleNone];
    countryTextField.backgroundColor=[UIColor clearColor];
    countryTextField.returnKeyType = UIReturnKeyNext;
    [countryTextField setBackground:[UIImage imageNamed:TextBoxImage]];
    
    UIView *paddingView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    countryTextField.leftView = paddingView3;
    countryTextField.leftViewMode = UITextFieldViewModeAlways;
    countryTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [countryTextField setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    countryTextField.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    countryTextField.delegate=self;
    [scrollViewObj addSubview:countryTextField];
    
    fifthTextFieldTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(7, 270, 250, 20)];
    fifthTextFieldTitleLabel.text=NSLocalizedString(@"NameOfFifthTextField", nil);
    [fifthTextFieldTitleLabel setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    fifthTextFieldTitleLabel.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    [scrollViewObj addSubview:fifthTextFieldTitleLabel];
    
    recordIDTextField=[[UITextField alloc]initWithFrame:CGRectMake(7, 295, 275, 30)];
    [recordIDTextField setBorderStyle:UITextBorderStyleNone];
    recordIDTextField.backgroundColor=[UIColor clearColor];
    recordIDTextField.returnKeyType = UIReturnKeyNext;
    [recordIDTextField setBackground:[UIImage imageNamed:TextBoxImage]];
    
    UIView *paddingView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    recordIDTextField.leftView = paddingView4;
    recordIDTextField.leftViewMode = UITextFieldViewModeAlways;
    recordIDTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    
    [recordIDTextField setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    recordIDTextField.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    recordIDTextField.delegate=self;
    [scrollViewObj addSubview:recordIDTextField];
    
    sixthTextFieldTitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(7, 340, 250, 20)];
    sixthTextFieldTitleLabel.text=NSLocalizedString(@"NameOfSixthTextField", nil);
    [sixthTextFieldTitleLabel setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    sixthTextFieldTitleLabel.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    [scrollViewObj addSubview:sixthTextFieldTitleLabel];
    
    emailTextField=[[UITextField alloc]initWithFrame:CGRectMake(7, 365, 275, 30)];
    [emailTextField setBorderStyle:UITextBorderStyleNone];
    emailTextField.backgroundColor=[UIColor clearColor];
    emailTextField.returnKeyType = UIReturnKeyDone;
    [emailTextField setBackground:[UIImage imageNamed:TextBoxImage]];
    
    UIView *paddingView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 20)];
    emailTextField.leftView = paddingView5;
    emailTextField.leftViewMode = UITextFieldViewModeAlways;
    emailTextField.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [emailTextField setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    emailTextField.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];
    emailTextField.delegate=self;
    emailTextField.keyboardType=UIKeyboardTypeEmailAddress;
    [scrollViewObj addSubview:emailTextField];
    
    UITapGestureRecognizer *tapScroll = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    tapScroll.cancelsTouchesInView = NO;
    [scrollViewObj addGestureRecognizer:tapScroll];
    
    realizerButtonTitleLabel.text=NSLocalizedString(@"BottomButton", nil);
    bottomLabelObj.text=NSLocalizedString(@"BottomLabel", nil);
    searchButtonLabelObj.text=NSLocalizedString(@"FirstButtonTitle", nil);
    settingButtonLabelObj.text=NSLocalizedString(@"SecondButtonTitle", nil);
    infoButtonLabelObj.text=NSLocalizedString(@"ThirdButtonTitle", nil);

    searchButton.selected=YES;
    
    
    self.taxiService=[[SearchWebService alloc]init];
    
    self.taxiService.delegate = self;
    [self.taxiService getSearchResultWithName:@"Guillermina" lastName:@"Cruz Perez" companyName:nil andEmail:@"john.smith@yahoo.com"];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [scrollViewObj setContentOffset:CGPointMake(0, 0)];
    [nameTextField setText:@""];
    [emailTextField setText:@""];
    [lastNameTextField setText:@""];
    [surnameTextField setText:@""];
    [countryTextField setText:@""];
    [recordIDTextField setText:@""];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [nameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [surnameTextField resignFirstResponder];
    [countryTextField resignFirstResponder];
    [recordIDTextField resignFirstResponder];
}

#pragma mark - Button Clicked Methods

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

-(IBAction)realizerButtonClicked:(id)sender
{
    [realizerButtonTitleLabel setTextColor:[UIColor colorWithRed:255.0f green:255.0f blue:255.0f alpha:1]];
    [self dismissKeyboard];
    
    if (nameTextField.text.length!=0)
    {
        BOOL isValidEmail=[self validateEmailWithString:emailTextField.text];
        if (isValidEmail)
        {
            // web service call
            [MBProgressHUD showGlobalProgressHUDWithTitle:nil];
            [self performSelector:@selector(webServiceSeccuss) withObject:nil afterDelay:2.0f];
        }
        else
        {
            UIAlertView *validEmailAlert=[[UIAlertView alloc]initWithTitle:@"Paypal Integration" message:@"Please enter valid email address" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [validEmailAlert show];
        }
    }
    else
    {
        UIAlertView *validNameAlert=[[UIAlertView alloc]initWithTitle:@"Paypal Integration" message:@"Please enter valid name" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [validNameAlert show];
    }
}

-(IBAction)searchButtonClicked:(id)sender
{
    settingButton.selected=NO;
    infoButton.selected=NO;
    searchButton.selected=YES;
}

-(IBAction)settingButtonClicked:(id)sender
{
    searchButton.selected=NO;
    infoButton.selected=NO;
    settingButton.selected=YES;
    
    NSLog(@"inside setting view controller");
    
    self.toolsViewController=[[ToolsViewController alloc]initWithNibName:ToolsViewControllerXIB bundle:nil];
    [self presentViewController:self.toolsViewController animated:YES completion:nil];
}

-(IBAction)informationButtonClicked:(id)sender
{
    settingButton.selected=NO;
    searchButton.selected=NO;
    infoButton.selected=YES;
    
    self.informationViewController=[[InformationViewController alloc]initWithNibName:InformationViewControllerXIB bundle:nil];
    [self presentViewController:self.informationViewController animated:YES completion:nil];
}

-(void)dismissKeyboard
{
    [nameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [recordIDTextField resignFirstResponder];
    [surnameTextField resignFirstResponder];
    [countryTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
}

#pragma mark - UITextField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField              // called when 'return' key pressed. return NO to ignore.
{
    if(textField == nameTextField)
       [lastNameTextField becomeFirstResponder];
    else if(textField == lastNameTextField)
        [surnameTextField becomeFirstResponder];
    else if(textField == surnameTextField)
        [countryTextField becomeFirstResponder];
    else if(textField == countryTextField)
        [recordIDTextField becomeFirstResponder];
    else if(textField == recordIDTextField)
        [emailTextField becomeFirstResponder];
    else if (textField == emailTextField)
        [textField resignFirstResponder];
    
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField==nameTextField)
    {
        if ([string length]>0)
        {
            if ([string isEqualToString:@" "])
            {
                return YES;
            }
            else
            {
                NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
                for (int i = 0; i < [string length]; i++)
                {
                    unichar c = [string characterAtIndex:i];
                    if ([myCharSet characterIsMember:c])
                    {
                        return YES;
                    }
                    else
                    {
                        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Invalid Entry" message:@"Please enter character only" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                        [alert show];
                        return NO;
                    }
                }
                return NO;
            }
        }
        else
            return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark - View move up handling

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [[ViewSildeUp sharedUserDefaults]SlideViewUpward:textField relatedView:self.view];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [[ViewSildeUp sharedUserDefaults]SlideViewDownward:textField relatedView:self.view];
}

-(void)webServiceSeccuss
{
    [MBProgressHUD dismissGlobalHUD];
    PaymentViewController *paymentViewControllerObj=[[PaymentViewController alloc]initWithNibName:PaymentViewControllerXIB bundle:nil];
    [self presentViewController:paymentViewControllerObj animated:YES completion:nil];
}




#pragma mark - service delegate methods

- (void)service:(Service *)service DidFinishWithResult:(id)result
{
    if(service == self.taxiService)
    {
        NSLog(@"Result %@",result);
    }
    
    
}

- (void)service:(Service *)service DidFailWithError:(NSError *)error
{
    if(service == self.taxiService)
    {
        NSDictionary *dic = error.userInfo;
        NSString *title = NSLocalizedString(@"TitleForNetworkErrorAlert", nil);
        NSString *errorMsg = [dic objectForKey:@"NSLocalizedDescription"];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title message:errorMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
        [alert show];
    }
}

- (void)service:(Service *)service DidFailWithErrorCode:(NSInteger)error
{
    if(service == self.taxiService)
    {
        NSString *title = NSLocalizedString(@"TitleForNetworkErrorAlert", nil);
        NSString *errorMsg = [NSString stringWithFormat:@"Error Code %d",error];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title message:errorMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}








        @end
