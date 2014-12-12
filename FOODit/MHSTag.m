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
                        tagType:(NSString *)type
                     context:(NSManagedObjectContext *) context{
    
    MHSTag *nt = [NSEntityDescription insertNewObjectForEntityForName:[MHSTag entityName]
                                                inManagedObjectContext:context];
    
    nt.name = name;
    nt.tagType = type;

    return nt;
}


@end
