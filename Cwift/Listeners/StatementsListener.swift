import Foundation

class StatementsListener : CwiftBaseListener {
    var applicationStack = ApplicationStack()
    var description: [String]? = [String]()
    let context : Statements
    var contextNeeded = false
    var stackPointer = 0
    var expressionStack = Stack<ExpressionTree>()
    var internalUse = false
    var scopeName = ""
    var initializedArguments = [Argument]()
    
    var declarations = [Operation]()
    
    
    init(of context : Statements) {
        self.context = context
    }
    
    override func enterStatements(_ ctx: CwiftParser.StatementsContext) {
        let declarationListener = DeclarationListener(of: context)
        ctx.statement().forEach{ statement in
            statement.enterRule(self)
            description = description ?? [String]()
            description!.append(declarationListener.getResult())
        }
    }
    
    override func enterStatement(_ ctx: CwiftParser.StatementContext) {
        let declarationListener = DeclarationListener(of: context)
        declarationListener.contextNeeded = contextNeeded
        declarationListener.internalUse = internalUse
        declarationListener.initializedArguments = initializedArguments
        
        let expressionListener = ExpressionListener(of: context)
        expressionListener.contextNeeded = contextNeeded
        expressionListener.initializedArguments = initializedArguments
        
        let loopListener = LoopListener(of: context)
        loopListener.contextNeeded = contextNeeded
        loopListener.internalUse = internalUse
        loopListener.initializedArguments = initializedArguments
        
        let returnListener = ReturnListener(of: context)
        returnListener.contextNeeded = contextNeeded
        returnListener.internalUse = internalUse
        returnListener.scopeName = scopeName
        returnListener.initializedArguments = initializedArguments
        
        let branchListener = BranchListener(of: context)
        branchListener.contextNeeded = contextNeeded
        branchListener.internalUse = internalUse
        branchListener.initializedArguments = initializedArguments
        
        ctx.declaration()?.enterRule(declarationListener)
        
        ctx.expression()?.enterRule(expressionListener)
        
        ctx.returnStatement()?.enterRule(returnListener)
        
        ctx.loopStatement()?.enterRule(loopListener)
        
        ctx.branchStatement()?.enterRule(branchListener)

        for tree in declarationListener.expressionStack.stack {
            if internalUse {
                expressionStack.push(tree)
            }
            else { context.expressions.append(tree) }
            
        }
        
        
        for tree in expressionListener.expressionStack.stack {
            if internalUse {
                expressionStack.push(tree)
            }
            else { context.expressions.append(tree) }
        }
        
        for tree in returnListener.expressionStack.stack {
            if internalUse {
                expressionStack.push(tree)
            }
            else {
                context.expressions.append(tree)
            }
        }
        
        for tree in loopListener.expressionStack.stack {
            if internalUse {
                expressionStack.push(tree)
            }
            else {
                context.expressions.append(tree)
            }
        }
        
        for tree in branchListener.expressionStack.stack {
            if internalUse {
                expressionStack.push(tree)
            }
            else {
                context.expressions.append(tree)
            }
        }
    }

    override func enterDeclaration(_ ctx: CwiftParser.DeclarationContext) {
        ctx.constantDeclaration()?.enterRule(self)
        ctx.variableDeclaration()?.enterRule(self)
    }
    
    func getResult() -> [String] {
        return description ?? [String]()
    }
}

class DeclarationListener : CwiftBaseListener {
    let context: Statements
    var result: String?
    var expressionStack = Stack<ExpressionTree>()
    var contextDepth = 0
    var stackPointer = 0
    var internalUse = false
    var contextNeeded = false
    var initializedArguments = [Argument]()
    
    init(of context: Statements) {
        self.context = context
    }
    
    override func enterDeclaration(_ ctx: CwiftParser.DeclarationContext) {
        ctx.constantDeclaration()?.enterRule(self)
        ctx.variableDeclaration()?.enterRule(self)
        ctx.functionDeclaration()?.enterRule(self)
    }
    
