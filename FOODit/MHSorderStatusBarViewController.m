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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //We access the model we created in the app delegate
    AppDelegate *myAppDelegate = [UIApplication sharedApplication].delegate;
    _order = myAppDelegate.order;
    _model = myAppDelegate.model;
    
    //SetupKVO to listen to CORE DATA Changes
    NSArray *keys= @[@"bill",@"main",@"other"];
    
    for (NSString *key in keys) {
        
        [_order addObserver:self
               forKeyPath:key
                  options: NSKeyValueObservingOptionNew
                  context:NULL];
    }
    
//    if (_order.billValue == 0){
//        self.welcomeLabel.hidden = false;
//        self.mainCountLabel.hidden = true;
//        self.otherCountLabel.hidden = true;
//        self.billTotalLabel.hidden = true;
//    } else{
        self.welcomeLabel.hidden = true;
        self.mainCountLabel.hidden = false;
        self.otherCountLabel.hidden = false;
        self.billTotalLabel.hidden = false;
        
        self.mainCountLabel.text = [NSString stringWithFormat:@"%@ main", _order.main.stringValue];
        self.otherCountLabel.text = [NSString stringWithFormat:@"%@ other", _order.other.stringValue];
        self.billTotalLabel.text= [NSString stringWithFormat: @"£%@",_order.bill];
   // }

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


#pragma mark - Actions

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    self.mainCountLabel.text = [NSString stringWithFormat:@"%@ main", _order.main.stringValue];
    self.otherCountLabel.text = [NSString stringWithFormat:@"%@ other", _order.other.stringValue];
    self.billTotalLabel.text= [NSString stringWithFormat: @"£%@",_order.bill];
    NSLog(@"Value changed");
}

-(void) didTap:(UITapGestureRecognizer *) tap{
    
    if (tap.state == UIGestureRecognizerStateRecognized) {
        [self performSegueWithIdentifier:@"toOrderSegue" sender:self];

    }
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
