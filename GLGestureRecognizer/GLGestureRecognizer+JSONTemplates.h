//
//  GLGestureRecognizer+JSONTemplates.h
//  Gestures
//
//  Created by Adam Preble on 9/11/10.
//  Copyright 2010 Giraffe Lab. All rights reserved.
//
//  Implements template loading from a .json file.

#import <Foundation/Foundation.h>
#import "GLGestureRecognizer.h"

@interface GLGestureRecognizer (JSONTemplates)

- (BOOL)loadTemplatesFromJsonData:(NSData *)jsonData error:(NSError **)errorOut;

@end
