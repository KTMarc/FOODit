#import "_MHSOrder.h"

@interface MHSOrder : _MHSOrder {}


+(instancetype) orderWithcontext:(NSManagedObjectContext *)context;

-(void) SetupKVO;

@end
