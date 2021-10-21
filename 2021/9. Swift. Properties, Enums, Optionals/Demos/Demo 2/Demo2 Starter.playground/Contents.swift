import UIKit

enum Airport: String {
    case munich = "MUC"
    case sanfrancisco = "SFO"
    case singapore = "SIN"
}

let sfAirport = Airport.sanfrancisco
print(sfAirport.rawValue)

let minskAirport = Airport(rawValue: "MSQ")
let singaporeAirport = Airport(rawValue: "SIN")

enum WeatherType {
    case sun
    case cloud
    case wind(Int)
    case snow
    
    var description: String {
        switch self {
        case .sun:
            return "Sunny"
        case .cloud:
            return "Cloud"
        case .wind(let speed):
            return "Wind. Speed is \(speed)"
        case .snow:
            return "Snow"
        }
    }
}

let sunWeather = WeatherType.sun.description

let windWeather = WeatherType.wind(25).description 


