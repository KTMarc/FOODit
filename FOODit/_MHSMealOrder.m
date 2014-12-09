// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSMealOrder.m instead.

#import "_MHSMealOrder.h"

const struct MHSMealOrderAttributes MHSMealOrderAttributes = {
	.meal_count = @"meal_count",
	.note_for_kitchen = @"note_for_kitchen",
};

const struct MHSMealOrderRelationships MHSMealOrderRelationships = {
	.meal = @"meal",
	.order = @"order",
};

@implementation MHSMealOrderID
@end

@implementation _MHSMealOrder

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MealOrder" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MealOrder";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MealOrder" inManagedObjectContext:moc_];
}

- (MHSMealOrderID*)objectID {
	return (MHSMealOrderID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"meal_countValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"meal_count"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic meal_count;

- (int16_t)meal_countValue {
	NSNumber *result = [self meal_count];
	return [result shortValue];
}

- (void)setMeal_countValue:(int16_t)value_ {
	[self setMeal_count:@(value_)];
}

- (int16_t)primitiveMeal_countValue {
	NSNumber *result = [self primitiveMeal_count];
	return [result shortValue];
}

- (void)setPrimitiveMeal_countValue:(int16_t)value_ {
	[self setPrimitiveMeal_count:@(value_)];
}

@dynamic note_for_kitchen;

@dynamic meal;

@dynamic order;

@end

