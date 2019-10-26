import Foundation

public enum ExpressionAtomType {
    case Integer
    case Double
    case String
    case Character
    case Boolean
    case Nil
    case Variable
    case Function
}

public enum ReturnType : String {
    case Int
    case Double
    case String
    case Character
    case Boolean
    case Nil
}

public protocol ExpressionTree : Code {
    var arguments: Stack<ExpressionTree> { get set }
    var value: String { get set }
    var argumentsNeeded : Int { get set }
    var returnDestination : String? { get set }
    var returnType : String? { get set }
    var argumentType : String? { get set }
    var identifier : String { get set }
    var stack : ApplicationStack { get set }
    var stackOffset : Int { get set }
    
    init()
    func getResult() -> String
    func evaluateArguments() -> [String]
    func prepareArguments() -> [String]
    func adjustDestination()
}

public extension ExpressionTree {
    
    public init(stack: ApplicationStack, value: String, arguments: [ExpressionTree] = []) {
        self.init()
        self.value = value
        for argument in arguments {
            self.arguments.push(argument)
        }
        self.stack = stack
        self.adjustReturnType()
        self.adjustArgumentsType()
        self.adjustDestination()
    }
    
    public init(stack: ApplicationStack, value: String, returnType: String?, argumentType: String?, destination: String?, arguments: [ExpressionTree] = []) {
        self.init()
        self.value = value
        for argument in arguments {
            self.arguments.push(argument)
        }
        self.stack = stack
        self.returnType = returnType
        self.argumentType = argumentType
        self.returnDestination = destination
    }
    
    public init(stack: ApplicationStack, arguments: [ExpressionTree]) {
        self.init()
        for argument in arguments {
            self.arguments.push(argument)
        }
        self.stack = stack
        self.adjustReturnType()
        self.adjustArgumentsType()
        self.adjustDestination()
    }
    
    public func getResult() -> String {
        var argumentResult = ""
        for argument in self.arguments.stack {
            argumentResult += " \(argument.getResult())"
        }
        return "(\(value)\(argumentResult))"
    }
    
    public func getCode() -> [String] {
        var code = [String]()
        code.append("mov rax, \(value)")
        return code
    }
    
    public func evaluateArguments() -> [String] {
        var code = [String]()
        if self.arguments.count == self.argumentsNeeded {
            for arg in self.arguments.stack {
                arg.stackOffset = stackOffset
                code.append(contentsOf: arg.getCode())
                if let returnDestination = arg.returnDestination {
                    if arg.argumentType == "Double" {
                        let pattern = try! NSRegularExpression(pattern: "^xmm.*")
                        if pattern.matches(returnDestination) {
                            code.append("movq rax, \(returnDestination)")
                            code.append("push rax"); stackOffset += 1
                        }
                        else {
                            code.append("push \(returnDestination)"); stackOffset += 1
                        }
                    }
                    else {
                        code.append("push \(returnDestination)"); stackOffset += 1
                    }
                }
            }
        }
        else if self.argumentsNeeded == 0 {
            
        }
        return code
    }
    
    public func prepareArguments() -> [String] {
        var code = [String]()
        for _ in 0..<argumentsNeeded  {
            code.append("pop rax"); stackOffset -= 1
        }
        return code
    }
    
    public func adjustReturnType() {
        var returnType : String? = nil
        for argument in self.arguments.stack {
            if let _ = returnType {
                if returnType != argument.returnType {
                    returnType = nil
                    break
                }
            }
            else {
                returnType = argument.returnType
            }
        }
        self.returnType = returnType
    }
    
    public func adjustArgumentsType() {
        var argumentType : String? = nil
        for argument in self.arguments.stack {
            if let _ = argumentType {
                if argumentType != argument.argumentType {
                    argumentType = nil
                    break
                }
            }
            else {
                argumentType = argument.argumentType
            }
        }
    }
    
