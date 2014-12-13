//
//  TableViewController.h
//  FOODit
//
//  Created by Marc Humet on 30/11/14.
//
//

#import <UIKit/UIKit.h>
#import "MHSCoreDataTableViewController.h"
#import "MHSSimpleCoreDataStack.h"
#import "MHSOrder.h"


@interface MHSMealsTableViewController : MHSCoreDataTableViewController

@property (strong, nonatomic) MHSSimpleCoreDataStack *model;
@property (strong, nonatomic) MHSOrder *order;


@end
