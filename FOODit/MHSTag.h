#import "_MHSTag.h"

@interface MHSTag : _MHSTag {}
// Custom logic goes here.
+(instancetype) tagWithName:(NSString *)name
                       type: (NSString *)type
                     context:(NSManagedObjectContext *) context;

@end
