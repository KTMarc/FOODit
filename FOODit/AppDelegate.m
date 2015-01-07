//
//  AppDelegate.m
//  FOODit
//
//  Created by Marc Humet on 30/11/14.
//
//

#import "AppDelegate.h"
#import "settings.h"
#import "MHSMeal.h"
#import "MHSMealOrder.h"
#import "MHSTag.h"
#import "MHSSimpleCoreDataStack.h"
#import "MHSMealsTableViewController.h"
#import "MHSPhoto.h"
#import "MHSOrder.h"
#import "AFNetworking.h"
#import "NSDictionary+meal.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "UIImageView+AFNetworking.h"
#import "MZFormSheetController.h"


//static NSString * const BaseURLString = @"http://localhost:8888/";
static NSString * const BaseURLString = @"http://www.humet.es/";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    BOOL logs=NO;
    // Create the Core Data stack
    self.model = [MHSSimpleCoreDataStack coreDataStackWithModelName:@"Model"];
   
    //Data was already downloaded?
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *hasData = [defaults objectForKey:@"hasData"];
    
    if ([hasData isEqualToString:@"yes"]){
        //Create the only Order this application will support. But It is prepared to receive more orders in the future
        //if they are needed. That way the user can see his last orders.
        if (logs){NSLog(@"Data was already there");}
            NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSOrder entityName]];
            NSError *error = nil;
            NSArray *results = [self.model.context executeFetchRequest:req
                                                                 error:&error];
            if (results == nil) {
                NSLog(@"Error fetching: %@", results);
            }else{
                //Not valid for future support for more than one order
                if (logs){NSLog(@"[results count]: %lu",(unsigned long)[results count]);}
                if ([results count]>0){
                    _order = results[0];
                   if (logs){ NSLog(@"LAst time Bill was: %@", _order.bill);}
                }
            }
    }else{
        if (logs){NSLog(@"We don't have any data, we load everything from the network");}
        [self loadRemoteData];
        //[self loadLocalData];
        //Create the Order record
        _order = [MHSOrder orderWithcontext:self.model.context];

    }

    [self autoSave];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    // [self save];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self save];
    //[self.model zapAllData];
    
    NSLog(@"Bye...");
}


#pragma mark - CORE DATA Utils


-(void)save{
    
    [self.model saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error saving %s \n\n %@", __func__, error);
    }];
}

-(void)autoSave{
    
    if (AUTO_SAVE) {
        NSLog(@"Autosaving....");
        
        [self save];
        [self performSelector:@selector(autoSave)
                   withObject:nil
                   afterDelay:AUTO_SAVE_DELAY_IN_SECONDS];
    }
}

#pragma mark - PARSING

-(void)loadRemoteData {
    //AFNetworking
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    NSString *string = [NSString stringWithFormat:@"%@menu.json", BaseURLString];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self parseResponseWith:operation withResponse:responseObject];
      
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    }];
    
    [operation start];
    
    //Set the flag for loaded Data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"yes" forKey:@"hasData"];
    [defaults synchronize];
    
}


-(void) parseResponseWith:(AFHTTPRequestOperation *)operation
             withResponse:(id) responseObject{
    
    self.dict = (NSDictionary *)responseObject;
    
    NSArray *arrayDicts = [_dict objectForKey:@"meals"];
    NSArray *arrayTags;
    MHSMeal *actualMeal;
    BOOL logs = NO;
    BOOL isMainCourse = NO;
    
    
    for (NSDictionary *dictPointer in arrayDicts){
        actualMeal = [MHSMeal mealWithDictionary:dictPointer context:self.model.context];
        if (logs){NSLog(@"        Actual Meal:%@", [dictPointer valueForKey:@"name"]);}
        arrayTags = [dictPointer valueForKey:@"tags"];
        //NSLog(@"Array of Tags %@", arrayTags);
        
        isMainCourse = [self tagProcessWith:arrayTags fromMeal:actualMeal logs:logs];
        if (isMainCourse){
            if (logs){NSLog(@"We have a main");}
            [actualMeal setMainCourse:@"main"];
        }else{
            if (logs){NSLog(@"We have an other");}
            [actualMeal setMainCourse:@"other"];
        }
    } //meals iteration
    
}


