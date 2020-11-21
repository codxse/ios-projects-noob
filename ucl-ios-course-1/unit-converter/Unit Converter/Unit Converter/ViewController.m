//
//  ViewController.m
//  Unit Converter
//
//  Created by Nadiar Syaripul on 21/11/20.
//

#import "ViewController.h"

double toMM(double cm) { return cm * 10; }

double toM(double cm) { return cm * 0.01; }

double toInch(double cm) { return cm * 0.393701; }

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentController;

@property (weak, nonatomic) IBOutlet UILabel *outputField;

@end

@implementation ViewController

- (IBAction)convertButton:(id)sender {
    NSMutableString *buf = [NSMutableString new];
    NSString *focusUnit = @"mm";
    
    double userInput = [self.inputField.text doubleValue];
    
    if (self.segmentController.selectedSegmentIndex == 0) {
        double u = toMM(userInput);
        [buf appendString: [@(u) stringValue]];
        focusUnit = @"mm";
    }
    if (self.segmentController.selectedSegmentIndex == 1) {
        double u = toM(userInput);
        [buf appendString: [@(u) stringValue]];
        focusUnit = @"m";
    }
    if (self.segmentController.selectedSegmentIndex == 2) {
        double u = toInch(userInput);
        [buf appendString: [@(u) stringValue]];
        focusUnit = @"inch";
    }
    
    NSString *converted = [NSString stringWithFormat: @"%@ cm in %@ is %@", [@(userInput) stringValue], focusUnit, buf];
    self.outputField.text = converted;
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
