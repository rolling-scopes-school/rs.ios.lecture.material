class House {
    let windows: Int
    
    init(windows: Int) {
        self.windows = windows
    }
}

class Castle: House {
    let towers: Int
    
    init(windows: Int, towers: Int) {
        self.towers = towers
        super.init(windows: windows)
    }
}

class Cottage: House {
    let hasGarage: Bool
    
    init(windows: Int, hasGarage: Bool) {
        self.hasGarage = hasGarage
        super.init(windows: windows)
    }
}

let houses = [
    Cottage(windows: 12, hasGarage: true),
    Cottage(windows: 10, hasGarage: false),
    Castle(windows: 200, towers: 5)
]

var countCastles = 0
var countCottages = 0

for house in houses {
    if house is Castle {
        countCastles += 1
    } else if house is Cottage {
        countCottages += 1
    }
}

print("castles: \(countCastles), cottages: \(countCottages)")
