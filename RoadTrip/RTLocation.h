//
//  RTLocation.h
//  RoadTrip
//
//  Created by Joe Ricioppo on 11/10/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>
#import <MapKit/MKAnnotation.h>

@interface RTLocation : NSObject <MKAnnotation>

@property (copy, readonly, nonatomic) NSString *title;
@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
