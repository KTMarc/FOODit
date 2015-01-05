// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSOrder.h instead.

@import CoreData;

extern const struct MHSOrderAttributes {
	__unsafe_unretained NSString *bill;
	__unsafe_unretained NSString *main;
	__unsafe_unretained NSString *other;
} MHSOrderAttributes;

extern const struct MHSOrderRelationships {
	__unsafe_unretained NSString *mealOrders;
} MHSOrderRelationships;

@class MHSMealOrder;

@interface MHSOrderID : NSManagedObjectID {}
@end

@interface _MHSOrder : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MHSOrderID* objectID;

@property (nonatomic, strong) NSNumber* bill;

@property (atomic) float billValue;
- (float)billValue;
- (void)setBillValue:(float)value_;

//- (BOOL)validateBill:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* main;

@property (atomic) int16_t mainValue;
- (int16_t)mainValue;
- (void)setMainValue:(int16_t)value_;

//- (BOOL)validateMain:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* other;

@property (atomic) int16_t otherValue;
- (int16_t)otherValue;
- (void)setOtherValue:(int16_t)value_;

//- (BOOL)validateOther:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *mealOrders;

- (NSMutableSet*)mealOrdersSet;

@end

@interface _MHSOrder (MealOrdersCoreDataGeneratedAccessors)
- (void)addMealOrders:(NSSet*)value_;
- (void)removeMealOrders:(NSSet*)value_;
- (void)addMealOrdersObject:(MHSMealOrder*)value_;
- (void)removeMealOrdersObject:(MHSMealOrder*)value_;

@end

@interface _MHSOrder (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveBill;
- (void)setPrimitiveBill:(NSNumber*)value;

- (float)primitiveBillValue;
- (void)setPrimitiveBillValue:(float)value_;

- (NSNumber*)primitiveMain;
- (void)setPrimitiveMain:(NSNumber*)value;

- (int16_t)primitiveMainValue;
- (void)setPrimitiveMainValue:(int16_t)value_;

- (NSNumber*)primitiveOther;
- (void)setPrimitiveOther:(NSNumber*)value;

- (int16_t)primitiveOtherValue;
- (void)setPrimitiveOtherValue:(int16_t)value_;

- (NSMutableSet*)primitiveMealOrders;
- (void)setPrimitiveMealOrders:(NSMutableSet*)value;

@end
