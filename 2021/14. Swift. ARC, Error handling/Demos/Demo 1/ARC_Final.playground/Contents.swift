import UIKit
import Foundation

class Ship {
    weak var cargo: Cargo?
    
    lazy var unloadCargo = { [unowned self] in
        print("Unload cargo: \(self.cargo?.name ?? "")")
    }

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
    ship1 = Ship()
    ship2 = ship1
    ship3 = ship1
    
    ship3 = nil
    ship2 = nil
    ship1 = nil
}

referenceDemo()

print("--- Finish Reference demo")

print("--- Retain cycle demo")

var ship: Ship?
var cargo: Cargo?

func retainCycleDemo() {
    ship = Ship()
    cargo = Cargo(name: "Cargo")
    ship?.cargo = cargo
    cargo?.ship = ship
}

retainCycleDemo()

cargo = nil
ship = nil

print("--- Finish Retain cycle demo")

print("--- Retain cycle with closures demo")

func retainCycleWithClosureDemo() {
    let ship = Ship()
    let cargo = Cargo(name: "Cargo")
    ship.cargo = cargo
    cargo.ship = ship
    ship.unloadCargo()
}

retainCycleWithClosureDemo()

print("--- Finish Retain cycle with closures demo")


