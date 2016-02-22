#import "Student.h"
#import "Observer.h"

@interface Student ()

@property (nonatomic, readwrite) NSArray *marks;
@property (nonatomic, readwrite) NSMutableSet *observers;
@property (nonatomic, readwrite) float averageScore;

@end


@implementation Student

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age
{
    self = [super initWithFirstName:firstName lastName:lastName age:age];
    if (self) {
        self.marks = [NSArray array];
        self.observers = [[NSMutableSet alloc] init];
    }
    
    return self;
}

- (void)addMark:(NSNumber *)mark
{
    self.marks = [self.marks arrayByAddingObject:mark];
    [self updateAverageScore];
    
    [self notifyAll];
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
    for (NSNumber *val in self.marks) {
        sum += val.intValue;
    }
    
    unsigned long countOfElements = [self.marks count];
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

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat: @"Student %@ %@ \n ", self.firstName, self.lastName];
    [description appendFormat: @"age : %d \n", self.age];
    [description appendFormat: @"Average score : %f \n", self.averageScore];
    
    return description;
}

@end