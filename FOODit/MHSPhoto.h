#import "_MHSPhoto.h"
#import <UIKit/UIKit.h>

@interface MHSPhoto : _MHSPhoto {}

@property (nonatomic,strong) UIImage *image;

+(instancetype) photoWithImage: (UIImage *) image
                       context: (NSManagedObjectContext *) context;

@end
