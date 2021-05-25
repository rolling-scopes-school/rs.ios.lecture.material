import UIKit

struct Resolution {
    var width = 0.0
    var height = 0.0

    mutating func resetValues() {
        width = 0.0
        height = 0.0
    }
}

var fullHD = Resolution()
fullHD.width = 1920
fullHD.height = 1080
print(fullHD)

var cinema = fullHD
cinema.width = 2048
print(fullHD)
print(cinema)

class VideoMode {
    var frameRate = 0.0
    var name: String?

    func resetValues() {
        frameRate = 0.0
        name = nil
    }
}

let videoMode1 = VideoMode()
videoMode1.frameRate = 25.0
videoMode1.name = "videoMode1"
print(videoMode1.frameRate, videoMode1.name)

let videoMode2 = videoMode1
videoMode2.frameRate = 30.0
videoMode2.name = "videoMode2"
print(videoMode1.frameRate, videoMode1.name)
print(videoMode2.frameRate, videoMode2.name)
