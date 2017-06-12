//
//  CustoCellsAfterExpandingViewController.h
//  PaypalIntegration
//
//  Created by shiva chaugule on 1/31/13.
//  Copyright (c) 2013 Paresh Bafna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustoCellsAfterExpanding : UITableViewCell

@property(nonatomic,strong) NSString *headerLabelString;

@property(nonatomic,strong) IBOutlet UILabel *headerTitleForExpandable;
@property(nonatomic,strong) IBOutlet UILabel *infoLabel;

@property(nonatomic,strong) NSString *infoLabelString;
@property(nonatomic,strong) NSIndexPath *ip;
@property(nonatomic,strong) NSObject *mv;

@end
