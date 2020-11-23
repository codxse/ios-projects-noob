//
//  ViewController.m
//  Distance App
//
//  Created by Nadiar Syaripul on 22/11/20.
//

#import "ViewController.h"
#import <DistanceGetter/DGDistanceRequest.h>

@interface ViewController ()
@property (nonatomic) DGDistanceRequest *distanceRequest;
@property (weak, nonatomic) IBOutlet UITextField *startLocation;
@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UITextField *endLocationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceA;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;
@property (weak, nonatomic) IBOutlet UIButton *calculateBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)calculateDistanceButton:(id)sender {
    self.calculateBtn.enabled = NO;
    self.distanceRequest = [DGDistanceRequest alloc];
    NSString *s = [[self startLocation] text];
    NSString *endA = [[self endLocationA] text];
    NSString *endB = [[self endLocationB] text];
    NSString *endC = [[self endLocationC] text];
    NSArray *destinations = @[endA, endB, endC];
    self.distanceRequest = [[self distanceRequest] initWithLocationDescriptions:destinations sourceDescription:s];
    
    __weak ViewController *weekSelf = self;

    
    self.distanceRequest.callback = ^void(NSArray *responses) {
        ViewController *strongSelf = weekSelf;
        if (!strongSelf) return;
        
        NSNull *badResult = [NSNull null];
        
        if (responses[0] != badResult) {
            float n = [responses[0] floatValue]/1000.0;
            NSString *temp = [NSString stringWithFormat:@"%.2f km", n];
            strongSelf.distanceA.text = temp;
        } else {
            strongSelf.distanceA.text = @"Error";
        }
        
        if (responses[1] != badResult) {
            float n = [responses[1] floatValue]/1000.0;
            NSString *temp = [NSString stringWithFormat:@"%.2f km", n];
            strongSelf.distanceB.text = temp;
        } else {
            strongSelf.distanceB.text = @"Error";
        }
        
        if (responses[2] != badResult) {
            float n = [responses[2] floatValue]/1000.0;
            NSString *temp = [NSString stringWithFormat:@"%.2f km", n];
            strongSelf.distanceC.text = temp;
        } else {
            strongSelf.distanceC.text = @"Error";
        }
        
        strongSelf.distanceRequest = nil;
        strongSelf.calculateBtn.enabled = YES;
    };
    
    [[self distanceRequest] start];
}

@end
