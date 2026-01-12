import Foundation

struct Message{
    let title:String
    var body:String
}

protocol Notifiable{
    var channelName:String { get }
    func send(_ message: Message) -> Bool
}

extension Notifiable{
    func printResult(for message:Message){
        var status = send(message)
        guard status == true else{
            print("Gửi không thành công")
            return
        }
        print("Gửi thành công")
    }
}

struct EmailNotifer:Notifiable{
    var channelName: String = "Email"
    var titleRange: Int //Tối đa được ghi chữ bao nhiêu
    func send(_ message: Message) -> Bool {
        guard (message.body).count <= titleRange,(message.title).count <= titleRange else{
            print("Vượt quá giới hạn")
            return false
        }
        print("Tiêu đề:\(message.title)")
        print("Body: \(message.body)")
        return true
    }
}

class SMSNotifer:Notifiable{
    var channelName: String = "SMS"
    var titleRange: Int = 160
    private(set) var SMSMoney:Double
    
    init(SMSMoney: Double) {
        self.SMSMoney = SMSMoney
    }
    
    func send(_ message: Message) -> Bool {
        if SMSMoney >= 1000,message.body.count <= titleRange,message.title.count <= titleRange {
            SMSMoney -= 1000 //sau khi gửi sẽ trừ đi 1k
            print("Tiêu đề:\(message.title)")
            print("Body: \(message.body)")
            return true
        }else{
            print("Vượt quá giới hạn")
            return false
        }
    }
    
    
}
struct ConsolNotidefe:Notifiable{
    var channelName: String = "Consol"
    
    func send(_ message: Message) -> Bool {
        print("Tiêu đề:\(message.title)")
        print("Body: \(message.body)")
        return true
    }
    
    
}
struct NotificationCenter{
    var Notifers:[Notifiable]
    
    func NotifersALL(message: Message){
        for Notifer in Notifers {
            Notifer.send(message)
        }
    }

}
let messageA = Message(title: "SpamA", body: "Hello")
let messageB = Message(title: "SpamB", body:"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
let email = EmailNotifer(titleRange: 998)
let sms = SMSNotifer(SMSMoney: 1000)
let consol = ConsolNotidefe()
let Notifers = NotificationCenter(Notifers: [email,sms,consol])

email.printResult(for: messageA)
email.printResult(for: messageB)
sms.printResult(for: messageA)
sms.printResult(for: messageA)
print("số dư hiện tại trong tài khoản:\(sms.SMSMoney)")
consol.printResult(for: messageA)
Notifers.NotifersALL(message: messageA)
Notifers.NotifersALL(message: messageB)
