import UIKit

enum Airport: String {
    case munich = "MUC"
    case sanFrancisco = "SFO"
    case singapore = "SIN"
}

let sfAirport = Airport.sanFrancisco
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
            return "Sun"
        case .cloud:
            return "Cloud"
        case .wind(let speed):
            return "Wind. Speed is \(speed)"
        case .snow:
            return "Snow"
        }
    }
}

let sunWeather = WeatherType.sun
print(sunWeather.description)

let windWeather: WeatherType = .wind(25)
print(windWeather.description)
