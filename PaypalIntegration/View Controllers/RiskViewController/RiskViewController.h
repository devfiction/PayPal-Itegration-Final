//
//  RiskViewController.h
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/31/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CustomCell.h"
#import "CustoCellsAfterExpanding.h"
#import "ResultsViewController.h"

@class ResultsViewController;
@class ToolsViewController;
@class InformationViewController;

@interface RiskViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat openedSectionHeight;
}
@property(nonatomic,strong) IBOutlet UILabel *mainHeadingLabel,*commonLabel,*backButtonLabel;
@property(nonatomic,strong) NSString *titleLabelForCell;
//@property(nonatomic,strong) NSMutableArray *holdDataFromResultsScreen;
@property (strong, nonatomic) NSMutableDictionary *tableContent;
@property (strong, nonatomic) NSMutableArray *openedSections;

//tabbar buttons outlets

@property(nonatomic,strong) IBOutlet UIButton *searchButton;
@property(nonatomic,strong) IBOutlet UIButton *settingButton;
@property(nonatomic,strong) IBOutlet UIButton *infoButton;

//labels on tabbar buttons
@property(nonatomic,strong)IBOutlet UILabel *searchButtonLabel,*settingButtonLabel,*infoButtonLabel;


//creating objects of tabbar classes

@property(nonatomic,strong) ToolsViewController *toolsViewController;
@property(nonatomic,strong) InformationViewController *informationViewController;

//creating customcell objects
@property(nonatomic,strong) IBOutlet CustomCell *customcell;
@property(nonatomic,strong)CustoCellsAfterExpanding *custoCellsAfterExpanding;

@property(nonatomic,strong) IBOutlet UITableView *riskTableView;

//making object of resultsview controller
@property(nonatomic,strong) ResultsViewController *resultsViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andheaderLabelString:(NSString *)headerLabelString andInfoArray:(NSMutableDictionary *)dataDictionary;


-(IBAction)backButtonClicked:(id)sender;

//tabbar methods

-(IBAction)serachButtonClicked:(id)sender;
-(IBAction)settingButtonClicked:(id)sender;
-(IBAction)informationButtonClicked:(id)sender;

@end
