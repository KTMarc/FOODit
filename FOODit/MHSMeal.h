#import "_MHSMeal.h"
#import <UIKit/UIKit.h>
#import "MHSPhoto.h"

@interface MHSMeal : _MHSMeal {}
// Custom logic goes here.


+(instancetype) mealWithName:(NSString *)name
                        desc:(NSString *)desc
                       price:(NSNumber *)price
                          mealID:(NSString *)mealID
             primaryImageURL: (NSString *)primaryImageURL
                         context:(NSManagedObjectContext *) context;

+(instancetype) mealWithDictionary:(NSDictionary *)mealDict
                     context:(NSManagedObjectContext *) context;

-(UIImage *) imageDb;

@end
