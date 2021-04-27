#import <Foundation/Foundation.h>
#import "RSPort.h"
#import "RSCar.h"
#import "RSSpaceship.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        RSPort *port = [RSPort new];

        RSPassenger *crewMate = [[RSPassenger alloc] initWithName:@"Mike"];
        RSCar *car = [[RSCar alloc] initWithCrew:@[crewMate]];
        [port launchVehicle:car];

        RSSpaceship *spaceship = [[RSSpaceship alloc] initWithCrew:@[
            [[RSPassenger alloc] initWithName:@"Eric"],
            [[RSPassenger alloc] initWithName:@"Martin"],
            [[RSPassenger alloc] initWithName:@"Salma"],
            [[RSPassenger alloc] initWithName:@"Petti"],
            [[RSPassenger alloc] initWithName:@"Bucky"]
        ]];
        [port launchVehicle:spaceship];
        
        [spaceship antology];
    }
    return 0;
}
