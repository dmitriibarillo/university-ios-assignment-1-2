#import <Foundation/Foundation.h>
#import "AveregaScoreProtocol.h"
#import "Observer.h"
#import "Observable.h"

@class HeadOfDepartment;
@class Professor;
@class Group;

@interface Department : NSObject<AveregaScoreProtocol, Observer>

@property (nonatomic, copy) NSString *title;
@property (nonatomic) HeadOfDepartment *headOfDepartment;
@property (nonatomic, readonly) NSArray *professors;
@property (nonatomic, readonly) NSArray *groups;

- (void)addProfessor:(Professor *)professor;

- (void)addGroup:(Group *)group;

@end
