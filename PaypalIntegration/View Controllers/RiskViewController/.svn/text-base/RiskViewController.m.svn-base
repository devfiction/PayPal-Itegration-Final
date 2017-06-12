//
//  RiskViewController.m
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/31/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import "RiskViewController.h"
#import "InformationViewController.h"
#import "ToolsViewController.h"
#import "SearchViewController.h"
#import "ConstantFile.h"

@interface RiskViewController ()

@end

@implementation RiskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andheaderLabelString:(NSString *)headerLabelString andInfoArray:(NSMutableDictionary *)dataDictionary
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.tableContent = [NSMutableDictionary dictionaryWithDictionary:dataDictionary];
        self.openedSections = [NSMutableArray array];
        NSLog(@"datain array=%@",self.tableContent);
        self.titleLabelForCell=headerLabelString;
        NSLog(@"headerLabelString=%@",headerLabelString);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.mainHeadingLabel.text=NSLocalizedString(@"FirstLabel",nil);
    self.mainHeadingLabel.text=self.titleLabelForCell;

    self.commonLabel.text=NSLocalizedString(@"resultsLabelOnRisk",nil);
    self.backButtonLabel.text=NSLocalizedString(@"BackButtonTitle",nil);
    
    [self.searchButton setSelected:YES];
    
    //setting tabbar buttons labels
    self.searchButtonLabel.text=NSLocalizedString(@"FirstButtonTitle",nil);
    self.settingButtonLabel.text=NSLocalizedString(@"SecondButtonTitle",nil);
    self.infoButtonLabel.text=NSLocalizedString(@"ThirdButtonTitle",nil);
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    _riskTableView.delegate=self;
    _riskTableView.dataSource=self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self resizeTableView];
}

#pragma mark - Button Clicked Methods

-(IBAction)backButtonClicked:(id)sender
{
    self.resultsViewController=[[ResultsViewController alloc]initWithNibName:ResultsViewControllerXIB bundle:nil];
    [self presentViewController:self.resultsViewController animated:YES completion:nil];
}

#pragma mark - tabbar methods

-(IBAction)serachButtonClicked:(id)sender
{
    NSLog(@"inside search button clicked");
    SearchViewController *searchViewControllerObj=[[SearchViewController alloc]initWithNibName:SearchViewControllerXIB bundle:nil];
    [self presentViewController:searchViewControllerObj animated:YES completion:nil];
}

-(IBAction)settingButtonClicked:(id)sender
{
    NSLog(@"inside setting view controller");
    self.toolsViewController=[[ToolsViewController alloc]initWithNibName:ToolsViewControllerXIB bundle:nil];
    [self presentViewController:self.toolsViewController animated:YES completion:nil];
}

-(IBAction)informationButtonClicked:(id)sender
{
    self.informationViewController=[[InformationViewController alloc]initWithNibName:InformationViewControllerXIB bundle:nil];
    [self presentViewController:self.informationViewController animated:YES completion:nil];
}

#pragma mark - TableView datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.tableContent allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if([self isSectionOpen:section])
        return [[self.tableContent objectForKey:[[self.tableContent allKeys] objectAtIndex:section]] count];
    else
        return 0;
}

-(BOOL)isSectionOpen:(int)section
{
    for (UIView *view in self.openedSections)
    {
        if(view.tag == section)
            return YES;
    }
    return NO;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 36.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self isSectionOpen:indexPath.section])
    {
        openedSectionHeight = [self getHeightForSection:indexPath];
        return MAX(36.0,openedSectionHeight);
    }
    else
        return 0.0f;
}

