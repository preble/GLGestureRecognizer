//
//  GLGestureRecognizer.h
//  Gestures
//
//  Created by Adam Preble on 4/28/09.  adam@giraffelab.com
//

#import <Foundation/Foundation.h>


@interface GLGestureRecognizer : NSObject {
	NSMutableArray *input;
	NSMutableArray *resampledPoints;
	NSDictionary *templates;
}
@property (nonatomic, retain) NSDictionary *templates;
@property (nonatomic, retain) NSArray *touchPoints;
@property (nonatomic, retain) NSArray *resampledPoints;
- (BOOL)loadTemplatesFromFile:(NSString*)path;
- (void)addTouches:(NSSet*)set fromView:(UIView *)view;
- (void)addTouchAtPoint:(CGPoint)point;
- (void)resetTouches;
- (NSString *)findBestMatch;
- (NSString *)findBestMatchCenter:(CGPoint*)outCenter angle:(float*)outRadians score:(float*)outScore;
@end
