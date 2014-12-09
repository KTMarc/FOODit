//
//  SPMSimpleCoreDataStack.h
//  FOODit
//
//  Created by Marc Humet on 9/12/14.
//
//

@import CoreData;

#import <Foundation/Foundation.h>

@interface MHSSimpleCoreDataStack : NSObject

@property (strong, nonatomic, readonly) NSManagedObjectContext *context;

+ (NSString *)persistentStoreCoordinatorErrorNotificationName;

+ (instancetype)coreDataStackWithModelName:(NSString *)aModelName
                          databaseFilename:(NSString *)aDBName;

+ (instancetype)coreDataStackWithModelName:(NSString *)aModelName;

+ (instancetype)coreDataStackWithModelName:(NSString *)aModelName
                               databaseURL:(NSURL *)aDBURL;

- (id)initWithModelName:(NSString *)aModelName databaseURL:(NSURL *)aDBURL;

- (void)zapAllData;

- (void)saveWithErrorBlock:(void(^)(NSError *error))errorBlock;
-(NSArray *)executeRequest:(NSFetchRequest *)request
                 withError:(void(^)(NSError *error))errorBlock;
@end

