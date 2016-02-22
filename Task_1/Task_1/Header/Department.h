#import <Foundation/Foundation.h>

@class HeadOfDepartment;
@class Professor;
@class Group;

@interface Department : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic) HeadOfDepartment *headOfDepartment;
@property (nonatomic, readonly) NSArray *professors;
@property (nonatomic, readonly) NSArray *groups;

- (void)addProfessor:(Professor *)professor;

- (void)addGroup:(Group *)group;

@end