    override func enterConstantDeclaration(_ ctx: CwiftParser.ConstantDeclarationContext) {

        if let primitiveType = ctx.declarator()?.typeDeclarator()?.primitiveTypeDeclarator() {
            if let foundTypeIndex = context.stack.findType(name: primitiveType.getText()) {
                let name = ctx.declarator()!.Identifier()!.description
                let typeName = context.stack.getItem(at: foundTypeIndex).name ?? "undefinied"
                let size = context.stack.getItem(at: foundTypeIndex).size
                context.stack.pushConstant(name: name, declarationType: typeName, count: 1, size: size)

                let expressionListener = ExpressionListener(of: context)
                expressionListener.contextNeeded = contextNeeded
                expressionListener.initializedArguments = initializedArguments
                ctx.initializer()?.expression()?.enterRule(expressionListener)
                
                let reference = ReferenceAccess(stack: context.stack, name: name)
                reference.value = name
                reference.returnType = typeName
                reference.argumentType = typeName
                reference.returnDestination = "rax"
                reference.initializedAguments = initializedArguments
                
                let expression = expressionListener.expressionStack.getLast()!
                let assignment = Assign(stack: context.stack, arguments: [expression, reference])
                assignment.returnDestination = expression.returnDestination
                assignment.returnType = expression.returnType
                assignment.argumentType = typeName
                assignment.offset = context.stack.getOffset(of: context.stack.findInstance(name: name)!)
                
                expressionStack.push(assignment)
            }
        }
    }
    override func enterVariableDeclaration(_ ctx: CwiftParser.VariableDeclarationContext) {
        if let primitiveType = ctx.declarator()?.typeDeclarator()?.primitiveTypeDeclarator() {
            if let foundTypeIndex = context.stack.findType(name: primitiveType.getText()) {
                let name = ctx.declarator()!.Identifier()!.description
                let typeName = context.stack.getItem(at: foundTypeIndex).name ?? "undefinied"
                let size = context.stack.getItem(at: foundTypeIndex).size
                context.stack.pushVariable(name: name, declarationType: typeName, count: 1, size: size)
                
                let expressionListener = ExpressionListener(of: context)
                expressionListener.contextNeeded = contextNeeded
                expressionListener.initializedArguments = initializedArguments
                ctx.initializer()?.expression()?.enterRule(expressionListener)
                
                let reference = ReferenceAccess(stack: context.stack, name: name)
                reference.value = name
                reference.returnType = typeName
                reference.argumentType = typeName
                reference.returnDestination = "rax"
                reference.initializedAguments = initializedArguments
                let expression = expressionListener.expressionStack.getLast()!
                let assignment = Assign(stack: context.stack, arguments: [expression, reference])
                assignment.returnDestination = expression.returnDestination
                assignment.returnType = expression.returnType
                assignment.argumentType = typeName
                assignment.offset = context.stack.getOffset(of: context.stack.findInstance(name: name)!)
                
                expressionStack.push(assignment)
            }
        }
    }
    
    override func enterFunctionDeclaration(_ ctx: CwiftParser.FunctionDeclarationContext) {
        var functionDeclaration = Operation(type: .function)
        functionDeclaration.name = ctx.Identifier()?.getText()
        self.contextDepth += 1
        self.stackPointer = context.stack.count
        let statementListener = StatementsListener(of: context)
        statementListener.internalUse = true
        statementListener.contextNeeded = true
        statementListener.scopeName = functionDeclaration.name ?? "undefinied"
        
        let newFunction = Function(name: functionDeclaration.name ?? "undefinied")
        
        
        var allocatedItems = 0
        let parameters = ctx.parameterClause()?.parameterList()?.parameter() ?? []
        
        if parameters.count%2 == 0 {
            context.stack.push(item: Operation(type: .empty, count: 1, size: 8, name: nil, returnType: "Int"))
            allocatedItems += 1
        }
        
        var arguments = [Argument]()
        
        for parameter in parameters {
            let internalName = parameter.localParameterName()?.getText() ?? "undefinied"
            let externalName = parameter.externalParameterName()?.getText()
            let type = parameter.typeStatement()?.getText() ?? "Int"
            
            let argument = Argument(internalName: internalName, externalName: externalName, type: type)
            arguments.append(argument)
            newFunction.argumentList.append(argument)
            context.stack.pushConstant(name: internalName, declarationType: type, count: 1, size: 8)
            allocatedItems += 1
        }
        
        context.stack.push(item: Operation(type: .empty, count: 1, size: 8, name: "rbpPointer", returnType: "Int"))
        allocatedItems+=1
        
        context.stack.enterFunction()
        statementListener.initializedArguments = arguments
                context.stack.alignStack()

        context.functions.append(newFunction)
        context.stack.pushFunction(name: functionDeclaration.name ?? "undefinied", declarationType: ctx.returnSignature()?.typeStatement()?.primitiveTypeStatement()?.getText() ?? "undefinied")
        ctx.codeBlock()?.statements()?.enterRule(statementListener)
        
        for expression in statementListener.expressionStack.stack {
            newFunction.expressions.append(expression)
        }
        context.functions.removeLast()
        newFunction.size = context.stack.getContextSize()
        newFunction.stackPointer = context.stack.count-1
        newFunction.generateCode()
        
        context.stack.exitFunction()
        context.stack.stack.stack.removeLast(allocatedItems+1)
        context.functions.append(newFunction)
        
        self.contextDepth -= 1
        
        context.stack.pushFunction(name: functionDeclaration.name ?? "undefinied", declarationType: ctx.returnSignature()?.typeStatement()?.primitiveTypeStatement()?.getText() ?? "undefinied")
    }
    
