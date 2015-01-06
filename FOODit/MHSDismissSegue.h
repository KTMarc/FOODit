//
//  MHSDismissSegue.h
//  FOODit
//
//  Created by Marc Humet on 6/1/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MHSMealViewController.h"
#import "MHSOrderViewController.h"

@interface MHSDismissSegue : NSObject

@property (strong, nonatomic) MHSMealViewController *sourceViewController;
@property (strong, nonatomic) MHSOrderViewController *destinationViewController;

- (void)perform;


@end
