#import "_MHSMeal.h"

@interface MHSMeal : _MHSMeal {}
// Custom logic goes here.


+(instancetype) mealWithName:(NSString *)name
                        desc:(NSString *)desc
                          mealID:(NSString *)mealID
                         context:(NSManagedObjectContext *) context;

@end
