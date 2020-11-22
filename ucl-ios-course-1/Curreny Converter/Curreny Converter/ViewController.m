//
//  ViewController.m
//  Curreny Converter
//
//  Created by Nadiar Syaripul on 21/11/20.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"

@interface ViewController () <CRCurrencyRequestDelegate>

@property (nonatomic) CRCurrencyRequest *currencyRequest;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currencyA;
@property (weak, nonatomic) IBOutlet UILabel *currencyB;
@property (weak, nonatomic) IBOutlet UILabel *currencyC;

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction) buttonTap:(id)sender {
    self.convertButton.enabled = NO;
    self.currencyRequest = [[CRCurrencyRequest alloc] init];
    self.currencyRequest.delegate = self;
    [[self currencyRequest] start];
}

- (void) currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies {
    
    double inputValue = [self.inputField.text floatValue];
    double euro = inputValue * currencies.EUR;
    NSString *euroStr = [NSString stringWithFormat:@"€%.2f", euro];
    double yen = inputValue * currencies.JPY;
    NSString *yenStr = [NSString stringWithFormat:@"¥%.2f", yen];
    double pundsterling = inputValue * currencies.GBP;
    NSString *gbpStr = [NSString stringWithFormat:@"£%.2f", pundsterling];
    
    
    self.currencyA.text = euroStr;
    self.currencyA.adjustsFontSizeToFitWidth = NO;
    self.currencyA.lineBreakMode = NSLineBreakByTruncatingTail;
    self.currencyB.text = yenStr;
    self.currencyC.text = gbpStr;
    
    self.convertButton.enabled = YES;
    [self.view endEditing:YES];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
