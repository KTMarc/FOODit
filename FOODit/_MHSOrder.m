// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSOrder.m instead.

#import "_MHSOrder.h"

const struct MHSOrderAttributes MHSOrderAttributes = {
	.bill = @"bill",
};

const struct MHSOrderRelationships MHSOrderRelationships = {
	.mealOrders = @"mealOrders",
};

@implementation MHSOrderID
@end

@implementation _MHSOrder

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Order";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Order" inManagedObjectContext:moc_];
}

- (MHSOrderID*)objectID {
	return (MHSOrderID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"billValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"bill"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic bill;

- (float)billValue {
	NSNumber *result = [self bill];
	return [result floatValue];
}

- (void)setBillValue:(float)value_ {
	[self setBill:@(value_)];
}

- (float)primitiveBillValue {
	NSNumber *result = [self primitiveBill];
	return [result floatValue];
}

- (void)setPrimitiveBillValue:(float)value_ {
	[self setPrimitiveBill:@(value_)];
}

@dynamic mealOrders;

- (NSMutableSet*)mealOrdersSet {
	[self willAccessValueForKey:@"mealOrders"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mealOrders"];

	[self didAccessValueForKey:@"mealOrders"];
	return result;
}

@end

