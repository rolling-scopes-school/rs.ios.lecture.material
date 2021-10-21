import UIKit

enum ValidationError: Error {
    case tooLong
    case tooShort
    case invalidChar(Character)
}

func uppercassedNamed(_ name: String) throws -> String {
    guard name.count > 3 else {
        throw ValidationError.tooShort
    }
    
    guard name.count < 10 else {
        throw ValidationError.tooLong
    }
    
    for chars in name {
        guard chars.isLetter else {
            throw ValidationError.invalidChar(chars)
        }
    }
    
    return name.uppercased()
}

print("--- checkDoCatch")

func checkDoCatch() {
    do {
        try uppercassedNamed("Jo")
    } catch ValidationError.invalidChar(let char) {
        print("Invalid char: \(char)")
    } catch {
        print("Another error = \(error)")
    }

}

checkDoCatch()

print("--- checkOptionalTry")

func checkOptionalTry() {
    guard let result = try? uppercassedNamed("John") else {
        print("An error")
        return
    }
    print("Result = \(result)")

}

checkOptionalTry()

print("--- checkForcedTry")

func checkForcedTry() {
    let result = try! uppercassedNamed("John")
    print("Result = \(result)")
}

checkForcedTry()

print("--- Propagating error")

func method1(name: String) throws {
    do {
        try uppercassedNamed(name)
    } catch ValidationError.tooShort {
        print("method1: Too short")
    }
}

func method2(name: String) {
    do {
        try method1(name: name)
    } catch ValidationError.tooShort {
        print("Method2: too short")
    } catch {
        print("method2: An error")
    }
}

method2(name: "John")
