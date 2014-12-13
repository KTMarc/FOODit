//
//  MHSOrderViewController.h
//  FOODit
//
//  Created by Marc Humet on 12/12/14.
//
//

#import <UIKit/UIKit.h>
#import "MHSSimpleCoreDataStack.h"
#import "MHSCoreDataTableViewController.h"
#import "AppDelegate.h"
#import "MHSMeal.h"
#import "MHSCoreDataViewController.h"

@interface MHSOrderViewController : MHSCoreDataViewController

@property (strong, nonatomic) MHSSimpleCoreDataStack *model;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *totalPriceLabel;



@end
