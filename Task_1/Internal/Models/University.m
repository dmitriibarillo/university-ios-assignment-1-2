#import "University.h"

@interface University ()

@property (nonatomic, readwrite) NSArray *departments;

@end

@implementation University

+ (University *)instance
{
    static University *instance = nil;
    
    @synchronized(self) {
        if (instance == nil) {
            instance = [[University alloc] init];
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
    _departments = [self.departments arrayByAddingObject:department];
}

@end

