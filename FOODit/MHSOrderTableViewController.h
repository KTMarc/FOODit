//
//  MHSOrderViewController.h
//  FOODit
//
//  Created by Marc Humet on 12/12/14.
//
//

#import "MHSCoreDataTableViewController.h"
#import "MHSSimpleCoreDataStack.h"
#import "AppDelegate.h"

@interface MHSOrderTableViewController : MHSCoreDataTableViewController

@property (strong, nonatomic) MHSSimpleCoreDataStack *model;

@end
