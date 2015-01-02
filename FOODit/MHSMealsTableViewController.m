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
#import "MHSTag.h"
#import "MHSTagDraw.h"
#import "UIImageView+AFNetworking.h"

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
    
    self.title = @"Your Delicious Restaurant";
   
    //We access the model we created in the app delegate
    AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
    _model = myAppDelegate.model;
    _order = myAppDelegate.order;
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[MHSMeal entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:MHSMealAttributes.name
                                                          ascending:YES]];
    
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
    [MHSMealOrder mealOrderWithMealCount:@1 note_for_kitchen:@"No Chilli!" meal:currentMeal order:_order mainCourse: currentMeal.mainCourseValue context:self.model.context];
    
    _order.bill = [NSNumber numberWithFloat: ([_order.bill floatValue] + [currentMeal.price floatValue])];
    
    //NSLog(@"Current bill: %@", _order.bill);
    
}


#pragma mark - Data Source

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Get the meal
    MHSMeal *nm = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
    // Create the cell
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
   
    
    if ([nm imageDb] != nil){ //Reading from CORE DATA

      //  NSLog(@"Image found on CORE DATA");
        mealImageView.image = [nm imageDb];
        
    } else{   //Read remotely async with AFNetworking
    
       // NSLog(@"NO image inside meal. Loading from remote location");
        NSURL *urlImage = [NSURL URLWithString:[nm primaryImageUrl]];
        
        //NSLog(@"URL: %@", [nm primaryImageUrl]);
        
        NSURLRequest *requestImage = [NSURLRequest requestWithURL:urlImage];
        UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.jpg"];
        
        __weak UITableViewCell *weakCell = cell;
     
        [mealImageView setImageWithURLRequest:requestImage placeholderImage:placeholderImage success:nil failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            NSLog(@"Unable to retrieve image");
        }];
        
        /*
        [mealImageView setImageWithURLRequest:requestImage
                             placeholderImage:placeholderImage
                                      success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                          
                                          weakCell.imageView.image = image;
                                          [weakCell setNeedsLayout];
                                          
                                          MHSPhoto *photo = [MHSPhoto photoWithImage:image context:self.model.context];
                                          
                                          [nm setPhoto:photo];
                                      }
                                      failure:nil];
         */
    }
    
    //List of tags
    NSArray *arrayDict = [nm valueForKeyPath:@"tags"];

    NSArray *sortedItems = [arrayDict sortedArrayUsingDescriptors:@[[NSSortDescriptor
                                                                     sortDescriptorWithKey:@"tagType" ascending:YES]]];
    //NSLog(@"Tags from this meal:");
    UILabel *tagsLabel = (UILabel*) [cell viewWithTag:14];
    for (NSDictionary* dict in sortedItems) {
        if (![[dict valueForKey:@"name"] containsString:@"Main"]){
            //NSLog(@"%@",[dict valueForKey:@"name"]);
            tagsLabel.text = [tagsLabel.text stringByAppendingString: [dict valueForKey:@"name"]];
            tagsLabel.text = [tagsLabel.text stringByAppendingString: @" "];
            //TO-DO: Draw all all tags which are not type:course
            
        }
    }
        
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
