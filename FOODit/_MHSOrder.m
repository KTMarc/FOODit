// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSOrder.m instead.

#import "_MHSOrder.h"

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

	return keyPaths;
}

@dynamic mealOrders;

- (NSMutableSet*)mealOrdersSet {
	[self willAccessValueForKey:@"mealOrders"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mealOrders"];

	[self didAccessValueForKey:@"mealOrders"];
	return result;
}

@end

