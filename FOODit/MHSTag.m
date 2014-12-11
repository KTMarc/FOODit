#import "MHSTag.h"

@interface MHSTag ()

// Private interface goes here.

@end

@implementation MHSTag

// Custom logic goes here.

+(NSArray *)observableKeyNames{
    //    return @[@"creationDate", @"name", @"notes"];
    return @[@"name",@"type"];
}

+(instancetype) tagWithName:(NSString *)name
                        type:(NSString *)type
                     context:(NSManagedObjectContext *) context{
    
    MHSTag *nt = [NSEntityDescription insertNewObjectForEntityForName:[MHSTag entityName]
                                                inManagedObjectContext:context];
    
    nt.name = name;
    nt.type = type;

    return nt;
}


@end
