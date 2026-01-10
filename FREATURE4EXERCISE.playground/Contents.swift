import Foundation
func  log(_ messages: String..., prefix: String = "[APP]"){
    for msg in messages{
        print("\(prefix) \(msg)")
    }
}
log("Start", "Loading", "Done")
log("Timeout", prefix: "[ERROR]")
