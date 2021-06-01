import UIKit

struct VideoMode {
    var frameRate: Double = 0.0
    var name: String?
    static var counter: Int = 0
    
    lazy var lazyProperty: Int = {
        print("Initialize lazyProperty")
        return 2
    }()
    
    init() {
        VideoMode.counter += 1
    }
    
    init(frameRate: Double) {
        self.init()
        self.frameRate = frameRate
    }
    
    init(frameRate: Double, name: String?) {
        self.init()
        self.frameRate = frameRate
        self.name = name
    }
}

var videoMode1 = VideoMode()
print("videoMode1: \(videoMode1)")
var videoMode2 = VideoMode(frameRate: 25.0)
print("videoMode2: \(videoMode2)")
var videoMode3 = VideoMode(frameRate: 30.0, name: "1080i")
print("videoMode3: \(videoMode3)")
videoMode3.name = "720i"
print("videoMode3: \(videoMode3)")
print("Counter = \(VideoMode.counter)")

videoMode3.lazyProperty
print("videoMode3: \(videoMode3)")

class Square {
    private var size: CGSize = .zero {
        willSet {
            print("Will set new size value: \(newValue)")
        }
        didSet {
            print("Did change old size value: \(oldValue)")
        }
    }
    
    var sideLength: CGFloat {
        get {
            size.width
        }
        set {
            size = .init(width: newValue, height: newValue)
        }
    }
    
    init(sideLength: CGFloat) {
        self.size = .init(width: sideLength, height: sideLength)
    }
}

print("Square will be created")
let square = Square(sideLength: 20.0)
print("Square is created")
square.sideLength = 15

@propertyWrapper
struct Uppercased {
    private var value: String
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    
    init(wrappedValue: String) {
        self.value = wrappedValue.uppercased()
    }
}

struct StringStruct {
    @Uppercased var uppercasedString: String
}

let strStruct = StringStruct(uppercasedString: "String")
print(strStruct)

