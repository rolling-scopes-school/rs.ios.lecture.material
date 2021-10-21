import UIKit

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

var castlesCount = 0
var cottageCount = 0


for house in houses {
    if house is Castle {
        castlesCount += 1
    }
    if house is Cottage {
        cottageCount += 1
    }
}


let realEstate = Cottage(windows: 12, hasGarage: true)
print(realEstate is House)

for house in houses {
    if let item = house as? Cottage {
        print("Cottage has a garge: \(item.hasGarage)")
    }
    
    if house is Castle {
        print("Castle towers counr: \((house as! Castle).towers)")
    }
}
