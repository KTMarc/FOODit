//
//  MHSorderStatusBarViewController.m
//  FOODit
//
//  Created by Marc Humet on 4/1/15.
//
//

#import "MHSorderStatusBarViewController.h"

@interface MHSorderStatusBarViewController ()

@end

@implementation MHSorderStatusBarViewController

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.resetButton.hidden = true;

        if (_order.billValue == 0){
            self.welcomeLabel.hidden = false;
            self.mainCountLabel.hidden = true;
            self.otherCountLabel.hidden = true;
            self.billTotalLabel.hidden = true;
        } else{
    self.welcomeLabel.hidden = true;
    self.mainCountLabel.hidden = false;
    self.otherCountLabel.hidden = false;
    self.billTotalLabel.hidden = false;
//    self.resetButton.hidden = false;
    
    self.mainCountLabel.text = [NSString stringWithFormat:@"%@ main", _order.main.stringValue];
    self.otherCountLabel.text = [NSString stringWithFormat:@"%@ other", _order.other.stringValue];
    self.billTotalLabel.text= [NSString stringWithFormat: @"£%@",_order.bill];
     }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //We access the model we created in the app delegate
    AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
    _order = myAppDelegate.order;
    _model = myAppDelegate.model;
    
    //SetupKVO to listen to CORE DATA Changes
   // [_order setupKVO];
    
    NSArray *keys= @[@"bill",@"main",@"other"];
    
    for (NSString *key in keys) {
        
        [_order addObserver:self
               forKeyPath:key
                  options: NSKeyValueObservingOptionNew
                  context:NULL];
    }

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(didTap:)];
    
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self action:@selector(didTap:)];
    
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:swipe];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    //[_order tearDownKVO];
 /*
    NSArray *keys= @[@"bill",@"main",@"other"];
    
    for (NSString *key in keys) {
        [self removeObserver:self
                  forKeyPath:key];
    }
*/
    
}

#pragma mark - Actions

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
   // NSLog(@"Detected change in Model. \n Keypath: %@\n object:%@\n change:%@", keyPath,object,change);
    BOOL logs = NO;
    if (_order.billValue > 0){
        self.welcomeLabel.hidden = true;
        self.mainCountLabel.hidden = false;
        self.otherCountLabel.hidden = false;
        self.billTotalLabel.hidden = false;
       // self.resetButton.hidden = false;
    }
    
    if ([keyPath isEqualToString:@"main"]){
        self.mainCountLabel.text = [NSString stringWithFormat:@"%@ main", _order.main.stringValue];
        if (logs){ NSLog(@"Detected change in Main");
            NSLog(@"New value for: %@",self.mainCountLabel.text );}
    }
    if ([keyPath isEqualToString:@"other"]){
        self.otherCountLabel.text = [NSString stringWithFormat:@"%@ other", _order.other.stringValue];
            if (logs){NSLog(@"Detected change in Other");
                NSLog(@"New value for: %@",self.otherCountLabel.text );}
    }
    if ([keyPath isEqualToString:@"bill"]){
        self.billTotalLabel.text= [NSString stringWithFormat: @"£%@",_order.bill];
        if (logs){NSLog(@"Detected change in Bill");}

    }
    
    [self.view setNeedsDisplay];

    
}

-(void) didTap:(UITapGestureRecognizer *) tap{
    
    if (tap.state == UIGestureRecognizerStateRecognized) {
        [self performSegueWithIdentifier:@"toOrderSegue" sender:self];

    }
}


- (IBAction)resetButton:(id)sender {

    //Delete Database
    [_model zapAllData];
    //Set the flag for loaded Data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"no" forKey:@"hasData"];
    [defaults synchronize];
    
}
@end
