#import <Foundation/Foundation.h>

@protocol ParticipantOfEducationProcess <NSObject>

@optional
- (void)setMaster:(id<ParticipantOfEducationProcess>)master;

- (void)addSlave:(id<ParticipantOfEducationProcess>)slave;

- (void)removeSlave:(id<ParticipantOfEducationProcess>)slave;

@end