    public func adjustDestination() {
        switch self.returnType {
        case "Double":
            self.returnDestination = "xmm0"
        case nil:
            self.returnDestination = nil
        default:
            self.returnDestination = "rax"
        }
    }
}

public class AbstractExpression : ExpressionTree {
    public var arguments: Stack<ExpressionTree>
    public var value: String
    public var argumentsNeeded: Int
    public var returnDestination: String?
    public var returnType: String?
    public var argumentType: String?
    public var identifier: String
    public var stack: ApplicationStack
    public var stackOffset: Int
    
    public required init() {
        self.arguments = Stack<ExpressionTree>()
        self.value = ""
        self.argumentsNeeded = 0
        self.returnDestination = nil
        self.returnType = nil
        self.argumentType = nil
        self.identifier = ""
        self.stack = ApplicationStack()
        self.stackOffset = 0
    }
    
    public func getCode() -> [String] {
        var code = [String]()
        code.append("mov rax, \(value)")
        return code
    }
}

public class BinaryExpression : AbstractExpression {
    public var instruction : String
    
    public required init() {
        self.instruction = ""
        super.init()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if arguments.stack.count == argumentsNeeded {
            if arguments.stack[0].returnDestination == arguments.stack[1].returnDestination {
                code.append(contentsOf: self.evaluateArguments())
                if self.returnType == "Int" {
                    code.append("pop rsi"); stackOffset -= 1
                    code.append("pop rdi"); stackOffset -= 1
                    code.append("\(instruction) rdi, rsi")
                    code.append("mov \(returnDestination ?? "rax"), rdi")
                }
            }
        }
        return code
    }
}

public class ArthmeticExpression : AbstractExpression {
    public var integerinstruction : String
    public var floatinginstruction : String
    
    public required init() {
        self.integerinstruction = ""
        self.floatinginstruction = ""
        super.init()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if arguments.stack.count == argumentsNeeded {
            code.append(contentsOf: self.evaluateArguments())
            switch self.returnType {
            case "Int":
                code.append("pop rdi"); stackOffset -= 1
                code.append("pop rsi"); stackOffset -= 1
                code.append("\(integerinstruction) rdi, rsi")
                code.append("mov \(returnDestination ?? "rax"), rdi")
            case "Double":
                code.append("pop rax"); stackOffset -= 1
                code.append("movq xmm0, rax")
                code.append("pop rax"); stackOffset -= 1
                code.append("movq xmm1, rax")
                code.append("\(floatinginstruction) xmm0, xmm1")
                if self.returnDestination != "xmm0" {
                    code.append("mov \(returnDestination ?? "xmm0"), xmm0")
                }
            default:
                break
            }
        }
        return code
    }
}

public class ComparisionExpression : AbstractExpression {
    public var compareinstruction: String
    
    public required init() {
        self.compareinstruction = ""
        super.init()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if arguments.stack.count == argumentsNeeded {
            if arguments.stack[0].returnDestination == arguments.stack[1].returnDestination {
                code.append(contentsOf: self.evaluateArguments())
                var reverseOutput = false
                var instruction = compareinstruction
                switch self.returnType {
                case "Int":
                    code.append("pop rsi"); stackOffset -= 1
                    code.append("pop rdi"); stackOffset -= 1
                    code.append("cmp rdi, rsi")
                case "Double":
                    code.append("pop rax"); stackOffset -= 1
                    code.append("movq xmm1, rax")
                    code.append("pop rax"); stackOffset -= 1
                    code.append("movq xmm0, rax")
                    code.append("comisd xmm0, xmm1")
                    if compareinstruction == "jge" {
                        instruction = "jb"
                        reverseOutput = true
                        
                    }
                    else if compareinstruction == "jg" {
                        instruction = "jbe"
                        reverseOutput = true
                    }
                default:
                    break
                }
                code.append("\(instruction) .\(identifier)_skip")
                code.append("mov rax, \(reverseOutput ? "1" : "0")")
                code.append("jmp .\(identifier)_exit")
                code.append(".\(identifier)_skip:")
                code.append("mov rax, \(reverseOutput ? "0" : "1")")
                code.append(".\(identifier)_exit:")
            }
        }
        return code
    }
}

