//
//  MHSMealCardCurve.m
//  FOODit
//
//  Created by Marc Humet on 13/12/14.
//
//

#import "MHSMealCardCurve.h"
#import "FOODitStyleKit.h"


@implementation MHSMealCardCurve


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    [FOODitStyleKit drawMealcard__curve];
    
}


@end
