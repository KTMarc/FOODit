#import "MHSOrder.h"

@interface MHSOrder ()

// Private interface goes here.

@end

@implementation MHSOrder

#pragma mark - Class methods
+(NSArray *)observableKeyNames{
    return @[@"bill",@"main",@"other"];
}


+(instancetype) orderWithcontext:(NSManagedObjectContext *) context{
    
    
    MHSOrder *newOrder = [NSEntityDescription insertNewObjectForEntityForName:[MHSOrder entityName]
                                                    inManagedObjectContext:context];
    
    return newOrder;
}

#pragma mark - KVO
-(void) setupKVO{
    
    
    for (NSString *key in [[self class] observableKeyNames]) {
        
        [self addObserver:self
               forKeyPath:key
                  options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                  context:NULL];
    }
}

-(void) tearDownKVO{
    
    for (NSString *key  in [[self class] observableKeyNames]) {
        [self removeObserver:self
                  forKeyPath:key];
    }
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
//    self.modificationDate = [NSDate date];
    
}

#pragma mark - LifeCycle
-(void) awakeFromInsert{
    
    [super awakeFromInsert];
    [self setupKVO];
    
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    [self setupKVO];
}


-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    [self tearDownKVO];
    
}

@end