    func getResult() -> String {
        return result ?? ""
    }
}

class LoopListener : CwiftBaseListener {
    let context : Statements
    var expressionStack = Stack<ExpressionTree>()
    var loop : LoopExpression
    var contextNeeded : Bool
    var internalUse : Bool
    var initializedArguments = [Argument]()
    
    init(of context: Statements) {
        self.context = context
        self.loop = LoopExpression()
        self.contextNeeded = false
        self.internalUse = false
    }
    override func enterLoopStatement(_ ctx: CwiftParser.LoopStatementContext) {
        let loopIdentifier = context.getNextLabel()
        self.loop = LoopExpression()
        loop.identifier = loopIdentifier
        
        let statementListener = StatementsListener(of: context)
        statementListener.internalUse = true
        statementListener.contextNeeded = contextNeeded
        statementListener.initializedArguments = initializedArguments
        ctx.codeBlock()?.statements()?.enterRule(statementListener)
        
        loop.arguments.stack.append(contentsOf: statementListener.expressionStack.stack)
        expressionStack.stack = []
        
        let expressionListener = ExpressionListener(of: context)
        expressionListener.contextNeeded = contextNeeded
        ctx.expression()?.enterRule(expressionListener)
        let conditionalExpression = expressionListener.expressionStack.getLast()!
        conditionalExpression.identifier = loopIdentifier
        loop.arguments.push(conditionalExpression)
        
        expressionStack.stack = []
        expressionStack.push(loop)
    }
    
    override func enterCodeBlock(_ ctx: CwiftParser.CodeBlockContext) {
        
        let statementListener = StatementsListener(of: context)
        statementListener.contextNeeded = contextNeeded
        statementListener.internalUse = true
        statementListener.initializedArguments = initializedArguments
        
        ctx.statements()?.enterRule(statementListener)
        
        for expression in statementListener.expressionStack.stack {
           expressionStack.stack.append(expression)
        }
        
        expressionStack.stack.append(contentsOf: statementListener.expressionStack.stack)
    }
}

class BranchListener : CwiftBaseListener {
    let context : Statements
    var expressionStack = Stack<ExpressionTree>()
    var branch : BranchExpression
    var branchIdentifier : String
    var currentId : Int
    var contextNeeded : Bool
    var internalUse : Bool
    var initializedArguments = [Argument]()
    
    init(of context: Statements) {
        self.context = context
        self.branch = BranchExpression()
        self.branchIdentifier = ""
        self.currentId = 0
        self.contextNeeded = false
        self.internalUse = false
    }
    override func enterBranchStatement(_ ctx: CwiftParser.BranchStatementContext) {
        currentId = 0
        branchIdentifier = context.getNextLabel()
        self.branch = BranchExpression()
        branch.identifier = branchIdentifier
        
        ctx.ifStatement()?.ifExpression()?.enterRule(self)
        if let elseIfArray = ctx.ifStatement()?.elseIfExpression() {
            for elseIfExpression in elseIfArray {
                elseIfExpression.enterRule(self)
            }
        }
        ctx.ifStatement()?.elseExpression()?.enterRule(self)
        
        expressionStack.push(branch)
    }
    