public class ConditionalExpression : AbstractExpression {
    public override func getCode() -> [String] {
        var code = [String]()
        
        for (index, argument) in arguments.stack.enumerated() {
            argument.identifier = "\(argument.identifier)_\(index+1)"
        }
        
        if self.arguments.count == argumentsNeeded {
            if arguments.stack[1].returnDestination == arguments.stack[2].returnDestination {
                
                code.append(contentsOf: self.evaluateArguments())
                code.append("pop rdx"); stackOffset -= 1
                code.append("pop rsi"); stackOffset -= 1
                code.append("pop rdi"); stackOffset -= 1
                code.append("cmp rdi, 0")
                code.append("je .\(identifier)_false")
                if self.returnType == "Double" {
                    code.append("movq \(returnDestination ?? "xmm0"), rsi")
                }
                else {
                    code.append("mov \(returnDestination ?? "rax"), rsi")
                }
                code.append("jmp .\(identifier)_exit")
                code.append(".\(identifier)_false:")
                if self.returnType == "Double" {
                    code.append("movq \(returnDestination ?? "xmm0"), rdx")
                }
                else {
                    code.append("mov \(returnDestination ?? "rax"), rdx")
                }
                code.append(".\(identifier)_exit:")
            }
        }
        return code
    }
}

public class LogicalExpression : AbstractExpression {
    public var instruction : String
    
    public required init() {
        instruction = ""
        super.init()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if arguments.stack.count == argumentsNeeded {
            if arguments.stack[0].returnDestination == arguments.stack[1].returnDestination {
                code.append(contentsOf: self.evaluateArguments())
                switch self.returnType {
                case "Int":
                    code.append("pop rsi"); stackOffset -= 1
                    code.append("pop rdi"); stackOffset -= 1
                    code.append("cmp rdi, 0")
                    code.append("jne .\(identifier)_first_true")
                    code.append("mov rdi, 0")
                    code.append("jmp .\(identifier)_next")
                    code.append(".\(identifier)_first_true:")
                    code.append("mov rdi, 1")
                    code.append(".\(identifier)_next:")
                    code.append("cmp rsi, 0")
                    code.append("jne .\(identifier)_second_true")
                    code.append("mov rsi, 0")
                    code.append("jmp .\(identifier)_logical_exp")
                    code.append(".\(identifier)_second_true:")
                    code.append("mov rsi, 1")
                case "Double":
                    code.append("pop rax"); stackOffset -= 1
                    code.append("movq xmm0, rax")
                    code.append("mov rax, 0")
                    code.append("movq xmm1, rax")
                    
                    code.append("comisd xmm0, xmm1")
                    code.append("jne .\(identifier)_first_true")
                    code.append("mov rdi, 0")
                    code.append("jmp .\(identifier)_next")
                    code.append(".\(identifier)_first_true:")
                    code.append("mov rdi, 1")
                    code.append(".\(identifier)_next:")
                    
                    code.append("pop rax"); stackOffset -= 1
                    code.append("movq xmm0, rax")
                    code.append("mov rax, 0")
                    code.append("movq xmm1, rax")
                    
                    code.append("comisd xmm0, xmm1")
                    code.append("jne .\(identifier)_second_true")
                    code.append("mov rsi, 0")
                    code.append("jmp .\(identifier)_logical_exp")
                    code.append(".\(identifier)_second_true:")
                    code.append("mov rsi, 1")
                default:
                    break
                }
                code.append(".\(identifier)_logical_exp:")
                code.append("\(instruction) rdi, rsi")
                code.append("mov \(returnDestination ?? "rax"), rdi")
            }
        }
        return code
    }
}

