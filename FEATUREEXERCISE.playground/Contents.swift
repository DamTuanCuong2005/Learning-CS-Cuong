import Foundation
//Bai1
let scores =  [8, 9, 10, 7, 6]
func average(of scores: [Int])-> Double{
    guard !scores.isEmpty else { return 0 }
    var total:Double = 0
    for score in scores{
        total += Double(score)
    }
    return total / Double(scores.count)
}
print("average:\(average(of: scores))")
func maxScore(in scores: [Int]) -> Int?{
    guard !scores.isEmpty else{
        return nil
    }
    var Maxnumber = scores[0]
    for score in scores {
        if Maxnumber < score{
            Maxnumber = score
        }
    }
    return Maxnumber
}
print("max: \(maxScore(in: scores) ?? 0)")
func minScore(in scores: [Int]) -> Int?{
    guard !scores.isEmpty else{
        return nil
    }
    var MinNumber = scores[0]
    for score in scores {
        if score < MinNumber{
            MinNumber = score
        }
    }
    return MinNumber
}
print("min: \(minScore(in: scores) ?? 0)")
func grade(for average: Double) -> String{
    var Average = average
        if Average == 10 && Average >= 8.5{
            print("Grade: A")
        }
        if Average >= 7 && Average <= 8.4 {
            print("Grade: B")
        }
        if Average >= 5.5 && Average <= 6.9{
            print("Grade: C")
        }
        if Average >= 4 && Average <= 5.4{
            print("Grade: D")
        }
        if Average < 4 {
            print("Grade: F")
        }
    return String("\(average)")
}
grade(for: average(of: scores))
