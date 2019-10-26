import Foundation

public struct Stack<T> {
    var stack = [T]()
    var count: Int {
        get { return stack.count }
    }
    var isEmpty: Bool {
        get { return stack.isEmpty }
    }
    
    mutating func push(_ element : T) {
        stack.append(element)
    }
    
    mutating func pop() -> T {
        return stack.popLast()!
    }
    
    func getIndex(_ index : Int) -> T? {
        return index < stack.count ? stack[index] : nil
    }
    
    func getStackIndex(_ index: Int) -> T? {
        return index < stack.count ? stack[stack.count-1-index] : nil
    }
    
    func getLast() -> T? {
        return stack.last
    }
}
