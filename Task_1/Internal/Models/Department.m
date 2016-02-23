#import "Department.h"
#import "Professor.h"
#import "Group.h"

@interface Department ()

@property (nonatomic, readwrite) float averageScore;
@property (nonatomic, readwrite) Professor *headOfDepartment;
@property (nonatomic, readwrite) NSArray *professors;
@property (nonatomic, readwrite) NSArray *groups;

@end

@implementation Department

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _title = title;
        _professors = [NSArray array];
        _groups = [NSArray array];
    }
    
    return self;
}

- (void)setMaster:(id<ParticipantOfEducationProcess>)master
{
    if ([master isKindOfClass:[Professor class]]) {
        _headOfDepartment = (Professor *)master;
    }
}

- (void)addSlave:(id<ParticipantOfEducationProcess>)slave
{
    if ([slave isKindOfClass:[Professor class]]) {
        self.professors = [self.professors arrayByAddingObject:slave];
    }
    
    if ([slave isKindOfClass:[Group class]]) {
        self.groups = [self.groups arrayByAddingObject:slave];
        
        [self updateAverageScore];
    }
}

- (void)removeSlave:(id<ParticipantOfEducationProcess>)slave
{
    if ([slave isKindOfClass:[Professor class]]) {
        NSMutableArray *temp = [NSMutableArray arrayWithArray:_professors];
        [temp removeObject:slave];
        _professors = [NSArray arrayWithArray:temp];
    }
    
    if ([slave isKindOfClass:[Group class]]) {
        NSMutableArray *temp = [NSMutableArray arrayWithArray:_groups];
        [temp removeObject:slave];
        _groups = [NSArray arrayWithArray:temp];
        
        [self updateAverageScore];
    }
}

- (void)updateAverageScore
{
    _averageScore = [self calculateAverageScore];
}

- (float)calculateAverageScore
{
    float sum = 0;
    for (Group *group in self.groups) {
        sum += group.averageScore;
    }
    
    unsigned long countOfElements = [self.groups count];
    float averageScore = ( countOfElements > 0) ? (sum / countOfElements) : 0;
    
    return averageScore;
}



-(NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat : @"Department %@ \n", self.title];
    [description appendFormat : @"Head of department : %@ %@\n", self.headOfDepartment.firstName, self.headOfDepartment.lastName];
    
    [description appendString: @"Head of department subordinates :  \n"];
    
    for (Professor *professor in self.professors) {
        [description appendFormat:@"\t%@ %@ \n", professor.firstName, professor.lastName];
    }
    
    [description appendString: @"Professors in the department : \n"];
    
    for (Professor *professor in self.professors) {
        [description appendFormat:@"\t%@ %@ \n", professor.firstName, professor.lastName];
    }
    
    [description appendString: @"Groups in the department : \n"];
    
    for (Group *group in self.groups) {
        [description appendFormat : @"\t%@\n", [	group description]];
    }
    
    return description;
}

@end