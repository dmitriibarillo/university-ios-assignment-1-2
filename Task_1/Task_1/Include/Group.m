#import "Group.h"
#import "Student.

@interface Group ()

@property (nonatomic, readwrite) NSArray *students;

@end

@implementation Group

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.title = title;
        self.students = [NSArray array];
    }
    
    return self;
}

- (void)addStudent:(Student *)student
{
    self.students = [self.students arrayByAddingObject:student];
}

-(NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat : @"Group %@ \n", self.title];
    [description appendFormat : @"Students in the group \n"];
    
    for (Student *student in self.students) {
        [description appendFormat:@"\t%@ %@ : %f \n", student.firstName, student.lastName, student.averageScore];
    }
    
    return description;
}

@end