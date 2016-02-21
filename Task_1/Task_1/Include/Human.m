#import "Human.h"

@implementation Human

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName age:(int)age
{
    self = [super init];
    if (self) {
        _firstName = firstName;
        _lastName = lastName;
        _age = age;
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat: @"%@ %@ : (%d) \n ", self.firstName, self.lastName, self.age];
}

@end