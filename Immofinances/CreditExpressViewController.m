//
//  CreditExpressViewController.m
//  Immofinances
//
//  Created by Aminowizc on 06/11/2020.
//  Copyright © 2020 Aminowizc. All rights reserved.
//

#import "CreditExpressViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface CreditExpressViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation CreditExpressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    
    NSString *urlString = @"https://www.immofinances.net/credit-express-frame.php";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
    
    WKWebViewConfiguration *theConfiguration =
          [[WKWebViewConfiguration alloc] init];
    [theConfiguration.userContentController
          addScriptMessageHandler:self name:@"interOp"];
    
    _theWebView = [[WKWebView alloc] initWithFrame:self.view.frame
                      configuration:theConfiguration];
    [_theWebView loadRequest:urlRequest];
    _theWebView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:_theWebView];
    
    [_theWebView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [_theWebView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [_theWebView.topAnchor constraintEqualToAnchor:self.toolBar.bottomAnchor].active = YES;
    [_theWebView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    _theWebView.scrollView.contentOffset = CGPointMake(0, 800);
}

/*- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Finish");
    if ([[webView stringByEvaluatingJavaScriptFromString:@"document.readyState"] isEqualToString:@"complete"]) {
        self.webView.scrollView.contentOffset = CGPointMake(0, 800);
    }
}*/

- (IBAction)returnToHomeViewFromPersonalAreaView:(id)sender {
    [self.delegate returnToHomeViewFromCreditExpressView];
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
