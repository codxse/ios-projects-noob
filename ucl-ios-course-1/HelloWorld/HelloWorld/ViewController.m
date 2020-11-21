//
//  ViewController.m
//  HelloWorld
//
//  Created by Nadiar Syaripul on 20/11/20.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *helloLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)helloButton:(id)sender {
    int height_feet = 5;
    int height_inches = 11;
    double height_cm = ((height_feet * 12.0) + height_inches) * 2.54;
//    self.helloLabel.text = [NSString stringWithFormat:@"%f", height_cm];
    
    if (height_cm > 200.0) {
        self.helloLabel.text = @"You are tall!";
    } else {
        self.helloLabel.text = @"Forget it";
    }
    
}

@end
