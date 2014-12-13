//
//  TableViewController.m
//  FOODit
//
//  Created by Marc Humet on 30/11/14.
//
//

#import "MHSMealsTableViewController.h"
#import "MHSMeal.h"
#import "MHSMealOrder.h"
#import "AppDelegate.h"


@interface MHSMealsTableViewController ()

@end

@implementation MHSMealsTableViewController

#pragma mark - View Lifecycle

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    /* CORE DATA DB FILE LOCATION
    NSString * NSTemporaryDirectory ( void );
    NSLog(@"FILE PATH :%@", NSTemporaryDirectory());
     */
    
    self.title = @"Meals";
   
    //We access the model we created in the app delegate
    AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSMeal entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSMealAttributes.name
                                                          ascending:NO]];
    
    NSFetchedResultsController *results = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:myAppDelegate.model.context
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil];
    self.fetchedResultsController = results;
  
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

#pragma mark - Actions


#pragma mark - Delegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    // Get the meal
    
    //MHSMeal *meal = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
   // MHSMealOrder *mealOrder =[MHSMealOrder mealOrderWithMealCount:@1 note_for_kitchen:@"No Chilli!" meal:(nm) order: context: [self.fetchedResultsController context]];
    
    
    //Add the meal to MealsOrders
    
    
    //Update the Order Basket and show its view controller
    
}


#pragma mark - Data Source

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Get the meal
    MHSMeal *nm = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
    // Crear una celda
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    UILabel *nameLabel = (UILabel*) [cell viewWithTag:10];
    nameLabel.text = nm.name;
    
    UILabel *descLabel = (UILabel*) [cell viewWithTag:11];
    descLabel.text = nm.desc;
  
    UILabel *priceLabel = (UILabel*) [cell viewWithTag:12];
    priceLabel.text = [NSString stringWithFormat: @"£"];
    priceLabel.text = [priceLabel.text stringByAppendingString:[nm.price stringValue]];
       
    UIImageView *mealImageView = (UIImageView*)[cell viewWithTag:13];
    mealImageView.image = [nm imageDb];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 350;
}

@end