-(CGFloat)getHeightForSection:(NSIndexPath *)indexPath
{
    NSString *key = [[self.tableContent allKeys] objectAtIndex:indexPath.section];
    NSArray *array = [self.tableContent objectForKey:key];
    
    UILabel *textView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 284, 500)];
    textView.text = [array objectAtIndex:indexPath.row];
    
    CGFloat lines = [textView.text sizeWithFont:[UIFont fontWithName:HelveticaNeueBold size:11.0f]
                          constrainedToSize:textView.frame.size
                              lineBreakMode:NSLineBreakByWordWrapping].height/11;
    NSLog(@"%f",lines);
    return lines * 11.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [self removePreviousImagesFromContaintView:cell.contentView.subviews];
    
    NSString *key = [[self.tableContent allKeys] objectAtIndex:indexPath.section];
    NSArray *array = [self.tableContent objectForKey:key];
    
    CGFloat height = MAX(36.0,[self getHeightForSection:indexPath]);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-10, -2, cell.contentView.frame.size.width+20, height + 8)];
    view.tag = indexPath.row +1;
    view.backgroundColor = [UIColor colorWithRed:68.0/255.0f green:2.0/255.0f blue:14.0/255.0f alpha:1.0f];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, 2, 284, height-2)];
    textLabel.text = [array objectAtIndex:indexPath.row];
    [textLabel setUserInteractionEnabled:NO];
    textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont fontWithName:HelveticaNeueBold size:11.0f];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textColor = [UIColor colorWithRed:221.0/255.0f green:223.0/255.0f blue:223.0/255.0f alpha:1.0f];
    [view addSubview:textLabel];
    
    [cell.contentView addSubview:view];
    
        textLabel.textAlignment = NSTextAlignmentLeft;
        [textLabel setNumberOfLines:0];
        [textLabel sizeToFit];
        
        CGRect myFrame = textLabel.frame;
        myFrame = CGRectMake(myFrame.origin.x, myFrame.origin.y, 284, myFrame.size.height);
        textLabel.frame = myFrame;
    
    cell.contentView.backgroundColor = [UIColor colorWithRed:68.0/255.0f green:2.0/255.0f blue:14.0/255.0f alpha:1.0f];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row)
    {
        [self resizeTableView];
    }
}

-(void)removePreviousImagesFromContaintView:(NSArray *)viewArray
{
    for(UIView *view in viewArray)
    {
        if([view isKindOfClass:[UIView class]])
        {
            [view removeFromSuperview];
        }
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *parentView = [[UIView alloc] initWithFrame:CGRectMake(-10, 0, 340, 1)];
    parentView.backgroundColor = [UIColor colorWithRed:68.0/255.0f green:2.0/255.0f blue:14.0/255.0f alpha:1.0f];
    
    UIView *childView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 300, 1)];
    childView.backgroundColor = [UIColor whiteColor];
    [parentView addSubview:childView];
    
    return parentView;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // return cell received by dataSourceDelegate
    UIView *parentView = [[UIView alloc] initWithFrame:CGRectMake(-10, 0, 340, 36)];
    parentView.tag = section;
    parentView.backgroundColor = [UIColor colorWithRed:68.0/255.0f green:2.0/255.0f blue:14.0/255.0f alpha:1.0f];

    UIView *childView = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 300, 36)];
    childView.tag = section+1;
    childView.backgroundColor = [UIColor whiteColor];

    NSString *key = [[self.tableContent allKeys] objectAtIndex:section];

    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, 8, 270, 20)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = key;
    [headerLabel setFont:[UIFont fontWithName:HelveticaNeueBold size:14.5f]];
    headerLabel.textColor=[UIColor colorWithRed:66.0/255.0f green:68.0/255.0f blue:73.0/255.0f alpha:1.0f];

    UIImageView *verticalView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 3, 3, 33)];
    [verticalView setImage:[UIImage imageNamed:VerticalLineImage]];

    UIImageView *addView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 10, 18, 16)];
    addView.tag = section+1;
    [addView setImage:[UIImage imageNamed:PlusImage]];
    
    [childView addSubview:headerLabel];
    [childView addSubview:verticalView];
    [childView addSubview:addView];
    [parentView addSubview:childView];
    // Add tap gesture to get event when user tap on section
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnSectionHeader:)];
    [parentView addGestureRecognizer:tap];
    
    return parentView;
}

#pragma mark - UITableView tap on View

