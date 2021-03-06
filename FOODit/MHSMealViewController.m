//
//  MHSMealViewController.m
//  FOODit
//
//  Created by Marc Humet on 5/1/15.
//
//

#import "MHSMealViewController.h"
#import "MHSMeal.h"
#import "MHSMealOrder.h"
#import "AppDelegate.h"
#import "MHSTag.h"
#import "MHSTagDraw.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>
#import "PocketSVG.h"

@interface MHSMealViewController ()

@end

@implementation MHSMealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (void)orderMeal:(id)sender
{
    //Get the superview from this button which will be our cell
    UITableViewCell *clickedCell = (UITableViewCell *)[sender superview] ;
    //From the cell get its index path.
    NSIndexPath *indexPath = [self.tableView indexPathForCell:clickedCell];
    //NSLog(@"Indexpath en OrderMeal: %@", indexPath);
    
    // Get the meal
    MHSMeal *currentMeal = [self.fetchedResultsController objectAtIndexPath:indexPath];

    _alertViewMeal = currentMeal;
    
    UIAlertView *alert;
    alert = [[UIAlertView alloc] initWithTitle:@"Adding a meal" message:@"Enter note for the kitchen" delegate:self cancelButtonTitle:@"Done" otherButtonTitles:@"Cancel",nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alert show];

}

#pragma - mark AlertView Delegate Method

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
 
    //NSLog(@"Text: %@", [[alertView textFieldAtIndex:0] text]);
    //Add the meal to MealsOrders with the note
    [MHSMealOrder mealOrderWithMealCount:@1 note_for_kitchen:[[alertView textFieldAtIndex:0] text] meal:_alertViewMeal order:_order mainCourse: _alertViewMeal.mainCourse context:self.model.context];
    
    _order.bill = [NSNumber numberWithFloat: ([_order.bill floatValue] + [_alertViewMeal.price floatValue])];
    
    if ([_alertViewMeal.mainCourse isEqualToString:@"main"]){ //Update data consumed by MHSorderStatusBarViewController
        _order.main = @(_order.main.longLongValue + 1);
    }else{
        _order.other = @(_order.other.longLongValue + 1);
    }
    
}

#pragma mark - Delegate
/*
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //check if the user selected the whole cell or just the button.
}
*/

#pragma mark - Data Source

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BOOL logs = NO;
    
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
        
        NSLog(@"Image found on CORE DATA");
        mealImageView.image = [nm imageDb];
        if (logs) {NSLog(@"[nm imageDb] when reading from Core Data: %@",[nm imageDb]);}
        
    } else {   //Read remotely async with AFNetworking
        
        if (logs) {NSLog(@"[nm imageDb] when loading remotely: %@",[nm imageDb]);}
        if (logs) {NSLog(@"NO image inside meal. Loading from remote location");}
        NSURL *urlImage = [NSURL URLWithString:[nm primaryImageUrl]];
        
        if (logs) {NSLog(@"URL: %@", [nm primaryImageUrl]);}
        
        NSURLRequest *requestImage = [NSURLRequest requestWithURL:urlImage];
        UIImage *placeholderImage = [UIImage imageNamed:@"placeholder.jpg"];
        
        
        // we could make it in one single line here without blocks. But we have to remember the cancel other downloads not reusing cells, which would make the pictures overlapp one with another one.
        
        
        [mealImageView setImageWithURLRequest:requestImage placeholderImage:placeholderImage success:nil failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            NSLog(@"Unable to retrieve image");
        }];
        //we are using nil as success, but if we want to do some modifications to the image we could make it inside that block.
        
        
        /*
         //This solution also works but loads two images in the same cell when there is no data yet in CORE DATA.
         __weak UITableViewCell *weakCell = cell;
         
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
    UILabel *tagsLabel = (UILabel*) [cell viewWithTag:14];
    tagsLabel.text = @"";
    for (NSDictionary* dict in sortedItems) {
        if (![[dict valueForKey:@"name"] containsString:@"main"]){
            tagsLabel.text = [tagsLabel.text stringByAppendingString: [dict valueForKey:@"name"]];
            tagsLabel.text = [tagsLabel.text stringByAppendingString: @" "];
            
            
            /*
             // Draw all SVG tags which are not type:course
             //1: Turn your SVG into a CGPath:
             CGPathRef myPath = [PocketSVG pathFromSVGFileNamed:@"expand-button"];
             
             //2: To display it on screen, you can create a CAShapeLayer
             //and set myPath as its path property:
             CAShapeLayer *myShapeLayer = [CAShapeLayer layer];
             myShapeLayer.path = myPath;
             
             //3: Fiddle with it using CAShapeLayer's properties:
             myShapeLayer.strokeColor = [[UIColor redColor] CGColor];
             myShapeLayer.lineWidth = 4;
             myShapeLayer.fillColor = [[UIColor clearColor] CGColor];
             
             //4: Display it!
             [self.view.layer addSublayer:myShapeLayer];
             */
            
        }
    }
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(orderMeal:)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Add to my Order" forState:UIControlStateNormal];
    [button setTintColor: [UIColor whiteColor]];
     [button setBackgroundColor:[UIColor colorWithRed:0.0/255 green:128.0/255 blue:255.0/255 alpha:1.0]];
    button.frame = CGRectMake(40.0f, 274.0f, 239.0f, 30.0f);
    [button.titleLabel  setFont:[UIFont fontWithName:@"Avenir-Next-Italic" size:17.0]];
    [cell addSubview:button];
    
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

