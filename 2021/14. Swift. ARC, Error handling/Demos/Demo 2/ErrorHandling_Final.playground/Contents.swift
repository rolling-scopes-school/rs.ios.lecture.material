import UIKit

enum ValidationError: Error {
    case tooLong
    case tooShort
    case invalidCharacter(Character)
}

func uppercasedNamed(_ name: String) throws -> String {
    guard name.count > 3 else {
        throw ValidationError.tooShort
    }
    
    guard name.count < 10 else {
        throw ValidationError.tooLong
    }
    
    for character in name {
        guard character.isLetter else {
            throw ValidationError.invalidCharacter(character)
        }
    }
    
    return name.uppercased()
}

print("--- checkDoCatch")

func checkDoCatch() {
    do {
        try uppercasedNamed("Jo11")
    } catch ValidationError.invalidCharacter(let char) {
        print("Invalid character: \(char)")
    } catch {
        print("Another Error = \(error)")
    }
}

checkDoCatch()

print("--- checkOptionalTry")

func checkOptionalTry() {
    guard let result = try? uppercasedNamed("John") else {
        print("An error has occured")
        return
    }
    print("Result = \(result)")
}

checkOptionalTry()

print("--- checkForcedTry")

func checkForcedTry() {
    let result = try! uppercasedNamed("John")
    print("Result = \(result)")
}

checkForcedTry()

print("--- Propagating error")

func method1(name: String) throws {
    do {
        try uppercasedNamed(name)
    } catch ValidationError.tooShort {
        print("method1: Too short")
    }
}

func method2(name: String) {
    do {
        try method1(name: name)
    } catch ValidationError.tooShort {
        print("method2: Too short")
    } catch {
        print("method2: An error has occured")
    }
}

method2(name: "John23")
