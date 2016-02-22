#import "Professor.h"
#import "Student.h"

@interface Professor ()

@property (nonatomic, readwrite) NSArray *students;

@end

@implementation Professor

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age salary:(float)salary
{
    self = [super initWithFirstName:firstName lastName:lastName age:age];
    if (self) {
        self.salary = salary;
        self.students = [NSArray array];
    }
    
    return self;
}

- (void)addStudent:(Student *)student
{
    self.students = [self.students arrayByAddingObject:student];
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat: @"Professor %@ %@ \n ", self.firstName, self.lastName];
    [description appendFormat: @"age : %d \n", self.age];
    [description appendFormat: @"Salary : %f \n", self.salary];
    [description appendFormat: @"Subordinate students: \n"];
    
    for (Student *student in self.students) {
        [description appendFormat:@"\t%@ %@ : %f \n", student.firstName, student.lastName, student.averageScore];
    }
    
    return description;
}

@end