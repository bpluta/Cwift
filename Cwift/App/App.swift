import Foundation
import Antlr4

public class App : Code {
    public var statements : Statements
    public var stack = ApplicationStack()
    var sourceFile : String
    
    public init(file: String) {
        statements = Statements(parent: nil, stack: self.stack)
        sourceFile = file
        initializePrimitives()
    }
    
    public func getCode() -> [String] {
        var code = [String]()
        code.append("extern _printf")
        code.append("")
        code.append(contentsOf: sectionData())
        code.append("")
        code.append("section .text")
        code.append("global _main")
        code.append("")
        code.append(contentsOf: parse())
        
        return code
    }
    
    func parse() -> [String] {
        var code = [String]()
        do {
            guard let path = Bundle.main.path(forResource: sourceFile, ofType: "cwift") else  {
                throw RuntimeError.FileNotFoundException
            }
            let input = try ANTLRFileStream(path, String.Encoding.utf8)
            let lexer = CwiftLexer(input)
            let tokens = CommonTokenStream(lexer)
            let parser = try CwiftParser(tokens)
            
            let statementsListener = StatementsListener(of: self.statements)
            statementsListener.scopeName = "_main"
            
            try? parser.statements().enterRule(statementsListener)
            _ = statementsListener.getResult()
            
            let mainFunction = Function(name: "_main")
            mainFunction.expressions = statements.expressions
            
            statements.stack.alignStack()

            mainFunction.size = statements.stack.getContextSize()
            mainFunction.generateCode()
            code.append(contentsOf: mainFunction.getCode())
            code.append("")
            
            for function in statements.functions {
                code.append(contentsOf: function.getCode())
                code.append("")
            }
            
        } catch {
            print("Error: \(error)")
        }
        return code
    }
    
    func initializePrimitives() {
        stack.enterFunction()
        stack.push(item: Operation(type: .type, name: "Int"))
        stack.push(item: Operation(type: .type, name: "Double"))
        stack.push(item: Operation(type: .type, name: "Bool"))
        stack.push(item: Operation(type: .type, name: "Char"))
        stack.push(item: Operation(type: .type, name: "String"))
    }
    
    func sectionData() -> [String] {
        var code = [String]()
        code.append("section .data")
        code.append("fmt_i: db \"%ld\",10,0")
        code.append("fmt_f: db \"%lf\",10,0")
        return code
    }
}
