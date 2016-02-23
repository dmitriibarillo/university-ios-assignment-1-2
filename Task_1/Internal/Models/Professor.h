#import <Foundation/Foundation.h>
#import "ParticipantOfEducationProcess.h"
#import "Human.h"

@class Department;
@class Student;

@interface Professor : Human<ParticipantOfEducationProcess>

@property (nonatomic) float salary;
@property (weak, nonatomic) Department *department;
@property (nonatomic, readonly) NSArray *students;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age salary:(float)salary;
	
@end