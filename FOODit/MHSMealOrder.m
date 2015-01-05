#import "MHSMealOrder.h"

@interface MHSMealOrder ()

// Private interface goes here.

@end

@implementation MHSMealOrder

+(instancetype) mealOrderWithMealCount:(NSNumber *)meal_count
                      note_for_kitchen:(NSString *)note
                                  meal: (MHSMeal *)meal
                                 order: (MHSOrder *)order
                            mainCourse: (NSString *) mainCourse
                               context:(NSManagedObjectContext *) context{
    
    MHSMealOrder *nmo = [NSEntityDescription insertNewObjectForEntityForName:[MHSMealOrder entityName]
                                                inManagedObjectContext:context];
    
    nmo.meal_count = meal_count;
    nmo.note_for_kitchen = note;
    nmo.meal = meal;
    nmo.order = order;
    nmo.mainCourse = mainCourse;

    
    return nmo;
}

@end
