#import "_MHSTag.h"

@interface MHSTag : _MHSTag {}
// Custom logic goes here.
+(instancetype) tagWithName:(NSString *)name
                       tagType: (NSString *)type
                     context:(NSManagedObjectContext *) context;

+(instancetype) tagWithString:(NSString *)tagDict
                    context:(NSManagedObjectContext *) context;

@end
