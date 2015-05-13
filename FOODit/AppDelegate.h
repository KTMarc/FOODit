//
//  AppDelegate.h
//  FOODit
//
//  Created by Marc Humet on 30/11/14.
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MHSSimpleCoreDataStack.h"
#import "MHSMeal.h"
#import "MHSOrder.h"
#import "settings.h"
#import "MHSMeal.h"
#import "MHSMealOrder.h"
#import "MHSTag.h"
#import "MHSSimpleCoreDataStack.h"
#import "MHSMealsTableViewController.h"
#import "MHSPhoto.h"
#import "MHSOrder.h"
#import "AFNetworking.h"
#import "NSDictionary+meal.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "UIImageView+AFNetworking.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MHSSimpleCoreDataStack *model;
@property (strong, nonatomic) MHSOrder *order;
@property (strong, nonatomic) NSDictionary *dict;


@end