public class ExpressionAtom : AbstractExpression {
    public var type: ExpressionAtomType
    public required init() {
        type = .Nil
        super.init()
        arguments = Stack<ExpressionTree>()
        value = ""
        argumentsNeeded = 0
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        identifier = ""
        stack = ApplicationStack()
    }
}

public class Multiplication : ArthmeticExpression {
    public required init() {
        super.init()
        value = "*"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        integerinstruction = "imul"
        floatinginstruction = "mulsd"
    }
}

public class Division : ArthmeticExpression {
    public required init() {
        super.init()
        value = "/"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        integerinstruction = "idiv"
        floatinginstruction = "divsd"
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if arguments.stack.count == argumentsNeeded {
            code.append(contentsOf: self.evaluateArguments())
            switch self.returnType {
            case "Int":
                code.append("pop rax"); stackOffset -= 1
                code.append("pop rdi"); stackOffset -= 1
                code.append("cqo")
                code.append("idiv rdi")
                if self.returnDestination != "rax" {
                    code.append("mov \(returnDestination ?? "rax"), rax")
                }
            case "Double":
                code.append("pop rax"); stackOffset -= 1
                code.append("movq xmm0, rax")
                code.append("pop rax"); stackOffset -= 1
                code.append("movq xmm1, rax")
                code.append("divsd xmm0, xmm1")
                if self.returnDestination != "xmm0" {
                    code.append("mov \(returnDestination ?? "xmm0"), xmm0")
                }
            default:
                break
            }
        }
        return code
    }
}

public class Remainder : AbstractExpression {
    public required init() {
        super.init()
        value = "%"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if arguments.stack.count == argumentsNeeded {
            code.append(contentsOf: self.evaluateArguments())
            switch self.returnType {
            case "Int":
                code.append("pop rax"); stackOffset -= 1
                code.append("pop rdi"); stackOffset -= 1
                code.append("cqo")
                code.append("idiv rdi")
                if self.returnDestination != "rdx" {
                    code.append("mov \(returnDestination ?? "rax"), rdx")
                }
            default:
                break
            }      }
        return code
    }
}

public class Addition : ArthmeticExpression {
    public required init() {
        super.init()
        value = "+"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        integerinstruction = "add"
        floatinginstruction = "addsd"
    }
    
}

public class Subtraction : ArthmeticExpression {
    public required init() {
        super.init()
        value = "-"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        integerinstruction = "sub"
        floatinginstruction = "subsd"
    }
}

public class MoreOrEqual : ComparisionExpression {
    public required init() {
        super.init()
        value = ">="
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        compareinstruction = "jg"
    }
}

public class LessOrEqual : ComparisionExpression {
    public required init() {
        super.init()
        value = "<="
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        compareinstruction = "jb"
    }
}

public class More : ComparisionExpression {
    public required init() {
        super.init()
        value = ">"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        compareinstruction = "jge"
    }
    
}

public class Less : ComparisionExpression {
    public required init() {
        super.init()
        value = "<"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        compareinstruction = "jbe"
    }
}

public class Equal : ComparisionExpression {
    public required init() {
        super.init()
        value = "=="
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        compareinstruction = "je"
    }
}

public class NotEqual : ComparisionExpression {
    public required init() {
        super.init()
        value = "!="
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        compareinstruction = "jne"
    }
}

public class BitwiseAnd : BinaryExpression {
    public required init() {
        super.init()
        value = "&"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        instruction = "and"
    }
}

public class BitwiseXor : BinaryExpression {
    public required init() {
        super.init()
        value = "^"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        instruction = "xor"
    }
}

public class BitwiseOr : BinaryExpression {
    public required init() {
        super.init()
        value = "|"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        instruction = "or"
    }
}

public class LogicalAnd : LogicalExpression {
    public required init() {
        super.init()
        value = "&&"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        instruction = "and"
    }
}

