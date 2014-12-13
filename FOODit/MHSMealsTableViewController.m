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
    _model = myAppDelegate.model;
    
    _order = myAppDelegate.order;
    
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
    
    
   
   //check if the user selected the whole cell or just the button. 
    
    // Get the meal
    MHSMeal *currentMeal = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    //Add the meal to MealsOrders
    [MHSMealOrder mealOrderWithMealCount:@1 note_for_kitchen:@"No Chilli!" meal:currentMeal order:_order context:self.model.context];
    
    _order.bill = [NSNumber numberWithFloat: ([_order.bill floatValue] + [currentMeal.price floatValue])];
    
    //NSLog(@"Current bill: %@", _order.bill);
    
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


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
