#import <Foundation/Foundation.h>
#import "AveregaScoreProtocol.h"
#import "Observer.h"
#import "Observable.h"

@class Student;

@interface Group : NSObject<AveregaScoreProtocol, Observer, Observable>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, readonly) NSArray *students;

- (void)addStudent:(Student *)student;

@end