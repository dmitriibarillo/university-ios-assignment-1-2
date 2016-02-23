#import "Group.h"
#import "Student.h"
#import "Department.h"


@interface Group ()

@property (weak, nonatomic, readwrite) Department *department;
@property (nonatomic, readwrite) NSArray *students;
@property (nonatomic, readwrite) float averageScore;

@end

@implementation Group

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _title = title;
        _students = [NSArray array];
    }
    
    return self;
}

- (void)setMaster:(id<ParticipantOfEducationProcess>)master
{
    if ([master isKindOfClass:[Department class]]) {
        _department = (Department *)master;
    }
}

- (void)addSlave:(id<ParticipantOfEducationProcess>)slave
{
    if ([slave isKindOfClass:[Student class]]) {
        self.students = [self.students arrayByAddingObject:slave];
        
        [self updateAverageScore];
    }
}

- (void)removeSlave:(id<ParticipantOfEducationProcess>)slave
{
    if ([slave isKindOfClass:[Student class]]) {
        NSMutableArray *temp = [NSMutableArray arrayWithArray:_students];
        [temp removeObject:slave];
        _students = [NSArray arrayWithArray:temp];
        
        [self updateAverageScore];
    }
}

- (float)averageScore
{
    return _averageScore;
}

- (void)updateAverageScore
{
    _averageScore = [self calculateAverageScore];
    [self.department updateAverageScore];
}

- (float)calculateAverageScore
{
    float sum = 0;
    for (Student *student in self.students) {
        sum += student.averageScore;
    }
    
    unsigned long countOfElements = [self.students count];
    float averageScore = ( countOfElements > 0) ? (sum / countOfElements) : 0;
    
    return averageScore;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat : @"Group %@ \n", self.title];
    [description appendFormat : @"Students in the group \n"];
    
    for (Student *student in self.students) {
        [description appendFormat:@"\t%@ %@ : %f \n", student.firstName, student.lastName, student.averageScore];
    }
    
    return description;
}

@end