import Foundation

enum ProcessState{
    case notStart
    case inProgress
    case complete
    case cancelled
    case failed(reason: String)
}

func processStateDescription(state: ProcessState){
    switch state{
    case .notStart:
        print("Hệ thống đang được bắt đầu")
    case .inProgress:
        print("Hệ thống đang được chạy")
    case .complete:
        print("Hệ thống đã được hoàn thành")
    case .cancelled:
        print("Hệ thống đã bị huỷ")
    case .failed(let reason):
        print("Hệ thống bị thất bại do \(reason)")
    }
}
processStateDescription(state: .notStart)
processStateDescription(state: .inProgress)
processStateDescription(state: .cancelled)
processStateDescription(state: .failed(reason: "Quá Tải"))
