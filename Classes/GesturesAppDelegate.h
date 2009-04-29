//
//  GesturesAppDelegate.h
//  Gestures
//
//  Created by Adam Preble on 4/27/09.
//  Copyright Giraffe Lab 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GesturesViewController;

@interface GesturesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GesturesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GesturesViewController *viewController;

@end

