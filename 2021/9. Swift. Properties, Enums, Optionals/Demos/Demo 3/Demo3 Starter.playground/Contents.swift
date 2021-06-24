import UIKit

var hello: String?

hello = "Hello"
print(hello)
print(hello!)


var helloAgain: String? = "Hello again!"

if let helloAgain = helloAgain {
    print(helloAgain)
} else {
    print("Nil")
}

var first: String?
var second: String? = "Not okay"
var third: String?

var result = first ?? second ?? third ?? "Okay"

struct Student {
    var name: String
    var college: College?
    
    func printDecs() {
        print("Name is \(name). College is \(college?.title ?? "non")")
    }
}

struct College {
    var title: String
}

var students = [Student]()

students.first?.printDecs()

students.append(.init(name: "Tim", college: nil))
var name = students.first?.name
students.first?.printDecs()
students.append(.init(name: "Mike", college: .init(title: "Harvard")))
students.last?.printDecs()
