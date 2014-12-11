// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSPhoto.m instead.

#import "_MHSPhoto.h"

const struct MHSPhotoAttributes MHSPhotoAttributes = {
	.imageData = @"imageData",
};

const struct MHSPhotoRelationships MHSPhotoRelationships = {
	.meal = @"meal",
};

@implementation MHSPhotoID
@end

@implementation _MHSPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (MHSPhotoID*)objectID {
	return (MHSPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic imageData;

@dynamic meal;

@end

