/*
 * Copyright 2013 Marco Abundo, Ysiad Ferreiras, Aaron Bannert, Jeremy Canfield and Michelle Koeth
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "MapUtils.h"
#import <AddressBookUI/AddressBookUI.h>
#import "Constants.h"

@implementation MapUtils

#pragma mark - Map view utility methods

+ (MKMapRect)regionToFitMapAnnotations:(NSArray *)annotations
{
    MKMapRect zoomRect = MKMapRectNull;
    
    for (id <MKAnnotation> annotation in annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
        
        if (MKMapRectIsNull(zoomRect))
        {
            zoomRect = pointRect;
        }
        else
        {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
    }

    return zoomRect;
}

+ (void)openMapWithDestination:(MKPlacemark *)placemark
{
    MKMapItem *destination =  [[MKMapItem alloc] initWithPlacemark:placemark];
    
    if ([destination respondsToSelector:@selector(openInMapsWithLaunchOptions:)])
    {
        // Using iOS 6 native maps app
        [destination openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving}];
    }
    else
    {
        // Using iOS 5 which has the Google Maps application
        NSString *currentLocation = @"Current Location";
        NSString *destination = ABCreateStringWithAddressDictionary(placemark.addressDictionary, NO);
        NSString *googleMapsURL = [NSString stringWithFormat:@"%@saddr=%@&daddr=%@", kGoogleMapsURL, currentLocation, destination];
        
        NSString *urlString = [googleMapsURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    }
}

@end
