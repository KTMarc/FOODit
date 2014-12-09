// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSOrder.h instead.

@import CoreData;

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

- (NSMutableSet*)primitiveMealOrders;
- (void)setPrimitiveMealOrders:(NSMutableSet*)value;

@end
