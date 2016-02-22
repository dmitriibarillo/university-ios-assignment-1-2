#import <Foundation/Foundation.h>
#import "Human.h"

@interface Student : Human

@property (nonatomic, readonly) NSArray *marks;
@property (nonatomic) float averageScore;

- (void)addMark:(NSNumber *)mark;

- (void)updateAverageScore;

@end
