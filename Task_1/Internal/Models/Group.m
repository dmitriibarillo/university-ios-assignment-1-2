#import "Group.h"
#import "Student.h"
#import "Observer.h"

@interface Group ()

@property (nonatomic, readwrite) NSArray *students;
@property (nonatomic, readwrite) NSMutableSet *observers;
@property (nonatomic, readwrite) float averageScore;

@end

@implementation Group

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        _title = title;
        _students = [NSArray array];
        _observers = [[NSMutableSet alloc] init];
    }
    
    return self;
}

- (void)addStudent:(Student *)student
{
    self.students = [self.students arrayByAddingObject:student];
    [student addObserver:self];
    
    [self updateAverageScore];
}

- (float)averageScore
{
    return _averageScore;
}

- (void)updateAverageScore
{
    self.averageScore = [self calculateAverageScore];
    [self changeScore:self];
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

- (void)addObserver:(id<Observer>)observer
{
    [self.observers addObject:observer];
}

- (void)removeObserver:(id<Observer>)observer
{
    [self.observers removeObject:observer];
}

- (void)notifyAll
{
    for (id<Observer> observer in self.observers) {
        [observer changeScore:self];
    }
}

- (void)changeScore:(id<Observable>)observable
{
    [self notifyAll];
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