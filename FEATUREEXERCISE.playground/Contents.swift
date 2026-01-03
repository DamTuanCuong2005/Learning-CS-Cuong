import Foundation
//Bai1
let scores =  [8, 9, 10, 7, 6]
func average(of scores: [Int])-> Double{
    var total:Double = 0
    for score in scores{
        total += Double(score)
    }
    return total / Double(scores.count)
}
print("average:\(average(of: scores))")
func maxScore(in scores: [Int]) -> Int?{
    var MaxNumber = 0
    for score in scores {
        if MaxNumber < score{
            MaxNumber = score
        }
    }
    return MaxNumber
}
print("max: \(maxScore(in: scores) ?? 0)")
func minScore(in scores: [Int]) -> Int?{
    var MinNumber = 10
    for score in scores {
        if score < MinNumber{
            MinNumber = score
        }
    }
    return MinNumber
}
print("min: \(minScore(in: scores) ?? 0)")
func grade(for average: Double) -> Int{
    var Average = average
        while Average == 10 && Average >= 8.5{
            print("Grade: A")
            break
        }
        while Average >= 7 && Average <= 8.4 {
            print("Grade: B")
            break
        }
        while Average >= 5.5 && Average <= 6.9{
            print("Grade: C")
            break
        }
        while Average >= 4 && Average <= 5.4{
            print("Grade: D")
            break
        }
        while Average < 4 {
            print("Grade: F")
            break
        }
    return Int(Average)
}
grade(for: average(of: scores))
