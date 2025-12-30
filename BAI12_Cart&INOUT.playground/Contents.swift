import UIKit
func increase(_ value: inout Int){
    guard value > 0 else {
        return
    }
    value += 1
}
print(10.isMultiple(of: 2))
