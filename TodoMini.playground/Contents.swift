import Foundation

struct Todo{
    let id:Int
    var title:String
    var isComplete: Bool
}
class TodoManager{
    private var ArrayTodo:[Todo] = []
    private var newId:Int = 1
    func addTodo(title:String){
        guard !title.isEmpty else{
            print("Rỗng")
            return
        }
        var newTodo = Todo(id: newId, title: title, isComplete: false)
        ArrayTodo.append(newTodo)
        newId += 1
    }
    func toggleTodo(id: Int,newIsComplete: Bool){
        guard let index = ArrayTodo.firstIndex(where: {$0.id == id}) else{
            return
        }
        ArrayTodo[index].isComplete = newIsComplete
    }
    func removeTodo(id: Int){
        if let index = ArrayTodo.firstIndex(where: {$0.id == id}){
            ArrayTodo.remove(at: index)
        }
    }
    func countCompletedTodos() -> Int{
        var done:Int = 0
        for s in ArrayTodo{
            if s.isComplete{
                done += 1
            }
        }
        return done
    }
    func printTodos(){
        for s in ArrayTodo{
            if s.isComplete{
                print("\(s.id)-\(s.title)")
            }
        }
    }
}
let manager = TodoManager()
manager.addTodo(title: "Eat")
manager.addTodo(title: "Watch Tiktok")
manager.addTodo(title: "coding")
manager.toggleTodo(id: 2,newIsComplete: true)
manager.removeTodo(id: 2)
manager.countCompletedTodos()
manager.printTodos()

