// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSTag.m instead.

#import "_MHSTag.h"

const struct MHSTagAttributes MHSTagAttributes = {
	.name = @"name",
	.type = @"type",
};

const struct MHSTagRelationships MHSTagRelationships = {
	.meals = @"meals",
};

@implementation MHSTagID
@end

@implementation _MHSTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Tag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Tag" inManagedObjectContext:moc_];
}

- (MHSTagID*)objectID {
	return (MHSTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic type;

@dynamic meals;

- (NSMutableSet*)mealsSet {
	[self willAccessValueForKey:@"meals"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"meals"];

	[self didAccessValueForKey:@"meals"];
	return result;
}

@end

