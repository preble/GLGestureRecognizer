//
//  GLGestureRecognizer+JSONTemplates.m
//  Gestures
//
//  Created by Adam Preble on 9/11/10.
//  Copyright 2010 Giraffe Lab. All rights reserved.
//

#import "GLGestureRecognizer+JSONTemplates.h"

@implementation GLGestureRecognizer (JSONTemplates)

- (BOOL)loadTemplatesFromJsonData:(NSData *)jsonData error:(NSError **)errorOut
{
	// The recognized gestures are loaded from JSON format, using the TouchJSON library.
	// As an example, if kSamplePoints were 3, here is an example file with one gesture:
	//   { "line" : [ [1.0, 0.0], [0.0, 0.0], [-1.0, 0.0] ] }
	// (A dictionary with string key names and an array of 2-element array coordinate pairs.)
	// To populate the file, use the output of the NSLog()s in findBestMatch..: after drawing a shape.
	NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:errorOut];
	if (!dict)
		return NO;

	NSMutableDictionary *output = [NSMutableDictionary dictionary];
	[dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSArray *value, BOOL *stop) {
		NSMutableArray *points = [NSMutableArray arrayWithCapacity:value.count];
		for (NSArray *pointArray in value)
		{
			CGPoint point = CGPointMake([pointArray[0] floatValue], [pointArray[1] floatValue]);
			[points addObject:[NSValue valueWithCGPoint:point]];
		}
		output[key] = [points copy]; // mutable to immutable
	}];
	self.templates = [output copy]; // mutable to immuatable
	return YES;
}


@end