-(BOOL) tagProcessWith:(NSArray *)arrayTags
              fromMeal: (MHSMeal *)actualMeal
                  logs:(BOOL) logs{

    NSMutableArray *sortedArrayTags = [[NSMutableArray alloc]init];
    NSArray *aux;
    NSError *error = nil;
    MHSTag *newTag;
    BOOL isMainCourse = NO;

    /* ---------------------TAG PROCESSING---------------------*/
    for (NSString *tagPointer in arrayTags){
        if ([tagPointer hasPrefix:@"#"]){
            aux = [[tagPointer substringFromIndex:1] componentsSeparatedByString: @":"];
            [sortedArrayTags addObject: aux[1]];
            if ([tagPointer containsString:@"main"]) {
              //  NSLog(@"it is a Main Course");
                isMainCourse=YES;
            }
            //NSLog(@"Type = %@", aux[0]);
            //NSLog(@"Name = %@", aux[1]);

        } else{
            [sortedArrayTags addObject: tagPointer];
            //NSLog(@"Name = %@", [sortedArrayTags lastObject]);
        }
    }
    
    //Implementing Find-or-Create Efficiently (Apple Documentation)
    //https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CoreData/Articles/cdImporting.html
    
    // NSLog(@"Sorted Array using selector compare %@",[sortedArrayTags sortedArrayUsingSelector:@selector(compare:)]);
    
    // Create the fetch request to get all Tags matching the actual Meal Tags
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSTag entityName]];
    [req setPredicate: [NSPredicate predicateWithFormat:@"(name IN %@)", [sortedArrayTags sortedArrayUsingSelector:@selector(compare:)]]];
    
    // make sure the results are sorted as well
    [req setSortDescriptors:
     @[[[NSSortDescriptor alloc] initWithKey: @"name" ascending:YES]]];
    
    //Finally, excute the fetch
    NSArray *tagsMatchingNames = [self.model.context executeFetchRequest:req
                                                                   error:&error];
    
    if (tagsMatchingNames == nil) {
        if (logs){NSLog(@"Error fetching: %@", tagsMatchingNames);}
    }else{
        //You end up with two sorted arrays—one with the employee IDs passed into the fetch request, and one with the managed objects that matched them. To process them, you walk the sorted lists following these steps:
        //Get the next ID and Employee. If the ID doesn't match the Employee ID, create a new Employee for that ID.
        //Get the next Employee: if the IDs match, move to the next ID and Employee.
        //Regardless of how many IDs you pass in, you only execute a single fetch, and the rest is just walking the result set.
        
        BOOL foundIt = false;
        for (NSString *mealTagPointer in sortedArrayTags){
            
            for (MHSTag *matchingTag in tagsMatchingNames){
                
                if ([mealTagPointer isEqualToString: matchingTag.name]){
                    //Tag found. Make relationships between meals and tags
                    [actualMeal addTagsObject:matchingTag];
                    if (logs){NSLog(@"                                 %@ ...Tag found: MAKE LINK", matchingTag.name);}
                    foundIt = true;
                }
                
            } //End of matching tags iteration
            
            if (!foundIt){
                //Tag not found, create and then link to the actual meal
                newTag = [MHSTag tagWithString:mealTagPointer context:self.model.context];
                [actualMeal addTagsObject:newTag];
                if (logs){NSLog(@"%@ ... Tag NOT found, CREATE AND LINK", newTag.name);}
                
            } else {
                foundIt = false;
            }
            
            
        } //End of actual Meal tags iteration
        if (logs){NSLog(@"\n\n");}
    }
    
    [sortedArrayTags removeAllObjects];

    return isMainCourse;
}


-(void)loadLocalData {
    
    //Create a Meal or two
    MHSMeal *mealOne = [MHSMeal mealWithName:@"Seafood risotto"
                                        desc:@"This seafood risotto recipe is infused with a number of fresh herbs, imparting remarkable flavour onto the risotto rice base. With scallops, prawns and mussels to make up the risotto but you can use whatever seafood is available and you like. Served with some cheddar rolls or a small avocado salad for a delicious seafood supper."
                                       price:@9.5
                                      mealID:@"cad2d2e8b16eb668f47b4f2827438951"
                             primaryImageURL:@"http://lh5.ggpht.com/ASTYH5ZbfNpA5MOxUya9MfOXw8910PpbcvkAWeMFbjurfYvbqx1qnfLU091k3UyxGXUYDn_dNOMRsmCIE2ozwRAd"
                                     context:self.model.context];
    
    UIImage *image1 =  [UIImage imageNamed:@"unnamed.jpg"];
    MHSPhoto *photo = [MHSPhoto photoWithImage:image1 context:self.model.context];
    
    [mealOne setPhoto:photo];
    
    
    MHSMeal *mealTwo = [MHSMeal mealWithName:@"Penne bacon, green peas"
                                        desc:@"Caramelized onions lend a slight sweetness to this hearty pasta dish, with Onion, Bacon, and Parmesan"
                                       price:@8.5
                                      mealID:@"6308e806b1233e111081666e82f7aac1"
                             primaryImageURL:@"http://lh4.ggpht.com/xVItGb4gEo_f-q8G0jDTNbguDdS2NzaSz2fqti_a6f3egda7DLbTI0eGqdCgXakqT3TsezDlKDFtdNYWdGJvtw"
                                     context:self.model.context];
    
    image1 =  [UIImage imageNamed:@"unnamed2.jpg"];
    photo = [MHSPhoto photoWithImage:image1 context:self.model.context];
    
    [mealTwo setPhoto:photo];
    
    
    //Create tags
    MHSTag *mainCoursesTag =  [MHSTag tagWithName:@"Main Courses"
                                          tagType:@"course"
                                          context:self.model.context];
    
    
    MHSTag *pescetarianTag =   [MHSTag tagWithName:@"Pescetarian"
                                           tagType:@"Diet"
                                           context:self.model.context];
    
    MHSTag *seafodTag =   [MHSTag tagWithName:@"seafood"
                                      tagType:@""
                                      context:self.model.context];
    
    MHSTag *pastaTag =   [MHSTag tagWithName:@"pasta"
                                     tagType:@""
                                     context:self.model.context];
    
    //Make relationships between meals and tags
    [mealOne addTagsObject:mainCoursesTag];
    [mealOne addTagsObject:pescetarianTag];
    [mealOne addTagsObject:seafodTag];
    
    
    [mealTwo addTagsObject:mainCoursesTag];
    [mealTwo addTagsObject:pastaTag];
    
    
    //Create the only Order this application will support. But It is prepared to receive more orders in the future
    //if they are needed. That way the user can see his last orders.
    
    //_order = [MHSOrder orderWithcontext:self.model.context];
    //NSLog(@"MHSOrder: %@", myOnlyLonelyOrder);
       
    
}



@end
