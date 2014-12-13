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
//    [self.tableView reloadData];
    
   
    self.title = @"Orders";
    
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
    
    //Add the meal to MealsOrders
    
    //Update the Order Basket and show its view controller
    
    
}

#pragma mark - Data Source

-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MHSMeal *del = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.fetchedResultsController.managedObjectContext deleteObject:del];
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar el notebook
    MHSMeal *nm = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    // Crear una celda
    static NSString *cellId = @"orderCell";
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


