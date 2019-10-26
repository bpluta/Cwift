import Foundation

public enum DeclarationType {
    case Variable
    case Constant
    case Function
    case Loop
}

public protocol Declaration {
    var type: DeclarationType { get }
    var name: String { get set }
    var size: Int { get set }
    var count: Int { get set }
    
    init()
}

public extension Declaration {
    public init(name: String, size: Int = 0, count: Int = 0) {
        self.init()
        self.name = name
        self.count = count
        self.size = size
    }
}

public class Variable : Declaration {
    public var name: String = ""
    public var size: Int = 0
    public var count: Int = 0
    
    public var type: DeclarationType { get { return .Variable } }
    required public init() {}
}

public class Constant : Declaration {
    public var name: String = ""
    public var size: Int = 0
    public var count: Int = 0
    
    public var type: DeclarationType { get { return .Constant } }
    required public init() {}
}

public class Argument {
    var internalName : String
    var externalName : String?
    var type : String
    
    init(internalName : String, externalName : String? = nil, type : String) {
        self.internalName = internalName
        self.externalName = externalName
        self.type = type
    }
}

public class Function : Declaration, Code {
    public var name: String = ""
    public var size: Int = 0
    public var count: Int = 0
    public var stackPointer = 0
    public var type: DeclarationType { get { return .Function } }
    public var argumentList = [Argument]()
    public var expressions = [ExpressionTree]()
    private var functionBody = [String]()
    required public init() {}
    
    public func getCode() -> [String] {
        var code = [String]()
        code.append("\(name):")
        code.append("push rbp")
        code.append("mov rbp, rsp")
        
        code.append(contentsOf: functionBody)
        
        code.append("pop rbp")
        code.append("ret")
        return code
    }
    
    public func generateCode() {
        var code = [String]()
        code.append("sub rsp, \(size)")
        code.append(contentsOf: getBody())
        code.append(".\(name)_ret:")
        code.append("add rsp, \(size)")
        self.functionBody = code
    }
    
    public func getSize() -> Int {
        let localSize = 0
        let stackSize = Int(ceil(Double(localSize)/16))*16
        return stackSize
    }
    
    public func getBody() -> [String] {
        var code: [String] = []
        for expression in expressions {
            code.append(contentsOf: expression.getCode())
        }
        return code
    }
}

public class Loop : Declaration {
    public var type: DeclarationType
    public var name: String
    public var size: Int
    public var count: Int
    public var expressions = [ExpressionTree]()
    public var condition : ExpressionTree?
    
    required public init() {
        self.size = 0
        self.count = 0
        self.name = "undefinied"
        self.type = .Loop
    }
    
    func getCode() -> [String] {
        var code = [String]()
        code.append(".\(name):")
        guard let conditionExpression = condition else {
            return []
        }
        let testCondition = TestCondition()
        testCondition.arguments.push(conditionExpression)
        code.append(contentsOf: testCondition.getCode())
        code.append("je .\(name)_end")
        for expression in expressions {
            code.append(contentsOf: expression.getCode())
        }
        code.append(".\(name)_end:")
        return code
    }
}
