import UIKit

class ParentClass {
    deinit {
        print("ParentClass deinit")
    }
}

class ChildClass: ParentClass {
    deinit {
        print("ChildClass deinit")
    }
}

if true {
    let obj = ChildClass()
}

