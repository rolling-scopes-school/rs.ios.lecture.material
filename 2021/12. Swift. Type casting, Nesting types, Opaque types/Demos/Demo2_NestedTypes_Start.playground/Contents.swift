import UIKit

class Message {
    enum Status {
        case sent
        case received
        case read
    }
    
    var status = Status.sent
}

let message = Message()
message.status = .received

class EmailBox {
    var messageStatus: Message.Status?
}

let emailBox = EmailBox()
emailBox.messageStatus = .read
