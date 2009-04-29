//
//  GesturesAppDelegate.m
//  Gestures
//
//  Created by Adam Preble on 4/27/09.
//  Copyright Giraffe Lab 2009. All rights reserved.
//

#import "GesturesAppDelegate.h"
#import "GesturesViewController.h"

@implementation GesturesAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
