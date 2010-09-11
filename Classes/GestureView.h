//
//  GestureView.h
//  Gestures
//
//  Created by Adam Preble on 4/27/09.
//  Copyright 2010 Giraffe Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GLGestureRecognizer;

@interface GestureView : UIView {
	NSString *caption;
	GLGestureRecognizer *recognizer;
	CGPoint center;
	float score, angle;
}
@property (nonatomic, copy) NSString *caption;
@end
