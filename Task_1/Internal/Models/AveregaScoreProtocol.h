#import <Foundation/Foundation.h>

@protocol AveregaScoreProtocol <NSObject>

@required
@property (nonatomic, readonly) float averageScore;

- (void)updateAverageScore;

- (float)calculateAverageScore;

@end