-(void)tapOnSectionHeader:(UITapGestureRecognizer *)tap
{
    if(self.openedSections.count !=0)
    {
        BOOL isSelfTap = NO;
        for (UIView *view in [self.openedSections copy])
        {
            [self.openedSections removeObject:view];
            [self removeRowsFromSelectedSection:view];
            if(view.tag == tap.view.tag)
                isSelfTap = YES;
        }
        if (!isSelfTap)
        {
            [self.openedSections addObject:tap.view];
            [self addRowsToSelectedSection:tap.view];
        }
        return;
    }
    
    if(![self.openedSections containsObject:tap.view])
    {
        [self.openedSections addObject:tap.view];
        [self addRowsToSelectedSection:tap.view];
    }
    else
    {
        [self.openedSections removeObject:tap.view];
        [self removeRowsFromSelectedSection:tap.view];
    }
    
}

#pragma mark - Rows adding and removing

-(void)addRowsToSelectedSection:(UIView *)view
{
    int size = [[self.tableContent objectForKey:[[self.tableContent allKeys] objectAtIndex:view.tag]] count];
    [self changeImageFromView:view isPlus:YES];
    NSMutableArray *arrayToAddCell = [self getIndexPathArrayOfSize:size forSection:view.tag];
    if(arrayToAddCell.count)
    {
        [self.riskTableView beginUpdates];
        [self.riskTableView insertRowsAtIndexPaths:arrayToAddCell withRowAnimation:UITableViewRowAnimationMiddle];
        [self.riskTableView endUpdates];
    }
    
    if (size == 0) {
        return;
    }
    
    // scroll to top position of cell so that it can be visible to all
    float contentOffset = self.riskTableView.contentSize.height - self.riskTableView.contentOffset.y - self.riskTableView.frame.size.height - self.riskTableView.frame.size.height/2;
    
    if(contentOffset < [self getHeightForSection:[NSIndexPath indexPathForRow:0 inSection:view.tag]])
        [self.riskTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:view.tag] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    else
        [self.riskTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:size-1 inSection:view.tag] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(void)removeRowsFromSelectedSection:(UIView *)view
{
    int size = [[self.tableContent objectForKey:[[self.tableContent allKeys] objectAtIndex:view.tag]] count];
    [self changeImageFromView:view isPlus:NO];
    NSMutableArray *arrayToAddCell = [self getIndexPathArrayOfSize:size forSection:view.tag];
    
    if(arrayToAddCell.count)
    {
        [self.riskTableView beginUpdates];
        [self.riskTableView deleteRowsAtIndexPaths:arrayToAddCell withRowAnimation:UITableViewRowAnimationFade];
        [self.riskTableView endUpdates];
    }
}

-(void)changeImageFromView:(UIView *)view isPlus:(BOOL)isPlus
{
    for (UIView *subView in view.subviews)
    {
        if([subView isKindOfClass:[UIView class]] && subView.tag)
        {
            for (UIView *subSubView in subView.subviews)
            {
                if([subSubView isKindOfClass:[UIImageView class]] && subSubView.tag)
                {
                    UIImageView *imgView = (UIImageView *)subSubView;
                    if(isPlus)
                        [imgView setImage:[UIImage imageNamed:MinusImage]];
                    else
                        [imgView setImage:[UIImage imageNamed:PlusImage]];
                }
            }
        }
    }
}

#pragma mark - Other utility functions

-(NSMutableArray *)getIndexPathArrayOfSize:(int)size forSection:(int)section
{
    // will call when needed array of indexpath for particular section
    NSMutableArray *indexPathArray = [[NSMutableArray alloc]init];
    
    for(int i=0;i<size;i++)
    {
        NSIndexPath *row = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPathArray addObject:row];
    }
    return indexPathArray;
}

-(void)resizeTableView
{
   /* CATransition *animation = [CATransition animation];
    [animation setDuration:0.5];
    [animation setType:kCATransitionFromTop];
    [animation setSubtype:kCATransitionFromBottom];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    [[self.riskTableView layer] addAnimation:animation forKey:@"PopNextArticleView"];
    
    CGFloat section = [self.riskTableView numberOfSections] * 36.0f;*/
    
    int height = [UIScreen mainScreen].bounds.size.height;
    [self.riskTableView setFrame:CGRectMake(-10, 90, 340, height-173)];
}

@end
