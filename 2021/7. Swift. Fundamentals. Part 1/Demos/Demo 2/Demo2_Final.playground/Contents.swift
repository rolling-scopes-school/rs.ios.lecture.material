import UIKit

struct Color {
    var red: Double = 0.0
    var green: Double = 0.0
    var blue: Double = 0.0

    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    init(white: Double) {
        self.init(red: white, green: white, blue: white)
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

class Shape {
    var origin: CGPoint

    init(origin: CGPoint) {
        self.origin = origin
    }
}

class Rect: Shape {
    var size: CGSize

    init(size: CGSize, origin: CGPoint) {
        self.size = size
        super.init(origin: origin)
    }

    convenience init(size: CGSize) {
        self.init(size: size, origin: .zero)
    }

    convenience init(sideLength: CGFloat, origin: CGPoint) {
        self.init(size: CGSize(width: sideLength, height: sideLength), origin: origin)
    }
}

class RoundedRect: Rect {
    var corner: CGFloat

    init(size: CGSize, origin: CGPoint, corner: CGFloat) {
        self.corner = corner
        super.init(size: size, origin: origin)
    }

    override init(size: CGSize, origin: CGPoint) {
        corner = 0.0
        super.init(size: size, origin: origin)
    }
}

let roundedRect1 = RoundedRect(size: .zero, origin: .zero, corner: 2)
let roundedRect2 = RoundedRect(size: .zero)
let roundedRect3 = RoundedRect(sideLength: 3, origin: .zero)
let roundedRect4 = RoundedRect(size: .zero, origin: .zero)

