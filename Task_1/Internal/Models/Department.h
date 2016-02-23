#import <Foundation/Foundation.h>
#import "AveregaScoreProtocol.h"
#import "ParticipantOfEducationProcess.h"

@class Professor;

@interface Department : NSObject<AveregaScoreProtocol, ParticipantOfEducationProcess>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) Professor *headOfDepartment;
@property (nonatomic, readonly) NSArray *professors;
@property (nonatomic, readonly) NSArray *groups;

- (instancetype)initWithTitle:(NSString *)title;

@end
