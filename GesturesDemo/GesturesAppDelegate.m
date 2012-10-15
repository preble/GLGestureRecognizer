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

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
	
	GesturesViewController *vc = [[GesturesViewController alloc] init];
	self.window.rootViewController = vc;

    [self.window makeKeyAndVisible];
}

@end
