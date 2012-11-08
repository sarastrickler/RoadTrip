//
//  RTPackingListItemViewController.h
//  RoadTrip
//
//  Created by Sara Pendleton Strickler on 11/8/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTPackingListItemViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSDictionary *packingListItemDictionary;

- (id)initWithPackingListItemDictionary:(NSDictionary *)packingListItemDictionary;

@end
