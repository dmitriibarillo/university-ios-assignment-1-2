#import <Foundation/Foundation.h>
 
#include "Professor.h"
 
@class Department;
 
@interface HeadOfDepartment : Professor
 
@property (nonatomic, readonly) NSArray *subordinates;

- (instancetype)initWithHeadOfDepartment:(Professor *)headOfDepartment;

- (void)addSubordinates:(Professor *)professor;

@end
