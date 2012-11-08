//
//  RTPackingListViewController.h
//  RoadTrip
//
//  Created by Sara Pendleton Strickler on 11/7/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTPackingListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *packingListTableView;

@end
