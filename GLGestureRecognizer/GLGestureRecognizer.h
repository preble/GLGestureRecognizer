//
//  GLGestureRecognizer.h
//
//  Created by Adam Preble on 4/28/09.  adam@giraffelab.com
//

#import <Foundation/Foundation.h>


@interface GLGestureRecognizer : NSObject

@property (nonatomic, strong) NSDictionary *templates;
@property (nonatomic, readonly) NSArray *touchPoints;
@property (nonatomic, readonly) NSArray *resampledPoints;

- (void)addTouchAtPoint:(CGPoint)point;
- (void)addTouches:(NSSet*)set fromView:(UIView *)view;
- (void)resetTouches;

- (NSString *)findBestMatch;
- (NSString *)findBestMatchCenter:(CGPoint*)outCenter angle:(float*)outRadians score:(float*)outScore;

@end
