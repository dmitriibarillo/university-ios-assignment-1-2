#import "DepartmentController.h"

@interface DepartmentController ()

@property (nonatomic, readwrite) NSArray *departments;

@end

@implementation DepartmentController

+ (DepartmentController *)instance
{
    static DepartmentController *instance = nil;
    
    @synchronized(self) {
        if (instance == nil) {
            instance = [[DepartmentController alloc] init];
        }
    }
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _departments = [NSArray array];
    }
    
    return self;
}

- (void)addDepartment:(Department *)department
{
    self.departments = [self.departments arrayByAddingObject:department];
}

@end

