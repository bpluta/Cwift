import Foundation

public class Statements : Code {
    
    let root : Statements?
    public unowned let stack : ApplicationStack
    public var functions = [Function]()
    public var expressions = [ExpressionTree]()
    private var currentNumber = 0
    
    public init(parent: Statements?, stack: ApplicationStack) {
        self.stack = stack
        self.root = parent
    }
    
    public func getCode() -> [String] {
        return []
    }

    func getNextLabel() -> String {
        currentNumber += 1
        return "L\(currentNumber)"
    }
}
