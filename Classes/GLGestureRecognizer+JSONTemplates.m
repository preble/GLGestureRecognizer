//
//  GLGestureRecognizer+JSONTemplates.m
//  Gestures
//
//  Created by Adam Preble on 9/11/10.
//  Copyright 2010 Giraffe Lab. All rights reserved.
//

#import "GLGestureRecognizer+JSONTemplates.h"

// From TouchCode.com's TouchJSON:
#import "CJSONDeserializer.h"

@implementation GLGestureRecognizer (JSONTemplates)

- (BOOL)loadTemplatesFromJsonData:(NSData *)jsonData
{
	// The recognized gestures are loaded from JSON format, using the TouchJSON library.
	// As an example, if kSamplePoints were 3, here is an example file with one gesture:
	//   { "line" : [ [1.0, 0.0], [0.0, 0.0], [-1.0, 0.0] ] }
	// (A dictionary with string key names and an array of 2-element array coordinate pairs.)
	// To populate the file, use the output of the NSLog()s in findBestMatch..: after drawing a shape.
	NSError *error = nil;
	NSDictionary *dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
	NSMutableDictionary *output = [NSMutableDictionary dictionary];
	for (NSString *key in [dict allKeys])
	{
		NSArray *value = [dict objectForKey:key];
		NSMutableArray *points = [NSMutableArray array];
		for (NSArray *pointArray in value)
		{
			[points addObject:[NSValue valueWithCGPoint:CGPointMake([[pointArray objectAtIndex:0] floatValue], [[pointArray objectAtIndex:1] floatValue])]];
		}
		[output setObject:points forKey:key];
	}
	self.templates = output;
	return YES;
}


@end
