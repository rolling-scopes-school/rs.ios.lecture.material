import UIKit
import Foundation

class Ship {
    var cargo: Cargo?

    init() {
        print("Ship is initialized")
    }

    deinit {
        print("Ship is deinitialized")
    }
}

class Cargo {
    let name: String
    var ship: Ship?

    init(name: String) {
        print("Cargo is initialized")
        self.name = name
    }

    deinit {
        print("Cargo is deinitialized")
    }
}

print("--- Reference demo")

var ship1: Ship?
var ship2: Ship?
var ship3: Ship?

func referenceDemo() {

}

referenceDemo()

print("--- Finish Reference demo")

print("--- Retain cycle demo")

var ship: Ship?
var cargo: Cargo?

func retainCycleDemo() {

}

retainCycleDemo()

print("--- Finish Retain cycle demo")

print("--- Retain cycle with closures demo")

func retainCycleWithClosureDemo() {
    
}

retainCycleWithClosureDemo()

print("--- Finish Retain cycle with closures demo")


