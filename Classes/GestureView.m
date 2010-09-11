//
//  GestureView.m
//  Gestures
//
//  Created by Adam Preble on 4/27/09.
//  Copyright 2010 Giraffe Lab. All rights reserved.
//

#import "GestureView.h"
#import "GLGestureRecognizer.h"
#import "GLGestureRecognizer+JSONTemplates.h"

@interface GestureView ()
@end

@implementation GestureView

@synthesize caption;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)dealloc {
	self.caption = nil;
	[recognizer release];
    [super dealloc];
}

- (void)awakeFromNib
{
	recognizer = [[GLGestureRecognizer alloc] init];
	NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Gestures" ofType:@"json"]];
	[recognizer loadTemplatesFromJsonData:jsonData];
	
	self.caption = @"";
}

- (void)drawRect:(CGRect)rect 
{
    // Drawing code
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
	CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
	CGContextFillRect(ctx, rect);
	
	CGContextSetRGBFillColor(ctx, 1, 1, 1, 1);
	CGContextSetTextDrawingMode(ctx, kCGTextFillStroke); 
	CGContextSelectFont(ctx, "Helvetica", 20, kCGEncodingMacRoman);
	CGContextSetTextMatrix(ctx, CGAffineTransformMakeScale(1, -1)); 
	CGContextShowTextAtPoint(ctx, 10, 30, [caption UTF8String], [caption length]);
	
	CGContextSetRGBFillColor(ctx, 0, 0, 0, 1);
	
	for (NSValue *pointValue in [recognizer touchPoints])
	{
		CGPoint pointInView = [pointValue CGPointValue];
		if (pointValue == [[recognizer touchPoints] objectAtIndex:0])
			CGContextMoveToPoint(ctx, pointInView.x, pointInView.y);
		else
			CGContextAddLineToPoint(ctx, pointInView.x, pointInView.y);
	}
	CGContextStrokePath(ctx);
	CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
	for (NSValue *pointValue in [recognizer resampledPoints])
	{
		CGPoint pointInView = [pointValue CGPointValue];
		pointInView.x = pointInView.x * 100.0f + 160.0f;
		pointInView.y = pointInView.y * 100.0f + 240.0f;
		if (pointValue == [[recognizer resampledPoints] objectAtIndex:0])
			CGContextMoveToPoint(ctx, pointInView.x, pointInView.y);
		else
			CGContextAddLineToPoint(ctx, pointInView.x, pointInView.y);
	}
	CGContextStrokePath(ctx);
	
	CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
	CGContextFillRect(ctx, CGRectMake(center.x, center.y, 4.0f, 4.0f));
}

- (void)processGestureData
{
	NSString *gestureName = [recognizer findBestMatchCenter:&center angle:&angle score:&score];
	self.caption = [NSString stringWithFormat:@"%@ (%0.2f, %d)", gestureName, score, (int)(360.0f*angle/(2.0f*M_PI))];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[recognizer resetTouches];
	[recognizer addTouches:touches fromView:self];
	[self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[recognizer addTouches:touches fromView:self];
	[self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[recognizer addTouches:touches fromView:self];
	
	[self processGestureData];
	[self setNeedsDisplay];
}


@end
