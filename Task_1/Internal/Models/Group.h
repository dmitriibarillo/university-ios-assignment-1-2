#import <Foundation/Foundation.h>
#import "AverageScoreProtocol.h"
#import "ParticipantOfEducationProcess.h"

@class Department;

@interface Group : NSObject <AveregaScoreProtocol, ParticipantOfEducationProcess>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) NSArray *students;
@property (nonatomic, readonly) Department *department;

- (instancetype)initWithTitle:(NSString *)title;

@end