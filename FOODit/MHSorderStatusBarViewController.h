//
//  MHSorderStatusBarViewController.h
//  FOODit
//
//  Created by Marc Humet on 4/1/15.
//
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface MHSorderStatusBarViewController : UIViewController

@property (strong, nonatomic) MHSSimpleCoreDataStack *model;
@property (strong, nonatomic) MHSOrder *order;
@property (strong, nonatomic) IBOutlet UILabel *billTotalLabel;
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UILabel *mainCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *otherCountLabel;
- (IBAction)resetButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;


@end
