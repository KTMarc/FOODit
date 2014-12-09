#import "MHSMeal.h"

@interface MHSMeal ()

// Private interface goes here.

@end

@implementation MHSMeal

// Custom logic goes here.
+(NSArray *)observableKeyNames{
      return @[@"name"];
}

+(instancetype) mealWithName:(NSString *)name
                        desc:(NSString *)desc
                      mealID:(NSString *)mealID
                     context:(NSManagedObjectContext *) context{
    
    MHSMeal *nm = [NSEntityDescription insertNewObjectForEntityForName:[MHSMeal entityName]
                                                    inManagedObjectContext:context];
    
    nm.name = name;
    nm.desc= desc;
    nm.mealID = mealID;

    return nm;
}




@end
