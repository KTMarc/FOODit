// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSMealOrder.h instead.

@import CoreData;

extern const struct MHSMealOrderAttributes {
	__unsafe_unretained NSString *mainCourse;
	__unsafe_unretained NSString *meal_count;
	__unsafe_unretained NSString *note_for_kitchen;
} MHSMealOrderAttributes;

extern const struct MHSMealOrderRelationships {
	__unsafe_unretained NSString *meal;
	__unsafe_unretained NSString *order;
} MHSMealOrderRelationships;

@class MHSMeal;
@class MHSOrder;

@interface MHSMealOrderID : NSManagedObjectID {}
@end

@interface _MHSMealOrder : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MHSMealOrderID* objectID;

@property (nonatomic, strong) NSString* mainCourse;

//- (BOOL)validateMainCourse:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* meal_count;

@property (atomic) int16_t meal_countValue;
- (int16_t)meal_countValue;
- (void)setMeal_countValue:(int16_t)value_;

//- (BOOL)validateMeal_count:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* note_for_kitchen;

//- (BOOL)validateNote_for_kitchen:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) MHSMeal *meal;

//- (BOOL)validateMeal:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) MHSOrder *order;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;

@end

@interface _MHSMealOrder (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveMainCourse;
- (void)setPrimitiveMainCourse:(NSString*)value;

- (NSNumber*)primitiveMeal_count;
- (void)setPrimitiveMeal_count:(NSNumber*)value;

- (int16_t)primitiveMeal_countValue;
- (void)setPrimitiveMeal_countValue:(int16_t)value_;

- (NSString*)primitiveNote_for_kitchen;
- (void)setPrimitiveNote_for_kitchen:(NSString*)value;

- (MHSMeal*)primitiveMeal;
- (void)setPrimitiveMeal:(MHSMeal*)value;

- (MHSOrder*)primitiveOrder;
- (void)setPrimitiveOrder:(MHSOrder*)value;

@end
