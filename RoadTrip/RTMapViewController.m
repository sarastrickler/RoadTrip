//
//  RTMapViewController.m
//  RoadTrip
//
//  Created by Sara Pendleton Strickler on 11/7/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import "RTMapViewController.h"
#import "RTLocation.h"

@interface RTMapViewController () <MKMapViewDelegate>
@property (copy, nonatomic) NSArray *locations;
@end

@implementation RTMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Map";
        self.tabBarItem.image = [UIImage imageNamed:@"mapicon.png"];
        
        NSString *locationsDataFilePath = [[NSBundle mainBundle] pathForResource:@"locations" ofType:@"plist"];
        NSArray *locationDictionaries = [[NSArray alloc] initWithContentsOfFile:locationsDataFilePath];
        NSMutableArray *locations = [NSMutableArray arrayWithCapacity:locationDictionaries.count];
        
        for (NSDictionary *locationDictionary in locationDictionaries)
        {
            RTLocation *location = [[RTLocation alloc] initWithDictionary:locationDictionary];
            [locations addObject:location];
        }
        
        self.locations = locations;
        
        NSLog(@"locations: %@", self.locations);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mapView addAnnotations:self.locations];
    
    RTLocation *initialLocation = [self.locations objectAtIndex:0];    
    [self.mapView setCenterCoordinate:initialLocation.coordinate animated:YES];
    [self.mapView selectAnnotation:initialLocation animated:YES];
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    return nil;
}

@end
