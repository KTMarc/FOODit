//
//  NSDictionary+meal.h
//  FOODit
//
//  Created by Marc Humet on 12/12/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (meal)

- (NSString *)mealID;
- (NSString *)name;
- (NSString *)desc;
- (NSNumber *)price;
- (NSString *)primaryImageUrl;
//- (NSArray) *)tags;


@end