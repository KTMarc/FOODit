// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MHSTag.h instead.

@import CoreData;

extern const struct MHSTagAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *type;
} MHSTagAttributes;

extern const struct MHSTagRelationships {
	__unsafe_unretained NSString *meals;
} MHSTagRelationships;

@class MHSMeal;

@interface MHSTagID : NSManagedObjectID {}
@end

@interface _MHSTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MHSTagID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *meals;

- (NSMutableSet*)mealsSet;

@end

@interface _MHSTag (MealsCoreDataGeneratedAccessors)
- (void)addMeals:(NSSet*)value_;
- (void)removeMeals:(NSSet*)value_;
- (void)addMealsObject:(MHSMeal*)value_;
- (void)removeMealsObject:(MHSMeal*)value_;

@end

@interface _MHSTag (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveMeals;
- (void)setPrimitiveMeals:(NSMutableSet*)value;

@end
