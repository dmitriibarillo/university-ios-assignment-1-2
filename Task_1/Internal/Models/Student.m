#import "Student.h"
#import "Group.h"

@interface Student ()

@property (nonatomic, readwrite) NSArray *marks;

@end

@implementation Student

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age
{
    self = [super initWithFirstName:firstName lastName:lastName age:age];
    if (self) {
        _marks = [NSArray array];
    }
    
    return self;
}

- (void)setMaster:(id<ParticipantOfEducationProcess>)master {
    if ([master isKindOfClass:[Group class]]) {
        _group = (Group *)master;
    }
}

- (void)addMark:(NSNumber *)mark
{
    self.marks = [self.marks arrayByAddingObject:mark];
    [self updateAverageScore];
}
	
- (void)updateAverageScore
{
    _averageScore = [self calculateAverageScore];
    [self.group updateAverageScore];
}

- (float)calculateAverageScore
{
    float sum = 0;
    for (NSNumber *val in self.marks) {
        sum += val.intValue;
    }
    
    unsigned long countOfElements = [self.marks count];
    float averageScore = ( countOfElements > 0) ? (sum / countOfElements) : 0;
    
    return averageScore;
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat: @"Student %@ %@ \n ", self.firstName, self.lastName];
    [description appendFormat: @"age : %d \n", self.age];
    [description appendFormat: @"Average score : %f \n", self.averageScore];
    
    return description;
}

@end