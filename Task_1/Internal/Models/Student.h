#import <Foundation/Foundation.h>
#import "AveregaScoreProtocol.h"
#import "Observable.h"
#import "Human.h"

@interface Student : Human<AveregaScoreProtocol, Observable>

@property (nonatomic, readonly) NSArray *marks;

- (void)addMark:(NSNumber *)mark;

@end
