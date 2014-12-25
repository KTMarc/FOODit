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

+(instancetype) tagWithString:(NSString *)tagDict
                          context:(NSManagedObjectContext *) context{
    
    //Create the tag
    MHSTag *nt = [NSEntityDescription insertNewObjectForEntityForName:[MHSTag entityName]
                                               inManagedObjectContext:context];
    
    NSArray *aux;
    
    if ([tagDict hasPrefix:@"#"]){
        aux =[[tagDict substringFromIndex:1] componentsSeparatedByString: @":"];
        nt.name = aux[1];
        nt.tagType = aux[0];
//        NSLog(@"HAVE #");
//        NSLog(@"nt.name = %@", nt.name);
//        NSLog(@"nt.tagType = %@", nt.tagType);
    } else {
        nt.name = tagDict;
//        NSLog(@"DOES NOT HAVE #");
//        NSLog(@"nt.name = %@", nt.name);
    }
    
    
    //Fist check if the tag exists or not.
    
    
    return nt;
   // return nil;
    
}



@end
