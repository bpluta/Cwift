import Foundation

public enum OperationType : String {
    case register
    case function
    case variable
    case constant
    case empty
    case object
    case type
    
    func isUserInitalizedObject() -> Bool {
        if self == .variable || self == .constant {
            return true
        }
        return false
    }
}

public struct Operation {
    var size = 8
    var count: Int = 0
    var name: String?
    var type: OperationType
    var declarationType : String?
    var members: [Operation]
    var returnType: String
    
    var stackSize: Int { get { return count*size } }
    
    init(type: OperationType = .empty, count: Int = 0, size: Int = 8, name: String? = nil, returnType: String = "") {
        self.type = type
        self.size = size
        self.count = count
        self.name = name
        self.declarationType = nil
        self.members = [Operation]()
        self.returnType = returnType
    }
    
    init(type: OperationType) {
        self.type = type
        self.count = 1
        self.size = 0
        self.name = nil
        self.declarationType = nil
        self.members = [Operation]()
        self.returnType = ""
    }
}
