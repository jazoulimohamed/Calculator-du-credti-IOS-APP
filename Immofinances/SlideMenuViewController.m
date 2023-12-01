//
//  SlideMenuViewController.m
//  AlTareekh
//
//  Created by Aminowizc on 16/09/2016.
//  Copyright © 2016 Aminowizc. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "SimpleListCell.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface SlideMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *itemsTableView;
@property (retain, nonatomic) NSDictionary *menusItems;
@property (retain, nonatomic) NSDictionary *menusIcons;
@property (retain, nonatomic) NSArray *menuSectionTitles;

@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Header view.
    self.itemsTableView.backgroundColor = UIColorFromRGB(0x878787);
    //0F7DC1
    [self.itemsTableView setSeparatorColor:UIColorFromRGB(0xFFFFFF)];
    
    self.menusItems = [[NSDictionary alloc] init];
    self.menusItems = @{NSLocalizedString(@"home", Nil): @[NSLocalizedString(@"home", Nil)], NSLocalizedString(@"reference", Nil): @[NSLocalizedString(@"areas", Nil), NSLocalizedString(@"groups", Nil), NSLocalizedString(@"formulas", Nil), NSLocalizedString(@"lexicon", Nil), NSLocalizedString(@"questions", Nil)],
                        NSLocalizedString(@"settings", Nil): @[NSLocalizedString(@"language", Nil), NSLocalizedString(@"about", Nil), NSLocalizedString(@"exit", Nil)]
                        };
    
    self.menusIcons = @{@"HOME": @[@"LanguageIcon"],
                        @"REFERENCE": @[@"AreaIcon", @"GroupIcon", @"FormulaIcon", @"LexiconIcon", @"QuestionIcon"],
                        @"SETTINGS": @[@"LanguageIcon", @"AboutIcon", @"ExitIcon"]
                        };
    
    self.menuSectionTitles = [self.menusItems allKeys];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.menuSectionTitles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.menuSectionTitles objectAtIndex:section];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40.0)];
    [sectionView setBackgroundColor:UIColorFromRGB(0x2B5F90)];
    
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
    
    // Create label with section title
    UILabel *sectionTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.00, 0.00, 300.00, 40.0)];
    //If you add a bit to x and decrease y, it will be more in line with the tableView cell (that is in iPad and landscape)
    sectionTitleLabel.backgroundColor = [UIColor clearColor];
    sectionTitleLabel.textColor = [UIColor whiteColor];
    sectionTitleLabel.font = [UIFont boldSystemFontOfSize:18];
    sectionTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
    sectionTitleLabel.text = sectionTitle;
    
    [sectionView addSubview:sectionTitleLabel];
    return sectionView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSString *sectionTitle = [self.menuSectionTitles objectAtIndex:section];
    NSArray *sectionItems = [self.menusItems objectForKey:sectionTitle];
    return [sectionItems count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleListCell";
    
    SimpleListCell *simpleListCell = (SimpleListCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (simpleListCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleListCell" owner:self options:nil];
        simpleListCell = [nib objectAtIndex:0];
    }
    
    //videosListCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    simpleListCell.backgroundColor = UIColorFromRGB(0x878787);
    
    NSString *sectionTitle = [self.menuSectionTitles objectAtIndex:indexPath.section];
    
    NSArray *sectionItems = [self.menusItems objectForKey:sectionTitle];
    NSArray *sectionIcons = [self.menusIcons objectForKey:sectionTitle];
    
    NSString *menuTitle = [sectionItems objectAtIndex:indexPath.row];
    simpleListCell.menuTitleLabel.text = menuTitle;
    
    simpleListCell.imageView.image = [UIImage imageNamed:[sectionIcons objectAtIndex:indexPath.row]];
    
    
    UIView *customColorView = [[UIView alloc] init];
    customColorView.backgroundColor = UIColorFromRGB(0xadadad);
    simpleListCell.selectedBackgroundView = customColorView;
    
    return simpleListCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSlog(@"selected");
    
    [tableView beginUpdates];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //if you are doing any animation you have deselect the row here inside.
    [tableView endUpdates];
    
    [self.delegate showView:indexPath.row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