public class LogicalOr : LogicalExpression {
    public required init() {
        super.init()
        value = "||"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
        
        instruction = "or"
    }
}

public class Conditional : ConditionalExpression {
    public required init() {
        super.init()
        value = "="
        argumentsNeeded = 3
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
    }
}

public class Assign : AbstractExpression {
    public var offset: Int
    public var destinationReference: String
    
    public required init() {
        offset = 0
        destinationReference = "rbp"
        super.init()
        value = "="
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        code.append(contentsOf: self.evaluateArguments())
        code.append("pop rdi"); stackOffset -= 1
        code.append("pop rsi"); stackOffset -= 1
        if argumentType == "Double" {
            code.append("movq xmm0, rdi")
            code.append("movq qword [rsi], xmm0")
        }
        else {
            code.append("mov qword [rdi], rsi")
            code.append("mov \(returnDestination ?? "rax"), rdi")
        }
        
        return code
    }
}

public class FunctionCall : AbstractExpression {
    var offset = 0
    
    public required init() {
        super.init()
        value = "()"
        argumentsNeeded = 1
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if identifier == "print" {
            if let argument = arguments.getLast() {
                argumentsNeeded = arguments.count
                code.append(contentsOf: self.evaluateArguments())

                if argument.returnType == "Double" {
                    code.append("pop rax") ; stackOffset -= 1
                    code.append("movq xmm0, rax")
                    code.append("mov rdi, fmt_f")
                    code.append("mov rax, 1")
                }
                else {
                    code.append("mov rdi, fmt_i")
                    code.append("pop rsi"); stackOffset -= 1
                }
            }
            code.append("call _printf")
            return code
        }
        else if let index = stack.findFunction(name: identifier) {
            var offset = stackOffset+arguments.count+1
            if (arguments.count+1)%2 == 1 {
                offset += 1
                code.append("sub rsp, 8")
            }
    
            code.append(contentsOf: evaluateArguments())
            code.append("push \(stack.getDistance(from: index)+(stackOffset-arguments.count)*8)") ; stackOffset += 1
            code.append("call \(identifier)")
            code.append("add rsp, \(offset*8)")
        }
        
        return code
    }
}

public class Property : AbstractExpression {
    public required init() {
        super.init()
        value  = "."
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
    }
}

public class ArrayAccess : AbstractExpression {
    public var index = 0
    public var source = "rbp"
    
    public required init() {
        super.init()
        value = "[]"
        argumentsNeeded = 2
        returnType = ""
        argumentType = ""
        returnDestination = "rax"
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
    }
    
    
    public override func getCode() -> [String] {
        var code = [String]()
        if returnType == "Double" {
            let offset = "\(index != 0 ? (index > 0 ? "+\(index)" : "\(index)") : "")"
            code.append("movq \(returnDestination ?? "xmm0"), qword [\(source)\(offset)")
        }
        else {
            code.append("mov \(returnDestination ?? "rax")")
        }
        return code
    }
}

public class LabeledArgument : AbstractExpression {
    public required init() {
        super.init()
        value = "arg"
        argumentsNeeded = 2
        returnDestination = "rax"
        returnType = ""
        argumentType = ""
        arguments = Stack<ExpressionTree>()
        identifier = ""
        stack = ApplicationStack()
    }
}

public class NumberLiteral : AbstractExpression {
    public required init() {
        super.init()
        value = "0"
        argumentsNeeded = 0
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = ReturnType.Int.rawValue
        argumentType = ""
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        switch returnType {
        case "Int":
            if let numericValue = Int(value) {
                code.append("mov \(returnDestination ?? "rax"), \(numericValue)")
            }
        case "Double":
            if let numericValue = Double(value) {
                code.append("mov rax, __float64__(\(numericValue))")
                code.append("movq \(returnDestination ?? "xmm0"), rax")
            }
        default:
            break
        }
        return code
    }
}

