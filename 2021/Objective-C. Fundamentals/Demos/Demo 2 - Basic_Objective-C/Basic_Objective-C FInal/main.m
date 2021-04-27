#import <Foundation/Foundation.h>
#import "RSPerson.h"

int main(int argc, char **argv) {

    @autoreleasepool {
        RSPerson *object = [[RSPerson alloc] initWithName:@"Mike"];

        clock_t start = clock();
        [object sayHello];

        clock_t end = clock();

        printf("First %lu\n", end - start);

        start = clock();
        [object sayHello];

        end = clock();

        printf("Second %lu\n", end - start);
    }

    return 0;
}