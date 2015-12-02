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
#import "MHSMeal.h"

@interface MHSMealViewController : MHSCoreDataViewController /*<UIAlertViewDelegate>*/

@property (strong, nonatomic) MHSSimpleCoreDataStack *model;
@property (strong, nonatomic) MHSOrder *order;
@property (strong, nonatomic) MHSMeal *alertViewMeal;

//IBOUTLETS

@end
