import UIKit
struct Student {
 let id: Int
 let name: String
 let score: Int
}
let students: [Student] = [
 Student(id: 1, name: "An", score: 8),
 Student(id: 2, name: "Binh", score: 4),
 Student(id: 3, name: "Chi", score: 7),
 Student(id: 4, name: "An", score: 6)
]
//Phần A -  ARRAY
//Lấy danh sách tất cả sinh viên
for student in students {
    print(student)
}
//Lấy danh sách tên sinh viên từ mảng students.
print(students.map(\.name))
//Lọc ra danh sách sinh viên có score >= 5.
print(students.filter { $0.score >= 5 }.map(\.name))
//Kiểm tra có sinh viên nào rớt không (score < 5).
if students.contains(where: { $0.score < 5 }) {
    print("Có sinh viên rớt:\(students.filter{ $0.score < 5 }.map(\.name))")
}else {
    print("Không có sinh viên rớt:\(students.filter{ $0.score > 5 }.map(\.name))")
}
// Kiểm tra tất cả sinh viên đều đậu (score >= 5). Gợi ý: allSatisfy
if students.allSatisfy({$0.score >= 5}) {
    print("Tất cả sinh viên đều đậu:\(students.filter{$0.score>=5}.map(\.name))")
}else {
    print("Có sinh viên không đậu\(students.filter{$0.score<5}.map(\.name))")
}
//Tìm sinh viên có id = 2. Gợi ý: first(where:)
print(students.first(where: { $0.id == 2 })!)
//PHẦN B - SET
//Tạo Set<String> chứa tên sinh viên (loại bỏ tên trùng)
let setOfNames: Set<String> = Set(students.map(\.name))
print(setOfNames)
//Kiểm tra Set tên sinh viên có chứa "An" hay không.
if setOfNames.contains(where: { $0 == "An" }) {
    print("Có tên sinh viên là An")
}else {
    print("Không có tên sinh viên tên An")
}
////Cho Set số nguyên ban đầu [1, 2, 3]
//• Thêm số 4
//• Xóa số 2
let numbers: Set<Int> = [1, 2, 3]
var updatedNumbers = numbers
updatedNumbers.insert(4)
updatedNumbers.remove(2)
print(updatedNumbers)
//Bài B4
let a: Set<Int> = [1, 2, 3, 4]
let b: Set<Int> = [3, 4, 5]
//Union-Tạo ra 1 tập hợp mới a và b chung
print(a.union(b).sorted())
//Intersection-tạo ra 1 tập hợp mới như trên nhưng chứa. cái chung của 2. tập hợp
print(a.intersection(b).sorted())
// Subtracting-cũng tạo. ra. tập hợp mới nhưng in ra những cái. tập. hợp. b ko có
print(a.subtracting(b).sorted())
//— DICTIONARY
//Tạo Dictionary<Int, Student>
var Dictionary: [Int: Student] = [1: students[0], 2: students[1], 3: students[2], 4: students[3]]
print(Dictionary)
//Từ Dictionary trên, lấy sinh viên có id = 3.
print(Dictionary[3]!)
//Duyệt Dictionary và in ra:
//<id - name – score
for (key, value) in Dictionary {
    print("id:\(key) name: \(value.name) score: \(value.score)")
}
//Bài C4. Từ Dictionary, lấy:
//• Danh sách tất cả key
//• Danh sách tất cả value
print(Dictionary.keys.sorted())
for value in Dictionary{
    print("id: \(value.key) name: \(value.value.name) score: \(value.value.score)")
}
