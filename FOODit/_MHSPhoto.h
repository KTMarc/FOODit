// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSPhoto.h instead.

@import CoreData;

extern const struct MHSPhotoAttributes {
	__unsafe_unretained NSString *imageData;
} MHSPhotoAttributes;

extern const struct MHSPhotoRelationships {
	__unsafe_unretained NSString *meal;
} MHSPhotoRelationships;

@class MHSMeal;

@interface MHSPhotoID : NSManagedObjectID {}
@end

@interface _MHSPhoto : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MHSPhotoID* objectID;

@property (nonatomic, strong) NSData* imageData;

//- (BOOL)validateImageData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) MHSMeal *meal;

//- (BOOL)validateMeal:(id*)value_ error:(NSError**)error_;

@end

@interface _MHSPhoto (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitiveImageData;
- (void)setPrimitiveImageData:(NSData*)value;

- (MHSMeal*)primitiveMeal;
- (void)setPrimitiveMeal:(MHSMeal*)value;

@end
