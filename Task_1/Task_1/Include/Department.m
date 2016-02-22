#import "Department.h"
#import "Professor.h"
#import "Group.h"

@interface Department ()

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
        [description appendFormat : @"\t%@\n", [group description]];
    }
    
    
    return description;
}

@end