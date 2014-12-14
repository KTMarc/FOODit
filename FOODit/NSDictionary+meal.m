//
//  NSDictionary+meal.m
//  FOODit
//
//  Created by Marc Humet on 12/12/14.
//
//

#import "NSDictionary+meal.h"

@implementation NSDictionary (meal)


- (NSString *)mealID
{
    NSArray *ar = self[@"id"];
    NSDictionary *dict = ar[0];
    return dict[@"value"];
}

- (NSString *)name
{
    NSArray *ar = self[@"name"];
    NSDictionary *dict = ar[0];
    return dict[@"value"];
}
- (NSString *)desc
{
    NSArray *ar = self[@"description"];
    NSDictionary *dict = ar[0];
    return dict[@"value"];
}

- (NSNumber *)price
{
    NSString *cc = self[@"price"];
    NSNumber *n = @([cc floatValue]);
    return n;
}


- (NSString *)primaryImageUrl
{
    NSArray *ar = self[@"primaryImageUrl"];
    NSDictionary *dict = ar[0];
    return dict[@"value"];
}


@end