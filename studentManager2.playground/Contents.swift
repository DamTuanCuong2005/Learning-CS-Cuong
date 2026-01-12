import Foundation
struct Student{
    let id:Int
    let name:String
    var score:Double
}
class StudentManager{
    private var ArrayStudent: [Student] = []
    private var newId: Int = 1
    func addStudent(name: String , score: Double){
        guard !name.isEmpty else{
            print("Rỗng")
            return
        }
        guard (0...10).contains(score) else{
            print("Điểm ko hợp lệ")
            return
        }
        var newStudent = Student(id: newId, name: name, score: score)
        ArrayStudent.append(newStudent)
        newId += 1
    }
    func printStudent(){
        for student in ArrayStudent {
            if student.score >= 5{
                print("\(student.name)-Pass")
            }
            if student.score < 5{
                print("\(student.name)-Fail")
            }
        }
    }
    func averageScore() -> Double{
        var sum:Double = 0
        for student in ArrayStudent {
            sum += student.score
        }
        return sum / Double(ArrayStudent.count)
    }
    func updateScore(id: Int,newScore: Double){
        guard (0...10).contains(newScore) else{
            print("Điểm không hợp lệ")
            return
        }
        guard let index = ArrayStudent.firstIndex(where: {$0.id ==  id}) else{
            return
        }
        ArrayStudent[index].score = newScore
    }
    
    func passedStudent() -> [Student]{
        return ArrayStudent.filter({$0.score >= 5})
    }
    func FailedStudent() -> [Student]{
        return ArrayStudent.filter({$0.score <= 5})
    }
}
let manager = StudentManager()
manager.addStudent(name: "Đàm Tuấn Cường", score: 10)
manager.addStudent(name: "Thảo", score: 3)
manager.printStudent()
manager.updateScore(id: 2, newScore: 4)
let passArray = manager.passedStudent()
for s in passArray{
    print("\(s.name)-\(s.score)")
}
print(manager.averageScore())

