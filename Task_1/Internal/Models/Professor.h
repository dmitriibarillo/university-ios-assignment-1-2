#import <Foundation/Foundation.h>
#import "Human.h"

@class Student;

@interface Professor : Human

@property (nonatomic) float salary;
@property (nonatomic, readonly) NSArray *students;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age salary:(float)salary;

- (void)addStudent:(Student *)student;

@end