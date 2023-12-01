//
//  NewsViewController.m
//  Immofinances
//
//  Created by Aminowizc on 29/12/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "NewsViewController.h"
#import "News.h"
#import "NewsCustomTableViewCell.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface NewsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initializeComponents];
    
    /*self.newsMovies = [[NSMutableArray alloc] init];
    
    News *news = [[News alloc] init];
    news.newsTitle = @"Titre du post";
    news.newsDescription = @"desxcfcsdfsdg gdsfgdf gfd g fg df gdfsg  fdg  dfs g dfsg";
    news.newsDate = @"12/02/2018";
    [self.newsMovies addObject:news];
    
    news = [[News alloc] init];
    news.newsTitle = @"Titre du post";
    news.newsDescription = @"desxcfcsdfsdg gdsfgdf gfd g fg df gdfsg  fdg  dfs g dfsg";
    news.newsDate = @"12/02/2018";
    [self.newsMovies addObject:news];*/
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsMovies count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"NewsCustomTableViewCell";
    
    NewsCustomTableViewCell *cell = (NewsCustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewsCustomTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    News *news = [[News alloc] init];
    news = [self.newsMovies objectAtIndex:indexPath.row];
    cell.newsTitle.text = news.newsTitle;
    cell.newsDescription.text = news.newsDescription;
    cell.newsDate.text = news.newsDate;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    News *news = [[News alloc] init];
    news = self.newsMovies[row];
    NSString* link = news.newsLink;
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:link];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
             NSLog(@"Opened url");
        }
    }];
}


- (IBAction)returnToHomeViewFromNewsView:(id)sender {
    [self.delegate returnToHomeViewFromNewsView];
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
