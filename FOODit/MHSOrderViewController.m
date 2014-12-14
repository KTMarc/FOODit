//
//  MHSOrderViewController.m
//  FOODit
//
//  Created by Marc Humet on 12/12/14.
//
//

#import "MHSOrderViewController.h"


@interface MHSOrderViewController ()

@end

@implementation MHSOrderViewController

//-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//    
//self = [super initWithNibName: nibNameOrNil bundle:nibBundleOrNil];
//if (self){
//    //Custom init
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    /* CORE DATA DB FILE LOCATION
     NSString * NSTemporaryDirectory ( void );
     NSLog(@"FILE PATH :%@", NSTemporaryDirectory());
     */

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.title = @"Orders";
    
    //We access the model we created in the app delegate
    AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
    _order = myAppDelegate.order;
    _order.bill = @0;
    //list of MealOrders
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSMealOrder entityName]];
    
    
//    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSMealOrderAttributes.note_for_kitchen
//                                                          ascending:NO]];

    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSMealOrderAttributes.note_for_kitchen
                                                          ascending:NO]];
    
    NSFetchedResultsController *results = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:myAppDelegate.model.context
                                                                                sectionNameKeyPath:nil
                                                                                         cacheName:nil];
    self.fetchedResultsController = results;
    
    
    
    /*req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSMealAttributes.mealID
     ascending:NO]];
     */
    
//    NSError *error = nil;
//    NSArray *results = [self.model.context executeFetchRequest:req
//                                                         error:&error];
    
//    if (results == nil) {
//        NSLog(@"Error fetching: %@", results);
//    }else{
//        //    NSLog(@"Results: %@", results);
//        NSNumber *bill = [[NSNumber alloc]initWithFloat:0.0];
//        for (MHSMealOrder* mealOrders in results) {
//            
//           NSLog(@"%@ %@ with the note: %@", mealOrders.meal_count,[mealOrders valueForKeyPath:@"meal.name"], mealOrders.note_for_kitchen);
//            bill = [mealOrders valueForKeyPath:@"order.bill"];
//            
//        }
//        NSLog(@"Total BILL right now:%@", bill);
//        
//    }
    
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

#pragma mark - Actions

- (void)oneLessMeal:(id)sender
{
    //Get the superview from this button which will be our cell
     UITableViewCell *clickedCell = (UITableViewCell *)[[sender superview] superview];
    //From the cell get its index path.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:clickedCell];
    MHSMealOrder *mo = [self.fetchedResultsController objectAtIndexPath:indexPath];

    //NSLog(@"Remove the meal: %@", mo);
  
    if ([mo.meal_count intValue] > 1) {
        mo.meal_count = @(mo.meal_count.longLongValue - 1);
    }else{
     [self.fetchedResultsController.managedObjectContext deleteObject:mo];
    }

    [self updateBill];
}

- (void)oneMoreMeal:(id)sender
{
    //Get the superview from this button which will be our cell
    UITableViewCell *clickedCell = (UITableViewCell *)[[sender superview] superview];
    //From the cell get its index path.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:clickedCell];
    MHSMealOrder *mo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //NSLog(@"Add 1 more meal like %@", mo);
    
    mo.meal_count = @(mo.meal_count.longLongValue + 1);
    [self updateBill];
    
}

-(void) updateBill {
  //  MHSMealOrder *mo = [self.fetchedResultsController objectAtIndexPath:indexPath];

    _order.bill = @0.0;
    [self.tableView reloadData];
    
    //    MHSMeal *meal;
//    _order.bill = @0.0;
//    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSMealOrder entityName]];
//    NSError *error = nil;
//    NSArray *results = [self.model.context executeFetchRequest:req
//                                                    error:&error];
//    NSLog(@"Results: %@", results);
//
//    if (results == nil) {
//        NSLog(@"Error fetching: %@", results);
//    }else{
//        for (MHSMealOrder* mealOrder in results) {
//            meal = mealOrder.meal;
//            _order.bill= @(_order.bill.floatValue + ((meal.price.floatValue) * mealOrder.meal_count.intValue));
//        }
//    }
}

#pragma mark - Delegate



#pragma mark - Data Source

//-(void) tableView:(UITableView *)tableView
//commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        MHSMealOrder *del = [self.fetchedResultsController objectAtIndexPath:indexPath];
//        [self.fetchedResultsController.managedObjectContext deleteObject:del];
//    }
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return [[self.fetchedResultsController sections] count];
    
}



-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    MHSMealOrder *mo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    MHSMeal *meal = mo.meal;
    
    static NSString *cellId = @"orderCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    UILabel *nameLabel = (UILabel*) [cell viewWithTag:10];
    nameLabel.text = [mo valueForKeyPath:@"meal.name"];
    
    UILabel *noteForKitchenLabel = (UILabel*) [cell viewWithTag:11];
    noteForKitchenLabel.text = mo.note_for_kitchen;
    
    UILabel *priceLabel = (UILabel*) [cell viewWithTag:12];
    priceLabel.text = [NSString stringWithFormat: @"£"];
    priceLabel.text = [priceLabel.text stringByAppendingString:[[mo valueForKeyPath:@"meal.price"] stringValue]];
    
    UILabel *mealCountLabel = (UILabel*) [cell viewWithTag:13];
    mealCountLabel.text = [mo.meal_count stringValue];
    
    UIButton *plus = (UIButton *) [cell viewWithTag:14];
    [plus addTarget:self
              action:@selector(oneMoreMeal:)
    forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *minus = (UIButton *) [cell viewWithTag:15];
    [minus addTarget:self
              action:@selector(oneLessMeal:)
    forControlEvents:UIControlEventTouchUpInside];
    
    _order.bill= @(((meal.price.floatValue) * mo.meal_count.intValue) + _order.bill.floatValue);

   // NSLog(@"(meal price: %f *  mealOrder.meal_count: %i) + order.bill: %f)", meal.price.floatValue,mo.meal_count.intValue, _order.bill.floatValue);
    
    _totalPriceLabel.text= [NSString stringWithFormat: @"£%@",_order.bill];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 43;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 43;
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


