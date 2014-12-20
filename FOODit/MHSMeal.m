#import "MHSMeal.h"

@interface MHSMeal ()

// Private interface goes here.

@end

@implementation MHSMeal

//This is not needed yet...no KVO configured
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

+(instancetype) mealWithDictionary:(NSDictionary *)mealDict
                           context:(NSManagedObjectContext *) context{
    
    MHSMeal *nm = [NSEntityDescription insertNewObjectForEntityForName:[MHSMeal entityName]
                                                inManagedObjectContext:context];
    
    nm.name = [mealDict valueForKey:@"name"];
    nm.desc = [mealDict valueForKey:@"description"];
    nm.primaryImageUrl = [mealDict valueForKey:@"primaryImageURL"];
    nm.price = [NSNumber numberWithFloat:[[mealDict valueForKey:@"price"] floatValue]];
    nm.mealID = [mealDict valueForKey:@"id"];
    
    return nm;
}


-(UIImage *) imageDb {
    return [self.photo image];
}


@end
