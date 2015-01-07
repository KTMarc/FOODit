#import "_MHSOrder.h"

@interface MHSOrder : _MHSOrder {}


+(instancetype) orderWithcontext:(NSManagedObjectContext *)context;

-(void) setupKVO;
-(void) tearDownKVO;


@end
