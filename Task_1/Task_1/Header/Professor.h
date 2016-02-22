#import <Foundation/Foundation.h>
#import "Human.h"

@class Student;

@interface Professor : Human

@property (nonatomic) float salary;
@property (nonatomic, readonly) NSArray *students;

- (void)addStudent : (Student *)student;

@end