import Foundation
struct Student{
    let id:Int
    let name:String
    var score:Double
}
class StudentManager{
    private var studentArray: [Student] = []
    private var nextId: Int = 1
    
    func addStudent(name: String , score: Double){
        
        guard !name.isEmpty else{
            print("Tên chưa hợp lệ")
            return
        }
        
        guard (0...10).contains(score) else{
            print("điểm chưa hợp lệ")
            return
        }
        
        let newStudent = Student(id: nextId, name: name, score: score)
        studentArray.append(newStudent)
        nextId += 1
    }
    func printStudent(){

    }
    
    func updateStudent(id: Int, newScore: Double){
        guard (0...10).contains(newScore) else{
            print("điểm chưa hợp lệ")
            return
        }
        
        guard let index = studentArray.firstIndex(where: {$0.id == id })else {
            return
        }
        studentArray[index].score = newScore
    }
    func passedStudentS() -> [Student] {
        return studentArray.filter{$0.score >= 5}
    }
    func failedStudentS() -> [Student] {
        return studentArray.filter{$0.score < 5 }
    }
}

let manager = StudentManager()
manager.addStudent(name: "a", score: 8)
manager.addStudent(name: "b", score: 9)
manager.addStudent(name: "", score: -1)
let passArray = manager.passedStudentS()
passArray
