import UIKit

protocol RSSwiftProtocol {
    var readWriteString: String { get set }
    var readOnlyInt: Int { get }
    
    func method()
    func doSomething(action: String)
    
    static var constValue: String { get }
}

extension RSSwiftProtocol {
    func method() {
        print("method \"method()\" was called")
    }
    
    func doSomething(action: String) {
        print("method \"doSomething\" did \(action)")
    }
}

class RSSwiftClass: RSSwiftProtocol {
    var readWriteString: String = "Default"
    let readOnlyInt = 42
    
    class var constValue: String { "Class readonly property" }
    
    func doSomething(action: String) {
        print("CUSTOM method \"doSomething\" did \(action)")
    }
}

let exampleClass = RSSwiftClass()
exampleClass.readWriteString = "New value"
// exampleClass.readOnlyInt = 123

exampleClass.method()
exampleClass.doSomething(action: "Write test")

struct RSSwiftStruct: RSSwiftProtocol {
    static let constValue: String = "Struct const"
    
    var readWriteString: String
    let readOnlyInt: Int
}

var exampleStruct = RSSwiftStruct(readWriteString: "Default", readOnlyInt: 34)
exampleStruct.readWriteString = "New value"
// exampleStruct.readOnlyInt = 123
exampleStruct.method()
exampleStruct.doSomething(action: "Another action")

enum RSSwiftEnum: RSSwiftProtocol {
    case singleCase
    
    static let constValue: String = "Enum const"
    
    var readWriteString: String {
        get {
            "This is enum"
        }
        set {
            // empty
        }
    }
    
    var readOnlyInt: Int {
        123 * 321
    }
}

var exampleEnum = RSSwiftEnum.singleCase
exampleEnum.readWriteString = "New value"
let product = exampleEnum.readOnlyInt
print(product)
exampleEnum.method()
exampleEnum.doSomething(action: "Enum action")

class RSSwiftClassChild: RSSwiftClass {
    override class var constValue: String { "Overritten \(super.constValue)"}
}

print(RSSwiftClass.constValue)
print(RSSwiftClassChild.constValue)

class Parent {
    let name: String
    weak var delegate: ParentDelegate?
    
    init(name: String) {
        self.name = name
    }
}

protocol ParentDelegate: AnyObject {
    func doWork(for parent: Parent, action: String)
}

class Child: ParentDelegate {
    let name: String
    let parent: Parent
    
    init(name: String, parent: Parent) {
        self.name = name
        self.parent = parent
    }
    
    func doWork(for parent: Parent, action: String) {
        print("cry")
        print("\(parent.name), I don't want to \(action)")
        print("Child does \(action)")
    }
}

let andrew = Parent(name: "Andrew")
let littleAndrew = Child(name: "Andrew Jr.", parent: andrew)

andrew.delegate = littleAndrew
andrew.delegate?.doWork(for: andrew, action: "Do homework")

class CheckInheritance: RSSwiftProtocol, ParentDelegate {
    var readWriteString: String = "string"
    
    var readOnlyInt: Int = 123
    
    static var constValue: String = "123"
    
    func doWork(for parent: Parent, action: String) { }
}

func testComposition(check: RSSwiftProtocol & ParentDelegate) {
    print(check)
}

testComposition(check: CheckInheritance())

