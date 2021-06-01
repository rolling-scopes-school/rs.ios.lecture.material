import UIKit

var hello: String?
//print(hello!)
hello = "Hello"
print(hello)

var helloAgain: String?
if let unwrappedHelloAgain = helloAgain {
    print("unwrappedHelloAgain = \(unwrappedHelloAgain)")
} else {
    print("There is no value for helloAgain")
}
helloAgain = "Hello again"
if let unwrappedHelloAgain = helloAgain {
    print("unwrappedHelloAgain = \(unwrappedHelloAgain)")
} else {
    print("There is no value for helloAgain")
}

var firstStr: String?
var secondStr: String?
var thirdStr: String?
var resultStr: String = firstStr ?? secondStr ?? thirdStr ?? "Default"
secondStr = "Second Str"
resultStr = firstStr ?? secondStr ?? thirdStr ?? "Default"
firstStr = "First Str"
resultStr = firstStr ?? secondStr ?? thirdStr ?? "Default"


struct Student {
    var name: String
    var college: College?
    
    func printDescription() {
        print("Name is \(name), college is \(college?.title ?? "non")")
    }
}

struct College {
    var title: String
}

var students = [Student]()
var name = students.first?.name
students.first?.printDescription()
//var name = students.first!.name
students.append(.init(name: "Tim", college: nil))
name = students.first?.name
students.first?.printDescription()
students.append(.init(name: "John", college: .init(title: "SuperCollege")))
students.last?.printDescription()


