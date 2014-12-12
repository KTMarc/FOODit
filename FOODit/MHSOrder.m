#import "MHSOrder.h"

@interface MHSOrder ()

// Private interface goes here.

@end

@implementation MHSOrder

+(instancetype) orderWithcontext:(NSManagedObjectContext *) context{
    
    
    MHSOrder *newOrder = [NSEntityDescription insertNewObjectForEntityForName:[MHSOrder entityName]
                                                    inManagedObjectContext:context];
    
    return newOrder;
}


@end