    override func enterIfExpression(_ ctx: CwiftParser.IfExpressionContext) {
        let conditional = IfExpresion()
        self.currentId += 1
        conditional.id = currentId
        conditional.identifier = branchIdentifier
        
        let statementListener = StatementsListener(of: context)
        statementListener.internalUse = true
        statementListener.contextNeeded = contextNeeded
        statementListener.initializedArguments = initializedArguments
        ctx.codeBlock()?.statements()?.enterRule(statementListener)
        
        conditional.arguments.stack.append(contentsOf: statementListener.expressionStack.stack)
        
        expressionStack.stack = []
        
        let expressionListener = ExpressionListener(of: context)
        expressionListener.contextNeeded = contextNeeded
        expressionListener.initializedArguments = initializedArguments
        ctx.expression()?.enterRule(expressionListener)
        let conditionalExpression = expressionListener.expressionStack.getLast()!
        conditionalExpression.identifier = branchIdentifier + "_\(currentId)"
        conditional.arguments.push(conditionalExpression)
        
        expressionStack.stack = []
        branch.arguments.push(conditional)
    }
    
    override func enterElseIfExpression(_ ctx: CwiftParser.ElseIfExpressionContext) {
        let conditional = IfExpresion()
        self.currentId += 1
        conditional.id = currentId
        conditional.identifier = branchIdentifier
        
        
        let statementListener = StatementsListener(of: context)
        statementListener.internalUse = true
        statementListener.contextNeeded = contextNeeded
        statementListener.initializedArguments = initializedArguments
        ctx.ifExpression()?.codeBlock()?.statements()?.enterRule(statementListener)
        conditional.arguments.stack.append(contentsOf: statementListener.expressionStack.stack)
        
        expressionStack.stack = []
        
        let expressionListener = ExpressionListener(of: context)
        expressionListener.contextNeeded = contextNeeded
        expressionListener.initializedArguments = initializedArguments
        ctx.ifExpression()?.expression()?.enterRule(expressionListener)
        let conditionalExpression = expressionListener.expressionStack.getLast()!
        conditionalExpression.identifier = branchIdentifier + "_\(currentId)"
        conditional.arguments.push(conditionalExpression)
        
        expressionStack.stack = []
        branch.arguments.push(conditional)
    }
    
    override func enterElseExpression(_ ctx: CwiftParser.ElseExpressionContext) {
        let statementListener = StatementsListener(of: context)
        statementListener.internalUse = true
        statementListener.contextNeeded = contextNeeded
        statementListener.initializedArguments = initializedArguments
        ctx.codeBlock()?.statements()?.enterRule(statementListener)
        let expressions = statementListener.expressionStack.stack
        branch.arguments.stack.append(contentsOf: expressions)
    }
    
    override func enterCodeBlock(_ ctx: CwiftParser.CodeBlockContext) {
        
        let statementListener = StatementsListener(of: context)
        statementListener.contextNeeded = contextNeeded
        statementListener.internalUse = internalUse
        statementListener.initializedArguments = initializedArguments
        ctx.statements()?.enterRule(statementListener)
        
        for expression in statementListener.expressionStack.stack {
            expressionStack.stack.append(expression)
        }
        
        expressionStack.stack.append(contentsOf: statementListener.expressionStack.stack)
    }
}


class ReturnListener : CwiftBaseListener {
    let context : Statements
    var expressionStack = Stack<ExpressionTree>()
    var internalUse = false
    var contextNeeded = false
    var scopeName = ""
    var initializedArguments = [Argument]()
    
    init(of context: Statements) {
        self.context = context
    }
    override func enterReturnStatement(_ ctx: CwiftParser.ReturnStatementContext) {
        let expressionListener = ExpressionListener(of: context)
        expressionListener.contextNeeded = contextNeeded
        expressionListener.initializedArguments = initializedArguments
        ctx.expression()?.enterRule(expressionListener)
        
        var arguments : [ExpressionTree] = []
        if let expression = expressionListener.expressionStack.getLast() {
            arguments = [expression]
        }
        let returnExpression = Returner(stack: context.stack, arguments: arguments)
        returnExpression.identifier = scopeName
        returnExpression.offset = 0
        
        expressionStack.push(returnExpression)
    }
}
