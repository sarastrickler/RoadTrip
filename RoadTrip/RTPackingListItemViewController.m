//
//  RTPackingListItemViewController.m
//  RoadTrip
//
//  Created by Sara Pendleton Strickler on 11/8/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import "RTPackingListItemViewController.h"

@interface RTPackingListItemViewController ()

@end

@implementation RTPackingListItemViewController

- (id)initWithPackingListItemDictionary:(NSDictionary *)aPackingListItemDictionary
{
    self = [self initWithNibName:@"RTPackingListItemViewController" bundle:nil];
    if (self == nil)
    {
        return nil;
    }
    
    self.packingListItemDictionary = aPackingListItemDictionary;
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

static NSString *const kMyCellReuseIdentifier = @"kMyCellReuseIdentifier";

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:kMyCellReuseIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:kMyCellReuseIdentifier];
        
    }
    
    if (indexPath.row == 0)
    {
        NSString *item = [self.packingListItemDictionary objectForKey:@"itemName"];
        
        cell.textLabel.text = @"Item:";
        cell.detailTextLabel.text = item;
    }
    else if (indexPath.row == 1)
    {
        NSString *itemDetail = [self.packingListItemDictionary objectForKey:@"itemDetail"];
        
        cell.textLabel.text = @"Notes:";
        cell.detailTextLabel.text = itemDetail;
    }
    
    return cell;
}

@end
