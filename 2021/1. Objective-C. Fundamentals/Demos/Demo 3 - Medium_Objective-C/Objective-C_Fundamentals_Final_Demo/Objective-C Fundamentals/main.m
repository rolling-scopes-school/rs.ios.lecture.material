#import <Foundation/Foundation.h>
#import "RSCarPort.h"
#import "RSPassenger+RandomGeneratable.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        RSCarPort *carPort = [RSCarPort new];
        
        RSPassenger *captain = [[RSPassenger alloc] initWithName:@"Mike"];
        RSCar *mikeCar = [[RSCar alloc] initWithPassenger:captain];
        
        [carPort launchCar:mikeCar];
        
        [carPort enter:captain];
        [carPort enter:mikeCar];
        
        [captain sayHello];
    }
    return 0;
}
