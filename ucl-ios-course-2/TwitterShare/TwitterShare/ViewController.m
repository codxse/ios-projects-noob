//
//  ViewController.m
//  TwitterShare
//
//  Created by Nadiar Syaripul on 29/11/20.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

- (void) configureTweetView;
- (void) showAlertMessage:(NSString *)myCustomMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTweetView];
    // Do any additional setup after loading the view.
}

- (IBAction)showShareAction:(id)sender {
    if ([self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    }
    
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"Send Tweet" message:@"Tweet your Note" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *tweetAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            
            if (self.tweetTextView.text.length < 140) {
                [twitterVC setInitialText:self.tweetTextView.text];
            } else {
                NSString *shortText = [self.tweetTextView.text substringToIndex:140];
                [twitterVC setInitialText:shortText];
            }
            
            [self presentViewController:twitterVC animated:YES completion:nil];
        } else {
            [self showAlertMessage:@"Please sign in to twitter before making a tweet"];
        }
    }];
    
    [actionController addAction:tweetAction];
    [actionController addAction:cancelAction];
    
    [self presentViewController:actionController animated:YES completion:nil];
}

- (void)configureTweetView {
    self.tweetTextView.layer.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.tweetTextView.layer.borderWidth = 2.0;
}

- (void)showAlertMessage:(NSString *)myMessage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Twitter SHare" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
