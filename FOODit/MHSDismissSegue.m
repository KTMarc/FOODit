//
//  MHSDismissSegue.m
//  FOODit
//
//  Created by Marc Humet on 6/1/15.
//
//

#import "MHSDismissSegue.h"


@implementation MHSDismissSegue

- (void)perform
{
    UIViewController *controller = self.sourceViewController;
    [controller.parentViewController dismissViewControllerAnimated:YES
                                                        completion:nil];
}


@end
