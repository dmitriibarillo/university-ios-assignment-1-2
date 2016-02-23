#import "Professor.h"
#import "Department.h"
#import "Student.h"

@interface Professor ()

@property (nonatomic, readwrite) NSArray *students;

@end

@implementation Professor

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age salary:(float)salary
{
    self = [super initWithFirstName:firstName lastName:lastName age:age];
    if (self) {
        _salary = salary;
        _students = [NSArray array];
    }
    
    return self;
}

- (void) setMaster:(id<ParticipantOfEducationProcess>)master
{
    if ([master isKindOfClass:[Department class]]) {
        _department = (Department *)master;
    }
}

- (void)addSlave:(id<ParticipantOfEducationProcess>)slave
{
    if ([slave isKindOfClass:[Student class]]) {
        _students = [self.students arrayByAddingObject:slave];
    }
}

- (void)removeSlave:(id<ParticipantOfEducationProcess>)slave
{
    if ([slave isKindOfClass:[Student class]]) {
        NSMutableArray *temp = [NSMutableArray arrayWithArray:_students];
        [temp removeObject:slave];
        _students = [NSArray arrayWithArray:temp];
    }
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat: @"Professor %@ %@ \n", self.firstName, self.lastName];
    [description appendFormat: @"age : %d \n", self.age];
    [description appendFormat: @"Salary : %f \n", self.salary];
    [description appendFormat: @"Subordinate students: \n"];
    
    for (Student *student in self.students) {
        [description appendFormat:@"\t[%@ %@ : %f]\n", student.firstName, student.lastName, student.averageScore];
    }
    
    return description;
}

@end