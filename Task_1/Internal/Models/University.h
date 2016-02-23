#import <Foundation/Foundation.h>

@class Department;

@interface University : NSObject

@property (nonatomic, readonly) NSArray *departments;

+ (University *)instance;

- (void)addDepartment:(Department *)department;

@end
