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

static NSString * const BaseURLString = @"http://localhost:8888/";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // Create the Core Data stack
    self.model = [MHSSimpleCoreDataStack coreDataStackWithModelName:@"Model"];
   // [self autoSave];
    
    //[self loadLocalData];
    
    [self loadRemoteData];
    
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
    
    NSLog(@"Bye...");
}


#pragma mark - Utils


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

-(void)loadRemoteData {
    //AFNetworking
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    NSString *string = [NSString stringWithFormat:@"%@menu.json", BaseURLString];
    
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        self.dict = (NSDictionary *)responseObject;
    //    NSLog(@"Contents of Dictionary: %@", _dict);
    //    NSLog(@"Keys inside the resulting dictionary: %@", [_dict allKeys]);
    //    NSLog(@"Count: %lu", (unsigned long)[_dict count]);
        
        //       self.title = @"JSON Retrieved";
        //       [self.tableView reloadData];
        //       NSLog(@"responseObject is a fucking %@", [_dict class]);

//        NSArray *dictio = [_dict objectForKey:@"meals"];
    //    NSLog(@"Objectforkey \"meals\" is a: %@", [[_dict objectForKey:@"meals"] class]);
//        NSLog(@"Objectforkey \"meals\" fist position:%@", [[_dict objectForKey:@"meals"] objectAtIndex:0]);
        
  //      NSLog(@"Objectforkey \"meals\" fist position class is:%@", [[[_dict objectForKey:@"meals"] objectAtIndex:0] class]);
        
//        NSDictionary *dict2 = [[_dict objectForKey:@"meals"] objectAtIndex:1];
         NSArray *arrayDicts = [_dict objectForKey:@"meals"];
        NSArray *arrayTags;
        
        for (NSDictionary *dictPointer in arrayDicts){
            [MHSMeal mealWithDictionary:dictPointer context:self.model.context];

            arrayTags = [dictPointer valueForKey:@"tags"];
            NSLog(@"Meal:%@", [dictPointer valueForKey:@"name"]);
            
            for (NSString *tagPointer in arrayTags){
                 NSLog(@"     Tag in array:%@", tagPointer);
                
                [MHSTag tagWithString: tagPointer context:self.model.context];
                //Link the tag with that meal in Core Data
                
            }
        }
        
//        NSLog(@"Dictionary in position 1 has this inside %@", dict2);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    }];
    
    [operation start];
    
    
//    NSURL *urlImage = [NSURL URLWithString:@"http://lh5.ggpht.com/KioRENoZdDzKH-EJfQHtsjlSd3MfZT7v0j9XcmGs7l1SgB-_ybCu2m7hrH888n0s-MEFXdSOhzbaW6IWBwe5X5w"];
//    NSURLRequest *requestImage = [NSURLRequest requestWithURL:urlImage];
//    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.jpg"];
//    
//    __weak UITableViewCell *weakCell = cell;
//
//    
//    UIImage *image1 =  [UIImage imageNamed:@"unnamed.jpg"];
//    
//    [cell.imageView setImageWithURLRequest:request
//                          placeholderImage:placeholderImage
//                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image1) {
//                                       
////                                       weakCell.imageView.image = image;
//  //                                     [weakCell setNeedsLayout];
//
//                                       MHSPhoto *photo = [MHSPhoto photoWithImage:image1 context:self.model.context];
//                                       
//                                       [mealOne setPhoto:photo];
//                                       
//                                   } failure:nil];
//    
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
    
    //Create the only Order this application will support. But It is prepared to receive more orders in the future if they are needed. That way the user can see his last orders.
    
    _order = [MHSOrder orderWithcontext:self.model.context];
    
    //NSLog(@"MHSOrder: %@", myOnlyLonelyOrder);
    
    
    /*
     //List of meals
     NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSMeal entityName]];
     req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSMealAttributes.mealID
     ascending:NO]];
     
     
     //List of tags for a specific Meal mealID = @"cad2d2e8b16eb668f47b4f2827438951"
     
     
     req = [NSFetchRequest fetchRequestWithEntityName:[MHSTag entityName]];
     req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSTagAttributes.type
     
     [MHSMealRelationships ]
     ascending:NO]];
     
     req.predicate = [NSPredicate predicateWithFormat:@"ANY meal = %@",[......];
     */
    
    //All tags for each meal
//    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSMeal entityName]];
//    /*req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSMealAttributes.mealID
//     ascending:NO]];
//     */
//    NSError *error = nil;
//    NSArray *results = [self.model.context executeFetchRequest:req
//                                                         error:&error];
//
//    if (results == nil) {
//        NSLog(@"Error fetching: %@", results);
//    }else{
//        //    NSLog(@"Results: %@", results);
//        
//        for (MHSMeal* meal in results) {
//            NSLog(@"%@:%@", [meal valueForKeyPath:@"tags.tagType"], [meal valueForKeyPath:@"tags.name"]);
//        }
//    }
}



@end
