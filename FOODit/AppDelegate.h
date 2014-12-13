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

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MHSSimpleCoreDataStack *model;
@property (strong, nonatomic) MHSOrder *order;


@end

