#import <Foundation/Foundation.h>

@protocol Observable;

@protocol Observer <NSObject>

- (void)changeScore:(id<Observable>)observable;

@end