// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSOrder.m instead.

#import "_MHSOrder.h"

const struct MHSOrderAttributes MHSOrderAttributes = {
	.bill = @"bill",
	.main = @"main",
	.other = @"other",
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
	if ([key isEqualToString:@"mainValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"main"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"otherValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"other"];
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

@dynamic main;

- (int16_t)mainValue {
	NSNumber *result = [self main];
	return [result shortValue];
}

- (void)setMainValue:(int16_t)value_ {
	[self setMain:@(value_)];
}

- (int16_t)primitiveMainValue {
	NSNumber *result = [self primitiveMain];
	return [result shortValue];
}

- (void)setPrimitiveMainValue:(int16_t)value_ {
	[self setPrimitiveMain:@(value_)];
}

@dynamic other;

- (int16_t)otherValue {
	NSNumber *result = [self other];
	return [result shortValue];
}

- (void)setOtherValue:(int16_t)value_ {
	[self setOther:@(value_)];
}

- (int16_t)primitiveOtherValue {
	NSNumber *result = [self primitiveOther];
	return [result shortValue];
}

- (void)setPrimitiveOtherValue:(int16_t)value_ {
	[self setPrimitiveOther:@(value_)];
}

@dynamic mealOrders;

- (NSMutableSet*)mealOrdersSet {
	[self willAccessValueForKey:@"mealOrders"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"mealOrders"];

	[self didAccessValueForKey:@"mealOrders"];
	return result;
}

@end

