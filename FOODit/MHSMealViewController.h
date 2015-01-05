//
//  MHSMealViewController.h
//  FOODit
//
//  Created by Marc Humet on 5/1/15.
//
//

#import <UIKit/UIKit.h>
#import "MHSCoreDataViewController.h"
#import "MHSCoreDataTableViewController.h"
#import "MHSSimpleCoreDataStack.h"
#import "MHSOrder.h"

@interface MHSMealViewController : MHSCoreDataViewController

@property (strong, nonatomic) MHSSimpleCoreDataStack *model;
@property (strong, nonatomic) MHSOrder *order;

//IBOUTLETS
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