public class BooleanLiteral : AbstractExpression {
    public required init() {
        super.init()
        value = "false"
        argumentsNeeded = 0
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = ReturnType.Boolean.rawValue
        argumentType = ReturnType.Boolean.rawValue
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        code.append("mov \(returnDestination ?? "rax"), \((value == "false" ? "0" : "1"))")
        return code
    }
}

public class BranchExpression : AbstractExpression {
    public required init() {
        super.init()
        value = "branch"
        argumentsNeeded = 1
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        for expression in arguments.stack {
            code.append(contentsOf: expression.getCode())
        }
        code.append(".\(identifier)_end:")
        return code
    }
}

public class IfExpresion : AbstractExpression {
    var id : Int?
    public required init() {
        id = nil
        super.init()
        value = "if"
        argumentsNeeded = 1
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        
        var code = [String]()
        let conditionExpression = arguments.pop()
        let testCondition = TestCondition()
        
        testCondition.arguments.push(conditionExpression)
        testCondition.returnDestination = "rax"
        testCondition.argumentType = "Int"
        
        code.append(contentsOf: testCondition.getCode())
        code.append("jne .\(identifier)_\(id != nil ? "\(id!)_" : "")next")
        for expression in arguments.stack {
            let tmp = expression.getCode()
            code.append(contentsOf: tmp)
        }
        code.append("jmp .\(identifier)_end")
        code.append(".\(identifier)_\(id != nil ? "\(id!)_" : "")next:")
        arguments.push(conditionExpression)
        return code
    }
}

public class TestCondition : AbstractExpression {
    public required init() {
        super.init()
        value = "?"
        argumentsNeeded = 1
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        for (index,argument) in arguments.stack.enumerated() {
            argument.identifier = "\(self.identifier)_C\(index+1)"
            code.append(contentsOf: argument.getCode())
        }
        code.append("mov rdi, rax")
        code.append("cmp rdi, 0")
        return code
    }
}

public class LoopExpression : AbstractExpression {
    public required init() {
        super.init()
        value = "loop"
        argumentsNeeded = 1
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        code.append(".\(identifier):")
        let conditionExpression = arguments.pop()
        let testCondition = TestCondition()
        testCondition.identifier = identifier
        testCondition.arguments.push(conditionExpression)
        
        for (index, argument) in conditionExpression.arguments.stack.enumerated() {
            argument.identifier = "\(identifier)_C\(index+1)"
        }
        
        code.append(contentsOf: testCondition.getCode())
        code.append("jne .\(identifier)_end")
        for expression in arguments.stack {
            code.append(contentsOf: expression.getCode())
        }
        code.append("jmp .\(identifier)")
        code.append(".\(identifier)_end:")
        arguments.push(conditionExpression)
        return code
    }
}

public class Returner : AbstractExpression {
    var offset = 0
    
    public required init() {
        super.init()
        value = ""
        argumentsNeeded = 1
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        stack = ApplicationStack()
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        if arguments.count == argumentsNeeded {
            code.append(contentsOf: self.evaluateArguments())
            code.append("pop rax"); stackOffset -= 1
            if offset != 0 { code.append("add rsp, \(offset)") }
            code.append("jmp .\(identifier)_ret")
        }
        return code
    }
}

public class ReferenceAccess : AbstractExpression {
    var contextNeeded = false
    var initializedAguments : [Argument] = []
    
    public required init() {
        super.init()
        value = ""
        argumentsNeeded = 0
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        stack = ApplicationStack()
    }
    
