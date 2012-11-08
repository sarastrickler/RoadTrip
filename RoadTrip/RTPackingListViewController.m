//
//  RTPackingListViewController.m
//  RoadTrip
//
//  Created by Sara Pendleton Strickler on 11/7/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import "RTPackingListViewController.h"
#import "RTPackingListItemViewController.h"

@interface RTPackingListViewController ()
@property (nonatomic, strong) NSArray *packingListItems;
@end

@implementation RTPackingListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self == nil)
    {
        return nil;
    }
    
    NSURL *packingListPlistURL = [[NSBundle mainBundle] URLForResource:@"packing-list" withExtension:@"plist"];
    NSDictionary *plistContents = [[NSDictionary alloc] initWithContentsOfURL:packingListPlistURL];
    NSArray *packingListDictionaries = [plistContents objectForKey:@"packingListItems"];
    NSMutableArray *processedPackingListDictionaries = [NSMutableArray arrayWithCapacity:packingListDictionaries.count];
    
    for (NSDictionary *packingListItemDictionary in packingListDictionaries)
    {
        NSMutableDictionary *processedPackingListItemDictionary = [NSMutableDictionary dictionaryWithDictionary:packingListItemDictionary];
        
//        NSString *item = [packingListItemDictionary objectForKey:@"itemName"];
//        NSString *itemDetails = [packingListItemDictionary objectForKey:@"itemDetail"];
//        BOOL *itemIsChecked = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
        [processedPackingListDictionaries addObject:processedPackingListItemDictionary];
    }
    
    self.packingListItems = [processedPackingListDictionaries copy];
    
    NSLog(@"packingListItems: \n%@", self.packingListItems);
    
    return self;
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    
    if (aTableView)
    {
        [self.packingListItems count];
    }
    return rows;
    
}

static NSString *const kMyCellReuseIdentifier = @"kMyCellReuseIdentifier";

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:kMyCellReuseIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMyCellReuseIdentifier];
    }
    
    //
    NSDictionary *packingListItemDictionary = nil;
    if ([aTableView isEqual:self.searchDisplayController.searchResultsTableView])
    {
       packingListItemDictionary = [self.packingListItems objectAtIndex:indexPath.row];
    }
       
    NSString *item = [packingListItemDictionary objectForKey:@"itemName"];
    NSString *itemDetails = [packingListItemDictionary objectForKey:@"itemDetail"];
    cell.textLabel.text = item;
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *packingListDictionary = [self.packingListItems objectAtIndex:indexPath.row];
    
    RTPackingListItemViewController *itemViewController = [[RTPackingListItemViewController alloc] initWithPackingListItemDictionary:packingListDictionary];
    
    [self.navigationController pushViewController:itemViewController animated:YES];
    
    [aTableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
