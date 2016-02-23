#import <Foundation/Foundation.h>
#import "AveregaScoreProtocol.h"
#import "ParticipantOfEducationProcess.h"
#import "Human.h"

@class Group;

@interface Student : Human<AveregaScoreProtocol, ParticipantOfEducationProcess>

@property (nonatomic, readonly) Group *group;
@property (nonatomic, readonly) NSArray *marks;
@property (nonatomic, readonly) float averageScore;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age;

- (void)addMark:(NSNumber *)mark;

@end
