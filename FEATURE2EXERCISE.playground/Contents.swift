import Foundation
let comments = ["Hello","","This is stupid","nice"]
let banned = ["stupid","Hate"]
func filterEmpty(_ comments: [String]) -> [String]{
    var Empty = [String]([])
    for Comment in comments {
        if Comment.isEmpty{
            continue
        }
        Empty += [Comment]
    }
    return [String](Empty)
}
print(filterEmpty(comments))
func containsBannedWord(_ comment: String, banned: [String]) -> Bool{
    for ban in banned {
        if comment.lowercased().contains(ban.lowercased()){
            return true
        }
    }
    return false
}
func moderate(_ comments: [String], banned: [String]) -> [String]{
    containsBannedWord("\(comments)", banned: banned)
    filterEmpty(comments)
    var mode = [String]([])
    for comment in comments {
        if containsBannedWord("\(comment)", banned: banned){
            mode.append("[REMOVE]")
        }else{
            mode.append(comment)
        }
    }
    return mode
}
print(moderate(filterEmpty(comments),banned:banned))
