#import "HeadOfDepartment.h"

@interface HeadOfDepartment ()

@property (nonatomic, readwrite) NSArray *subordinates;

@end

@implementation HeadOfDepartment

- (instancetype)initWithHeadOfDepartment:(Professor *)headOfDepartment
{
    self = [super initWithFirstName:headOfDepartment.firstName lastName:headOfDepartment.lastName age:headOfDepartment.age];
    if (self) {
        self.subordinates = [NSArray array];
    }
    
    return self;
}

- (void)addSubordinates:(Professor *)professor
{
    self.subordinates = [self.subordinates arrayByAddingObject:professor];
}

- (NSString *)description
{
    NSMutableString *description = [NSMutableString stringWithFormat:@"Head of department : %@ %@\n", self.firstName, self.lastName];
    
    [description appendString: @"Head of department subordinates :  \n"];
    
    for (Professor *professor in self.subordinates) {
        [description appendFormat:@"\t%@ %@ \n", professor.firstName, professor.lastName];
    }
    
    [description appendString: @"Professors in the department : \n"];
    
    return description;
}

@end