    public init(stack: ApplicationStack, name: String) {
        super.init()
        value = name
        argumentsNeeded = 0
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        self.stack = stack
        
        if let stackPosition = stack.findInstance(name: value) {
            returnType = stack.getItem(at: stackPosition).declarationType
        }
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        
        for (index, argument) in initializedAguments.enumerated() {
            if argument.internalName == value {
                let pattern = try! NSRegularExpression(pattern: "^xmm.*")
                if pattern.matches(self.returnDestination ?? "") {
                    code.append("lea \(returnDestination ?? "xmm0"), [rbp+\(16+(index+1)*8)]")
                }
                else {
                    code.append("lea \(returnDestination ?? "rax"), [rbp+\(16+(index+1)*8)]")
                }
                return code
            }
        }
        
        if let stackPosiion = stack.findInstance(name: value) {
            let offset = stack.getOffset(of: stackPosiion)
            self.returnType = stack.getItem(at: stackPosiion).returnType
            let sign = "\(offset > 0 ? "+" : "")"
            if contextNeeded && offset >= 0 {
                code.append("mov rdi, qword [rbp+16]")
                let position = "\(offset >= 0 ? "+rdi" : "")\(sign)\(offset != 0 ? "\(offset)": "")"
                code.append("lea \(returnDestination ?? "rax"), [rbp\(position)]")
            }
            else {
                code.append("lea \(returnDestination ?? "rax"), [rbp\(sign)\(offset != 0 ? "\(offset)" : "")]")
            }
        }
        return code
    }
}

public class ObjectAccess : AbstractExpression {
    var contextNeeded = false
    var initializedAguments : [Argument] = []
    
    public required init() {
        super.init()
        value = ""
        argumentsNeeded = 0
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        stack = ApplicationStack()
    }
    
    public init(stack: ApplicationStack, name: String) {
        super.init()
        value = name
        argumentsNeeded = 0
        returnDestination = nil
        arguments = Stack<ExpressionTree>()
        returnType = nil
        argumentType = nil
        identifier = ""
        self.stack = stack
        
        if let stackPosition = stack.findInstance(name: value) {
            argumentType = stack.getItem(at: stackPosition).declarationType
            returnType = stack.getItem(at: stackPosition).declarationType
            if returnType == "Double" {
                returnDestination = "xmm0"
            }
            else {
                returnDestination = "rax"
            }
        }
    }
    
    public override func getCode() -> [String] {
        var code = [String]()
        
        for (index, argument) in initializedAguments.enumerated() {
            if argument.internalName == value {
                let pattern = try! NSRegularExpression(pattern: "^xmm.*")
                if pattern.matches(self.returnDestination ?? "") {
                    code.append("movq \(returnDestination ?? "xmm0"), qword [rbp+\(16+(index+1)*8)]")
                }
                else {
                    code.append("mov \(returnDestination ?? "rax"), qword [rbp+\(16+(index+1)*8)]")
                }
               
                return code
            }
        }
        
        if let stackPosiion = stack.findInstance(name: value) {
            let offset = stack.getOffset(of: stackPosiion)
            self.returnType = stack.getItem(at: stackPosiion).returnType
            let sign = "\(offset > 0 ? "+" : "")"
            if contextNeeded && offset >= 0 {
                code.append("mov rdi, qword [rbp+16]")
                let position = "\(offset >= 0 ? "+rdi" : "")\(sign)\(offset != 0 ? "\(offset)": "")"
                
                let pattern = try! NSRegularExpression(pattern: "^xmm.*")
                if pattern.matches(self.returnDestination ?? "") {
                    code.append("movq \(returnDestination ?? "xmm0"), qword [rbp\(position)]")
                }
                else {
                    
                    code.append("mov \(returnDestination ?? "rax"), qword [rbp\(position)]")
                }
            }
            else {
                let pattern = try! NSRegularExpression(pattern: "^xmm.*")
                if pattern.matches(self.returnDestination ?? "") {
                    code.append("movq \(returnDestination ?? "xmm0"), qword [rbp\(sign)\(offset != 0 ? "\(offset)" : "")]")
                }
                else {
                    code.append("mov \(returnDestination ?? "rax"), qword [rbp\(sign)\(offset != 0 ? "\(offset)" : "")]")
                }
            }
        }
        return code
    }
}

public extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}

