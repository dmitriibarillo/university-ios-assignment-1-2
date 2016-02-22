#import "Department.h"
#import "Professor.h"
#import "Group.h"
#import "Observer.h"

@interface Department ()

@property (nonatomic, readwrite) float averageScore;
@property (nonatomic, readwrite) NSArray *professors;
@property (nonatomic, readwrite) NSArray *groups;

@end

@implementation Department

- (instancetype)initWithTitle:(NSString *)title headOfDepartment:(HeadOfDepartment *)headOfDepartment
{
    self = [super init];
    if (self) {
        self.title = title;
        self.headOfDepartment = headOfDepartment;
        self.professors = [NSArray array];
        self.groups = [NSArray array];
    }
    
    return self;
}

- (void)addProfessor:(Professor *)professor
{
    self.professors = [self.professors arrayByAddingObject:professor];
}

-(void)addGroup:(Group *)group {
    self.groups = [self.groups arrayByAddingObject:group];
    [group addObserver:self];
    
    [self updateAverageScore];
}

- (float)averageScore
{
    return self.averageScore;
}

- (void)updateAverageScore
{
    self.averageScore = [self calculateAverageScore];
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

- (void)changeScore:(id<Observable>)observable
{
    [self updateAverageScore];
}

-(NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat : @"Department %@ \n", self.title];
    [description appendFormat : @"Head of department : %@ \n", self.headOfDepartment];
    
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