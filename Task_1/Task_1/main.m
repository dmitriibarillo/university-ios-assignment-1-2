#import <Foundation/Foundation.h>
#import "Student.h"
#import "Professor.h"
#import "Group.h"
#import "Department.h"
#import "HeadOfDepartment.h"
#import "DepartmentController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
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
        
        NSArray<HeadOfDepartment *> *headOfDepartment =
        @[
          [[HeadOfDepartment alloc] initWithHeadOfDepartment:[professors objectAtIndex:0]],
          [[HeadOfDepartment alloc] initWithHeadOfDepartment:[professors objectAtIndex:1]]
          ];
        
        [[headOfDepartment objectAtIndex:0] addSubordinates:[professors objectAtIndex:2]];
        [[headOfDepartment objectAtIndex:0] addSubordinates:[professors objectAtIndex:3]];
        [[headOfDepartment objectAtIndex:1] addSubordinates:[professors objectAtIndex:3]];
        [[headOfDepartment objectAtIndex:1] addSubordinates:[professors objectAtIndex:4]];
        
        NSArray<Department *> *departments =
        @[
          [[Department alloc] initWithTitle:@"Mathematic" headOfDepartment:[headOfDepartment objectAtIndex:0]],
          [[Department alloc] initWithTitle:@"Information Technology" headOfDepartment:[headOfDepartment objectAtIndex:1]]
          ];
        
        [[departments objectAtIndex:0] addProfessor:[professors objectAtIndex:0]];
        [[departments objectAtIndex:0] addProfessor:[professors objectAtIndex:1]];
        [[departments objectAtIndex:0] addProfessor:[professors objectAtIndex:2]];
        [[departments objectAtIndex:1] addProfessor:[professors objectAtIndex:3]];
        [[departments objectAtIndex:1] addProfessor:[professors objectAtIndex:3]];
        [[departments objectAtIndex:1] addProfessor:[professors objectAtIndex:4]];
        
        NSArray<Group *> *groups =
        @[
          [[Group alloc] initWithTitle:@"1010"],
          [[Group alloc] initWithTitle:@"1011"],
          [[Group alloc] initWithTitle:@"1012"]
          ];
        
        [[groups objectAtIndex:0] addStudent:[students objectAtIndex:0]];
        //[[departments objectAtIndex:0] addGroup:[groups objectAtIndex:0]];
        //[[departments objectAtIndex:0] addGroup:[groups objectAtIndex:1]];
        //[[departments objectAtIndex:1] addGroup:[groups objectAtIndex:2]];
        //[[departments objectAtIndex:1] addGroup:[groups objectAtIndex:3]];
        /*
         for (Student *student in students) {
         for (int i = 0; i < 10; i++) {
         int mark = arc4random_uniform(6);
         [student addMark:[NSNumber numberWithInt:mark]];
         }
         int groupID = arc4random_uniform(3);
         //[[groups objectAtIndex:groupID] addStudent:student];
         
         }
         
         DepartmentController *departmentController = [DepartmentController instance];
         
         for (Department *department in departments) {
         [departmentController addDepartment:department];
         }
         
         for (Department *department in departmentController.departments) {
         NSLog(@"%@", [department description]);
         }
         
         */
        
        NSLog(@"URA");
        
    }
    return 0;
}
