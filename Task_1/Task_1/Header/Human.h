#import <Foundation/Foundation.h>

@interface Human : NSObject

@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic) int age;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age;

@end
