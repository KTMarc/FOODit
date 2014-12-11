// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSMeal.h instead.

@import CoreData;

extern const struct MHSMealAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *mealID;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *primaryImageUrl;
} MHSMealAttributes;

extern const struct MHSMealRelationships {
	__unsafe_unretained NSString *mealOrders;
	__unsafe_unretained NSString *photo;
	__unsafe_unretained NSString *tags;
} MHSMealRelationships;

@class MHSMealOrder;
@class MHSPhoto;
@class MHSTag;

@interface MHSMealID : NSManagedObjectID {}
@end

@interface _MHSMeal : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MHSMealID* objectID;

@property (nonatomic, strong) NSString* desc;

//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* mealID;

//- (BOOL)validateMealID:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* price;

@property (atomic) float priceValue;
- (float)priceValue;
- (void)setPriceValue:(float)value_;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* primaryImageUrl;

//- (BOOL)validatePrimaryImageUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *mealOrders;

- (NSMutableSet*)mealOrdersSet;

@property (nonatomic, strong) MHSPhoto *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;

@end

@interface _MHSMeal (MealOrdersCoreDataGeneratedAccessors)
- (void)addMealOrders:(NSSet*)value_;
- (void)removeMealOrders:(NSSet*)value_;
- (void)addMealOrdersObject:(MHSMealOrder*)value_;
- (void)removeMealOrdersObject:(MHSMealOrder*)value_;

@end

@interface _MHSMeal (TagsCoreDataGeneratedAccessors)
- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(MHSTag*)value_;
- (void)removeTagsObject:(MHSTag*)value_;

@end

@interface _MHSMeal (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;

- (NSData*)primitiveImage;
- (void)setPrimitiveImage:(NSData*)value;

- (NSString*)primitiveMealID;
- (void)setPrimitiveMealID:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSNumber*)value;

- (float)primitivePriceValue;
- (void)setPrimitivePriceValue:(float)value_;

- (NSString*)primitivePrimaryImageUrl;
- (void)setPrimitivePrimaryImageUrl:(NSString*)value;

- (NSMutableSet*)primitiveMealOrders;
- (void)setPrimitiveMealOrders:(NSMutableSet*)value;

- (MHSPhoto*)primitivePhoto;
- (void)setPrimitivePhoto:(MHSPhoto*)value;

- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;

@end
