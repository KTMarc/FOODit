// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSMeal.m instead.

#import "_MHSMeal.h"

const struct MHSMealAttributes MHSMealAttributes = {
	.desc = @"desc",
	.mainCourse = @"mainCourse",
	.mealID = @"mealID",
	.name = @"name",
	.price = @"price",
	.primaryImageUrl = @"primaryImageUrl",
};

const struct MHSMealRelationships MHSMealRelationships = {
	.mealOrders = @"mealOrders",
	.photo = @"photo",
	.tags = @"tags",
};

@implementation MHSMealID
@end

@implementation _MHSMeal

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Meal" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Meal";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Meal" inManagedObjectContext:moc_];
}

- (MHSMealID*)objectID {
	return (MHSMealID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"mainCourseValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"mainCourse"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic desc;

@dynamic mainCourse;

- (BOOL)mainCourseValue {
	NSNumber *result = [self mainCourse];
	return [result boolValue];
}

- (void)setMainCourseValue:(BOOL)value_ {
	[self setMainCourse:@(value_)];
}

- (BOOL)primitiveMainCourseValue {
	NSNumber *result = [self primitiveMainCourse];
	return [result boolValue];
}

- (void)setPrimitiveMainCourseValue:(BOOL)value_ {
	[self setPrimitiveMainCourse:@(value_)];
}

@dynamic mealID;

@dynamic name;

@dynamic price;

- (float)priceValue {
	NSNumber *result = [self price];
	return [result floatValue];
}

- (void)setPriceValue:(float)value_ {
	[self setPrice:@(value_)];
}

- (float)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result floatValue];
}

- (void)setPrimitivePriceValue:(float)value_ {
	[self setPrimitivePrice:@(value_)];
}

@dynamic primaryImageUrl;

@dynamic mealOrders;

- (NSMutableSet*)mealOrdersSet {
	[self willAccessValueForKey:@"mealOrders"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mealOrders"];

	[self didAccessValueForKey:@"mealOrders"];
	return result;
}

@dynamic photo;

@dynamic tags;

- (NSMutableSet*)tagsSet {
	[self willAccessValueForKey:@"tags"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tags"];

	[self didAccessValueForKey:@"tags"];
	return result;
}

@end

