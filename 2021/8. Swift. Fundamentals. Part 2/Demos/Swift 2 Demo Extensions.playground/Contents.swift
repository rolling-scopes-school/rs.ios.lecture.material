import UIKit

class RSSwiftClass {
    var storedProperty: String = "Stored"
    
    func methodA() {
        print("a")
    }
}

extension RSSwiftClass {
    var computedString: String { "Computed" }
    
    var storedFromExtension: String {
        get { storedProperty }
        set(value) { storedProperty = value }
    }
}

let swiftClass = RSSwiftClass()

print(swiftClass.storedProperty)
print(swiftClass.computedString)
print(swiftClass.storedFromExtension)

swiftClass.storedFromExtension = "Updated"

print(swiftClass.storedProperty)
print(swiftClass.computedString)
print(swiftClass.storedFromExtension)

//extension RSSwiftClass {
//    override func methodA() {
//        print("b")
//    }
//}

protocol RSSwiftProtocol {
    func method() -> String
}

extension RSSwiftProtocol {
    func method() -> String {
        "From protocol extension"
    }
}

extension RSSwiftClass: RSSwiftProtocol {
    func method() -> String {
        "From RSSwiftClass"
    }
}

print(swiftClass.method())

class RSSwiftClass2 { }
extension RSSwiftClass2: RSSwiftProtocol { }

let swiftClass2 = RSSwiftClass2()
print(swiftClass2.method())

extension RSSwiftClass {
    convenience init(int: Int) {
        self.init()
    }
}

struct RSSwiftStruct {
    var width: Int
    var height: Int
}

extension RSSwiftStruct {
    init(size: Int) {
        width = size
        height = size
    }
}

extension RSSwiftStruct {
    mutating func increaseWidth(by value: Int) {
        width = width + value
    }
}

var swiftStruct = RSSwiftStruct(size: 5)
print(swiftStruct.width)
swiftStruct.increaseWidth(by: 10)
print(swiftStruct.width)

class Sequence {
    var sequence: [IntNumber] = []
}

extension Sequence {
    subscript(index: Int) -> IntNumber {
        sequence[index]
    }
}

let sequence = Sequence()
sequence.sequence = [
    Sequence.IntNumber(value: 0, stringRepresentation: "Zero"),
    Sequence.IntNumber(value: 1, stringRepresentation: "One"),
    Sequence.IntNumber(value: 2, stringRepresentation: "Two")
]

print(sequence[1])

extension Sequence {
    struct IntNumber {
        let value: Int
        let stringRepresentation: String
    }
}
