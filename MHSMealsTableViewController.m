//
//  TableViewController.m
//  FOODit
//
//  Created by Marc Humet on 30/11/14.
//
//

#import "MHSMealsTableViewController.h"
#import "MHSSimpleCoreDataStack.h"
#import "MHSMeal.h"
#import "AppDelegate.h"


@interface MHSMealsTableViewController ()

@end

@implementation MHSMealsTableViewController

#pragma mark - View Lifecycle

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    

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
    
    //We add the meal to MealsOrders
    
    //We update the Order Basket and show its view controller
    
    
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
    MHSMeal *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    // Crear una celda
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellId];
    }
    
    // Sincronizar libreta -> celda
    cell.textLabel.text = nb.name;
    cell.detailTextLabel.text = nb.desc;
  
    // Devolver la celda
    return cell;
}

@end
