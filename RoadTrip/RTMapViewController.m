//
//  RTMapViewController.m
//  RoadTrip
//
//  Created by Sara Pendleton Strickler on 11/7/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import "RTMapViewController.h"

@interface RTMapViewController ()

@end

@implementation RTMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Map";
        self.tabBarItem.image = [UIImage imageNamed:@"mapicon.png"];
        // Custom initialization
    }
    return self;
}

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

@end
