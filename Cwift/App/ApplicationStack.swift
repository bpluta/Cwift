import Foundation

public class ApplicationStack {
    var stack: Stack<Operation>
    var rbp: Int
    var count: Int {
        get { return stack.count }
    }
    
    init() {
        stack = Stack<Operation>()
        rbp = 0
    }
    
    func findInstance(name : String) -> Int? {
        for (index, item) in stack.stack.enumerated().reversed() {
            if let itemName = item.name {
                if itemName == name && item.type.isUserInitalizedObject() {
                    return index
                }
            }
        }
        return nil
    }
    
    func funcGet(name : String, index : Int = 0) -> Int? {
        let endIndex = index > 0 ? index : stack.count
        for (index, item) in stack.stack[0..<endIndex].enumerated().reversed() {
            if let itemName = item.name {
                if itemName == name && item.type.isUserInitalizedObject() {
                    return index
                }
            }
        }
        return nil
    }
    
    func findFunction(name: String) -> Int? {
        for (index, item) in stack.stack.enumerated().reversed() {
            if let itemName = item.name {
                if itemName == name && item.type == .function {
                    return index
                }
            }
        }
        return nil
    }
    
    func findRegister(name: String) -> Int? {
        for (index, item) in stack.stack.enumerated().reversed() {
            if let itemName = item.name {
                if itemName == name && item.type == .register {
                    return index
                }
            }
        }
        return nil
    }
    
    func findType(name: String) -> Int? {
        for (index, item) in stack.stack.enumerated().reversed() {
            if let itemName = item.name {
                if itemName == name && item.type == .type {
                    return index
                }
            }
        }
        return nil
    }
    
    func push(item : Operation) {
        stack.push(item)
    }
    
    @discardableResult func pop() -> Operation {
        return stack.pop()
    }
    
    func getOffset(of index: Int) -> Int {
        let step = rbp < index ? 1 : -1
        var currentOffset = 0
        let from = rbp+step
        for currentIndex in stride(from: from, through: index, by: step) {
            guard let current = stack.getIndex(currentIndex) else {
                return 0
            }
            currentOffset += (-step)*current.stackSize
        }
        return currentOffset
    }
    
    func distanceToRbp(from index: Int) -> Int {
        let step = -1
        var currentOffset = 0
        let from = index
        for currentIndex in stride(from: from, through: 0, by: step) {
            guard let current = stack.getIndex(currentIndex) else {
                return 0
            }
            currentOffset += (-step)*current.stackSize
            if current.type == .register && current.name == "rbp" {
                return currentOffset
            }
        }
        return currentOffset
    }
    
    func getDistance(from index: Int) -> Int {
        let step = -1
        var currentOffset = 0
        let from = stack.count-1
        for currentIndex in stride(from: from, through: index, by: step) {
            guard let current = stack.getIndex(currentIndex) else {
                return 0
            }
            currentOffset += (-step)*current.stackSize
        }
        return currentOffset
    }
    
    func printStackTrace() {
        for item in stack.stack.reversed() {
            print("\(item.type.rawValue) ( \(item.stackSize) )\(item.name != nil ? " :: \(item.name ?? "")" : "")")
        }
    }
    
    @discardableResult func alignStack() -> Int {
        var allocatedSpace = 0
        for index in stride(from: rbp+1, to: stack.count, by: 1) {
            guard let current = stack.getIndex(index) else {
                break
            }
            allocatedSpace += current.stackSize
        }
        let alignment = allocatedSpace%16
        if alignment != 0 {
            var filler = Operation(type: .empty)
            filler.size = alignment
            stack.push(filler)
            allocatedSpace += alignment
        }
        return allocatedSpace
    }
    

    func getContextSize() -> Int {
        var allocatedSpace = 0
        for index in stride(from: rbp+1, to: stack.count, by: 1) {
            guard let current = stack.getIndex(index) else {
                break
            }
            allocatedSpace += current.stackSize
        }
        return allocatedSpace
    }
    
    func pushFunction(name: String, declarationType: String) {
        var operation = Operation(type: .function)
        operation.size = 0
        operation.count = 1
        operation.name = name
        operation.declarationType = declarationType
        push(item: operation)
    }
    
    func pushVariable(name: String, declarationType: String, count: Int = 1, size: Int = 8) {
        var operation = Operation(type: .variable)
        operation.size = 8
        operation.count = count
        operation.name = name
        operation.declarationType = declarationType
        push(item: operation)
    }
    
    func pushConstant(name: String, declarationType: String, count: Int = 1, size: Int = 8) {
        var operation = Operation(type: .constant)
        operation.size = 8
        operation.count = count
        operation.name = name
        operation.declarationType = declarationType
        push(item: operation)
    }
    
    func pushRegister(name: String) {
        var operation = Operation(type: .register)
        operation.size = 8
        operation.count = 1
        operation.name = name
        push(item: operation)
    }
    
    func pushType(name: String, size: Int = 8) {
        var operation = Operation(type: .type)
        operation.size = size
        operation.count = 1
        operation.name = name
        push(item: operation)
    }

    func enterFunction() {
        pushRegister(name: "rip")
        pushRegister(name: "rbp")
        rbp = stack.count-1
    }
    
    func exitFunction() {
        while !stack.isEmpty {
            let item = stack.pop()
            if item.type == .register {
                if let name = item.name, name == "rip" {
                    break
                }
            }
        }
        if let newBasePointer = findRegister(name: "rbp") {
            rbp = newBasePointer
        }
    }
    
    func getItem(at index: Int) -> Operation {
        return stack.stack[index]
    }
}
