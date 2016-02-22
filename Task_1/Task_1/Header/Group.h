#import <Foundation/Foundation.h>

@class Student;

@interface Group : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) NSArray *students;

- (void)addStudent:(Student *)student;

@end