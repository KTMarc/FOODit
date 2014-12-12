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
                       price:(NSNumber *)price
                      mealID:(NSString *)mealID
             primaryImageURL:(NSString *)primaryImageURL
                     context:(NSManagedObjectContext *) context{
    
    MHSMeal *nm = [NSEntityDescription insertNewObjectForEntityForName:[MHSMeal entityName]
                                                    inManagedObjectContext:context];
    
    nm.name = name;
    nm.desc = desc;
    nm.primaryImageUrl = primaryImageURL;
    nm.price = price;
    nm.mealID = mealID;

    return nm;
}

-(UIImage *) imageDb {
    return [self.photo image];
}


@end
