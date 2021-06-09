class Message {
    enum Status {
        case Sent
        case Received
        case Read
    }
    
    var status = Status.Sent
}

let message = Message()
message.status = .Received

class EmailBox {
    var messageStatus: Message.Status?
}

let emailBox = EmailBox()
emailBox.messageStatus = .Read

