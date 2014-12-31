#import "MHSPhoto.h"

@interface MHSPhoto ()

// Private interface goes here.

@end

@implementation MHSPhoto

#pragma mark - Properties

-(void) setImage:(UIImage *)image{
    
    //Synchronize with imageData
    self.imageData = UIImageJPEGRepresentation(image, 1);
    
}

-(UIImage *) image{

    return [UIImage imageWithData:self.imageData];
}

#pragma mark - Class Methods

+(instancetype) photoWithImage: (UIImage *) image
                       context: (NSManagedObjectContext *) context{

    MHSPhoto *p = [NSEntityDescription insertNewObjectForEntityForName:[MHSPhoto entityName]
                                                inManagedObjectContext:context];
    p.imageData = UIImageJPEGRepresentation(image, 1);
 
    return p;
}




@end
