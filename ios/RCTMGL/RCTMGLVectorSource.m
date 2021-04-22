//
//  RCTMGLVectorSource.m
//  RCTMGL
//
//  Created by Nick Italiano on 9/8/17.
//  Copyright © 2017 Mapbox Inc. All rights reserved.
//

#import "RCTMGLVectorSource.h"

@implementation RCTMGLVectorSource

- (MGLSource*)makeSource
{
  if (_tileUrlTemplates) {
    NSMutableDictionary<MGLTileSourceOption, id> *options = [NSMutableDictionary dictionary];

    if (_sourceBounds) {
      CLLocationCoordinate2D sw = CLLocationCoordinate2DMake(_sourceBounds[1].floatValue, _sourceBounds[0].floatValue);
      CLLocationCoordinate2D ne = CLLocationCoordinate2DMake(_sourceBounds[3].floatValue, _sourceBounds[2].floatValue);
      MGLCoordinateBounds bounds = MGLCoordinateBoundsMake(sw, ne);

      options[MGLTileSourceOptionCoordinateBounds] = [NSValue valueWithBytes:&bounds objCType:@encode(MGLCoordinateBounds)];
    }
    if (_minZoomLevel) {
      options[MGLTileSourceOptionMinimumZoomLevel] = @(_minZoomLevel);
    }
    if (_maxZoomLevel) {
      options[MGLTileSourceOptionMaximumZoomLevel] = @(_maxZoomLevel);
    }

    return [[MGLVectorTileSource alloc] initWithIdentifier:self.id tileURLTemplates:_tileUrlTemplates options:options];
  } else {
    return [[MGLVectorTileSource alloc] initWithIdentifier:self.id configurationURL:[NSURL URLWithString:_url]];
  }
}

@end
