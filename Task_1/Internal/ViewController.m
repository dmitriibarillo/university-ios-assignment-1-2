#import "ViewController.h"
#import "Student.h"
#import "Professor.h"
#import "Group.h"
#import "Department.h"
#import "University.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray<Student *> *students =
    @[
      [[Student alloc] initWithFirstName:@"Jack" lastName:@"Smith" age:18],
      [[Student alloc] initWithFirstName:@"Oliver" lastName:@"Johnson" age:20],
      [[Student alloc] initWithFirstName:@"Charlie" lastName:@"Brown" age:27],
      [[Student alloc] initWithFirstName:@"Emily" lastName:@"Miller" age:23],
      [[Student alloc] initWithFirstName:@"William" lastName:@"Moore" age:24],
      [[Student alloc] initWithFirstName:@"James" lastName:@"Taylor" age:17],
      [[Student alloc] initWithFirstName:@"Daniel" lastName:@"Backer" age:30],
      [[Student alloc] initWithFirstName:@"Jason" lastName:@"Brown" age:28],
      [[Student alloc] initWithFirstName:@"Lily" lastName:@"Brooks" age:24]
    ];
    
    NSArray<Professor *> *professors =
    @[
      [[Professor alloc] initWithFirstName:@"Jennifer" lastName:@"Birch" age:43],
      [[Professor alloc] initWithFirstName:@"Jacob" lastName:@"Bootman" age:60],
      [[Professor alloc] initWithFirstName:@"Henry" lastName:@"Brooks" age:54],
      [[Professor alloc] initWithFirstName:@"Aria" lastName:@"Clifford" age:36],
      [[Professor alloc] initWithFirstName:@"Chloe" lastName:@"Crossman" age:40]
    ];
    
    NSArray<Department *> *departments =
    @[
      [[Department alloc] initWithTitle:@"Mathematic"],
      [[Department alloc] initWithTitle:@"Information Technology"]
    ];
    
    
    [departments[0] setMaster:professors[0]];
    [departments[1] setMaster:professors[1]];
    
    [departments[0] addSlave:professors[0]];
    [departments[0] addSlave:professors[2]];
    [departments[0] addSlave:professors[3]];
    [departments[1] addSlave:professors[1]];
    [departments[1] addSlave:professors[4]];

    
    NSArray<Group *> *groups =
    @[
      [[Group alloc] initWithTitle:@"1010"],
      [[Group alloc] initWithTitle:@"1011"],
      [[Group alloc] initWithTitle:@"1012"]
     ];
    
    [departments[0] addSlave:groups[0]];
    [departments[0] addSlave:groups[1]];
    [departments[0] addSlave:groups[2]];
    
    for (Student *student in students) {
        for (int i = 0; i < 10; i++) {
            int mark = arc4random_uniform(6);
            [student addMark:[NSNumber numberWithInt:mark]];
        }
        int groupID = arc4random_uniform(3);
        [groups [groupID] addSlave:student];
    }
        
    University *university = [University instance];
         
    for (Department *department in departments) {
        [university addDepartment:department];
    }
         
    for (Department *department in university.departments) {
         NSLog(@"%@", [department description]);
    }
         


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
