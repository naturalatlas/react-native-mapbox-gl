//
//  RCTMGLVectorSource.h
//  RCTMGL
//
//  Created by Nick Italiano on 9/8/17.
//  Copyright © 2017 Mapbox Inc. All rights reserved.
//

#import "RCTMGLSource.h"
@import Mapbox;

@interface RCTMGLVectorSource : RCTMGLSource

@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSArray<NSString *> *tileUrlTemplates;
@property (nonatomic, strong) NSArray<NSNumber *> *sourceBounds;
@property (nonatomic, assign) float minZoomLevel;
@property (nonatomic, assign) float maxZoomLevel;

@end
