//
//  ContactViewController.m
//  Immofinances
//
//  Created by Aminowizc on 27/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ContactViewController.h"
#import "AFNetworking.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ContactViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextView;
@property (weak, nonatomic) IBOutlet UITextField *cityTextView;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeTextView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextView;
@property (weak, nonatomic) IBOutlet UITextField *commentByTextView;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
    self.sendButton.backgroundColor = UIColorFromRGB(0xfd8355);
    
}

- (IBAction)sendEmail:(id)sender {
    NSString *lastname = self.lastnameTextView.text;
    NSString *city = self.cityTextView.text;
    NSString *zipcode = self.zipcodeTextView.text;
    NSString *email = self.emailTextView.text;
    NSString *phone = self.phoneTextView.text;
    NSString *errorMessage = @"";
    if ([lastname isEqualToString:@""] || [city isEqualToString:@""] || [email isEqualToString:@""] || [phone isEqualToString:@""] || [zipcode isEqualToString:@""]) {
        errorMessage = @"Veuillez svp saisir toutes les informations.";
    }
    if (![email isEqualToString:@""]) {
        if (![self isValidEmail:email]) {
            if ([errorMessage isEqualToString:@""]) {
                errorMessage = @"Veuillez svp saisir un email valide.";
            } else {
                errorMessage = [NSString stringWithFormat:@"%@ %s", errorMessage, "\nVeuillez svp saisir un email valide."];
            }
        }
    }
    if (![phone isEqualToString:@""]) {
        if (![self isValidPhone:phone]) {
            if ([errorMessage isEqualToString:@""]) {
                errorMessage = @"Veuillez svp saisir un numéro de téléphone valide.";
            } else {
                errorMessage = [NSString stringWithFormat:@"%@ %s", errorMessage, "\nVeuillez svp saisir un numéro de téléphone valide."];
            }
        }
    }
    
    if (![errorMessage isEqualToString:@""]) {
        [self showAlert:@"Erreur" message:errorMessage];
    } else {
        [self sendEmail];
    }
}

- (void)sendEmail {
    NSString *lastname = self.lastnameTextView.text;
    NSString *city = self.cityTextView.text;
    NSString *zipcode = self.zipcodeTextView.text;
    NSString *email = self.emailTextView.text;
    NSString *phone = self.phoneTextView.text;
    NSString *comment = self.commentByTextView.text;
    
    NSString *string = [NSString stringWithFormat:@"%@", @"https://immofinances.net/rest-api/v1/contact"];
    NSURL *url = [NSURL URLWithString:string];
    
    NSString *key = @"746852426f76f0dbbd0cbb6a66dba64a";
    //String url = String.format("https://immofinances.net/rest-api/v1/contact?Authorization=%1$s&nom=%2$s&ville=%3$s&cp=%4$s&tel=%5$s&email=%6$s&comment=%7$s", key, _value1, _value2, _value3, _value4, _value5, _value6);
    //Log.i("url",url);
    /*Map<String,String> params = new HashMap<String, String>();
    params.put("Authorization", key);
    params.put("nom", _value1);
    params.put("ville", _value2);
    params.put("cp", _value3);
    params.put("tel", _value4);
    params.put("email", _value5);
    params.put("comment", _value6);
    sendEmailRequest((HashMap<String, String>) params);*/
    
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:key, @"Authorization", @"application/x-www-form-urlencoded", @"Content-Type", lastname, @"nom", city, @"ville", zipcode, @"cp", phone, @"tel", email, @"email", comment, @"comment", nil];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:key forHTTPHeaderField:@"Authorization"];
    
    [manager POST:@"https://immofinances.net/rest-api/v1/contact" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success! responseObject %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}

- (IBAction)returnToHomeViewFromContactView:(id)sender {
    [self.delegate returnToHomeViewFromContactView];
}

- (void)showAlert:(NSString*)title message:(NSString*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (BOOL)isValidPhone:(NSString *)phoneNumber {
    NSString *phoneRegex = @"^((\\+)|(0))[0-9]{6,14}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [phoneTest evaluateWithObject:phoneNumber];
}

- (BOOL)isValidEmail:(NSString*)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
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
