#import <Foundation/Foundation.h>

@class Department;

@interface DepartmentController : NSObject

@property (nonatomic, readonly) NSArray *departments;

+ (DepartmentController *)instance;

- (void)addDepartment:(Department *)department;

@end
