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

   // self.title = @"Orders";
    
    //Access the model we created in the app delegate
    AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
    _order = myAppDelegate.order;
    
    //list of MealOrders
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSMealOrder entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey: MHSMealOrderAttributes.mainCourse
                                                          ascending:YES]];

    NSFetchedResultsController *results = [[NSFetchedResultsController alloc] initWithFetchRequest:req
                                                                              managedObjectContext:myAppDelegate.model.context
                                                                                sectionNameKeyPath: MHSMealOrderAttributes.mainCourse
                                                                                         cacheName:nil];
    self.fetchedResultsController = results;
    [self updateBill];
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

#pragma mark - Actions

- (void)decreaseMeal:(id)sender
{
    //Get the superview from this button which will be our cell
     UITableViewCell *clickedCell = (UITableViewCell *)[[sender superview] superview];
    //From the cell get its index path.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:clickedCell];
    MHSMealOrder *mo = [self.fetchedResultsController objectAtIndexPath:indexPath];

    mo.meal_count = @(mo.meal_count.longLongValue - 1);
    if ([mo.meal_count intValue] == 0) {
       [self.fetchedResultsController.managedObjectContext deleteObject:mo];
    }

    [self updateBill];
}

- (void)increaseMeal:(id)sender
{
    //Get the superview from this button which will be our cell
    UITableViewCell *clickedCell = (UITableViewCell *)[[sender superview] superview];
    //From the cell get its index path.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:clickedCell];
    MHSMealOrder *mo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    mo.meal_count = @(mo.meal_count.longLongValue + 1);
    [self updateBill];
    
}

-(void) updateBill {

    _order.bill = @0.0;
    _order.main = @0.0;
    _order.other = @0.0;
    NSArray *results = [self.fetchedResultsController fetchedObjects];
  
    if (results == nil) {
        NSLog(@"Error fetching: %@", results);
    }else{
        for (MHSMealOrder *mo in results) {
            _order.bill = @((_order.bill.floatValue +  (mo.meal_count.intValue) * (mo.meal.price.floatValue)));
            if ([mo.meal.mainCourse isEqualToString:@"main"]){ //Update data consumed by MHSorderStatusBarViewController
                _order.main = @(_order.main.longLongValue + 1);
            }else{
                _order.other = @(_order.main.longLongValue + 1);
            }
        }
        _totalPriceLabel.text= [NSString stringWithFormat: @"£%@",_order.bill];
    }
}


#pragma mark - Data Source


-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MHSMealOrder *mo = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
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
              action:@selector(increaseMeal:)
    forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *minus = (UIButton *) [cell viewWithTag:15];
    [minus addTarget:self
              action:@selector(decreaseMeal:)
    forControlEvents:UIControlEventTouchUpInside];
    [self updateBill];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *titleName = [[[self.fetchedResultsController sections] objectAtIndex:section] name];

    if ([[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects] > 1){
        titleName = [titleName stringByAppendingString: @"s" ];
    }
    
    return   titleName = [titleName capitalizedString];
}


//-(void) tableView:(UITableView *)tableView
//commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
//forRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        MHSMealOrder *del = [self.fetchedResultsController objectAtIndexPath:indexPath];
//        [self.fetchedResultsController.managedObjectContext deleteObject:del];
//    }
//}


- (CGFloat)tableView:(UITableView *)tableView
estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 43;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 43;
}

#pragma mark - Delegate


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


