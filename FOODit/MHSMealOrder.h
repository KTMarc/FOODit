#import "_MHSMealOrder.h"


@interface MHSMealOrder : _MHSMealOrder {}

+(instancetype) mealOrderWithMealCount:(NSNumber *)meal_count
                        note_for_kitchen:(NSString *)note
                                  meal: (MHSMeal *)meal
                                 order: (MHSOrder *)order
                            mainCourse: (NSString *) mainCourse
                     context:(NSManagedObjectContext *) context;


@end
