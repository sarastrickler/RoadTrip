//
//  RTLocation.m
//  RoadTrip
//
//  Created by Joe Ricioppo on 11/10/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import "RTLocation.h"

@interface RTLocation ()
@property (copy, readwrite, nonatomic) NSString *title;
@property (readwrite, nonatomic) CLLocationCoordinate2D coordinate;
@end

@implementation RTLocation

@synthesize title = _title;
@synthesize coordinate = _coordinate;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        CLLocationDegrees latitude = [[dictionary objectForKey:@"latitude"] doubleValue];
        CLLocationDegrees longitude = [[dictionary objectForKey:@"longitude"] doubleValue];
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        self.coordinate = coordinate;
    }
    return self;
}

@end
