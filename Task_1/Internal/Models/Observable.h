#import <Foundation/Foundation.h>
#import "Observer.h"

@protocol Observable <NSObject>

- (void)addObserver:(id<Observer>)observer;

- (void)removeObserver:(id<Observer>)observer;

- (void)notifyAll;

@end
