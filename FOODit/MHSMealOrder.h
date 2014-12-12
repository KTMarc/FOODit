#import "_MHSMealOrder.h"


@interface MHSMealOrder : _MHSMealOrder {}

+(instancetype) mealOrderWithMealCount:(NSNumber *)meal_count
                        note_for_kitchen:(NSString *)note
                                  meal: (MHSMeal *)meal
                                 order: (MHSOrder *)order
                     context:(NSManagedObjectContext *) context;


@end
