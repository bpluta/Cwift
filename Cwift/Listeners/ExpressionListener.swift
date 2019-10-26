import Foundation

class ExpressionListener : CwiftBaseListener {
    
    let context : Statements
    var expressionStack = Stack<ExpressionTree>()
    var numberOfArguments = 0
    var contextNeeded = false
    var initializedArguments = [Argument]()
    
    init(of context : Statements) {
        self.context = context
    }
    
    override func enterExpression(_ ctx: CwiftParser.ExpressionContext) {
        ctx.assignmentExpression()?.enterRule(self)
    }
    
    override func enterAssignmentExpression(_ ctx: CwiftParser.AssignmentExpressionContext) {
        if let _ = ctx.Assign() {
            ctx.unaryExpression()?.enterRule(self)
            ctx.assignmentExpression()?.enterRule(self)
            handleAssigmentOperator(ctx)
        }
        else {
            ctx.conditionalExpression()?.enterRule(self)
        }
    }
    
    override func enterConditionalExpression(_ ctx: CwiftParser.ConditionalExpressionContext) {
        ctx.logicalOrExpression()?.enterRule(self)
        if let _ = ctx.Colon() {
            if let _ = ctx.Question() {
                ctx.expression()?.enterRule(self)
                ctx.conditionalExpression()?.enterRule(self)
                handleConditionalOperator(ctx)
            }
        }
    }
    
    override func enterLogicalOrExpression(_ ctx: CwiftParser.LogicalOrExpressionContext) {
        ctx.logicalAndExpression()?.enterRule(self)
        if let _ = ctx.LogicalOr() {
            ctx.logicalOrExpression()?.enterRule(self)
            handleLogicalOr(ctx)
        }
    }
    
    override func enterLogicalAndExpression(_ ctx: CwiftParser.LogicalAndExpressionContext) {
        ctx.bitwiseOrExpression()?.enterRule(self)
        if let _ = ctx.LogicalAnd() {
            ctx.logicalAndExpression()?.enterRule(self)
            handleLogicalAnd(ctx)
        }
    }
    
    override func enterBitwiseOrExpression(_ ctx: CwiftParser.BitwiseOrExpressionContext) {
        ctx.bitwiseXorExpression()?.enterRule(self)
        if let _ = ctx.BitwiseOr() {
            ctx.bitwiseOrExpression()?.enterRule(self)
            handleBitwiseOr(ctx)
        }
    }
    
    override func enterBitwiseXorExpression(_ ctx: CwiftParser.BitwiseXorExpressionContext) {
        ctx.bitwiseAndExpression()?.enterRule(self)
        if let _ = ctx.BitwiseXor() {
            ctx.bitwiseXorExpression()?.enterRule(self)
            handleBitwiseXor(ctx)
        }
    }
    
    override func enterBitwiseAndExpression(_ ctx: CwiftParser.BitwiseAndExpressionContext) {
        ctx.equalityExpression()?.enterRule(self)
        if let _ = ctx.BitwiseAnd() {
            ctx.bitwiseAndExpression()?.enterRule(self)
            handleBitwiseAnd(ctx)
        }
    }
    
    override func enterEqualityExpression(_ ctx: CwiftParser.EqualityExpressionContext) {
        ctx.relationalExpression()?.enterRule(self)
        if let _ = ctx.Equal() {
            ctx.equalityExpression()?.enterRule(self)
            handleEqual(ctx)
        }
        if let _ = ctx.NotEqual() {
            ctx.equalityExpression()?.enterRule(self)
            handleNotEqual(ctx)
        }
    }
    
    override func enterRelationalExpression(_ ctx: CwiftParser.RelationalExpressionContext) {
        ctx.additiveExpression()?.enterRule(self)
        if let _ = ctx.Less() {
            ctx.relationalExpression()?.enterRule(self)
            handleLess(ctx)
        }
        if let _ = ctx.LessOrEqual() {
            ctx.relationalExpression()?.enterRule(self)
            handleLessOrEqual(ctx)
        }
        if let _ = ctx.More() {
            ctx.relationalExpression()?.enterRule(self)
            handleMore(ctx)
        }
        if let _ = ctx.MoreOrEqual() {
            ctx.relationalExpression()?.enterRule(self)
            handleMoreOrEqual(ctx)
        }
    }
    
    override func enterAdditiveExpression(_ ctx: CwiftParser.AdditiveExpressionContext) {
        ctx.multiplicativeExpression()?.enterRule(self)
        if let _ = ctx.Addition() {
            ctx.additiveExpression()?.enterRule(self)
            handleAddition(ctx)
        }
        if let _ = ctx.Subtraction() {
            ctx.additiveExpression()?.enterRule(self)
            handleSubtraction(ctx)
        }
    }
    
    override func enterMultiplicativeExpression(_ ctx: CwiftParser.MultiplicativeExpressionContext) {
        ctx.unaryExpression()?.enterRule(self)
        if let _ = ctx.Division() {
            ctx.multiplicativeExpression()?.enterRule(self)
            handleDivision(ctx)
        }
        if let _ = ctx.Multiplication() {
            ctx.multiplicativeExpression()?.enterRule(self)
            handleMultiplication(ctx)
        }
        if let _ = ctx.Remainder() {
            ctx.multiplicativeExpression()?.enterRule(self)
            handleRemainder(ctx)
        }
    }
    
    override func enterUnaryExpression(_ ctx: CwiftParser.UnaryExpressionContext) {
        ctx.postfixExpression()?.enterRule(self)
    }
    
    override func enterPostfixExpression(_ ctx: CwiftParser.PostfixExpressionContext) {
        ctx.primaryExpression()?.enterRule(self)
        ctx.functionCallExpression()?.enterRule(self)
    }
    
    override func enterFunctionCallExpression(_ ctx: CwiftParser.FunctionCallExpressionContext) {
        ctx.functionCallArgumentClause()?.enterRule(self)
        if let identifier = ctx.Identifier()?.getText() {
            handleFunctionCallExpression(label: identifier)
        }
    }
    
    override func enterFunctionCallArgumentClause(_ ctx: CwiftParser.FunctionCallArgumentClauseContext) {
        ctx.functionCallArgumentList()?.enterRule(self)
    }
    
    override func enterFunctionCallArgumentList(_ ctx: CwiftParser.FunctionCallArgumentListContext) {
        for arg in ctx.functionCallArgument() {
            self.numberOfArguments += 1
            arg.expression()?.enterRule(self)
        }
    }
    
    func handleIdentifier(name : String) {
        let expression = ObjectAccess(stack: context.stack, name: name)
        expression.contextNeeded = contextNeeded
        expression.initializedAguments = initializedArguments
        self.expressionStack.push(expression)
    }
    
    override func enterPrimaryExpression(_ ctx: CwiftParser.PrimaryExpressionContext) {
        if let identifier = ctx.Identifier()?.getText() {
            handleIdentifier(name: identifier)
        }
        if let _ = ctx.literalExpression() {
            ctx.literalExpression()?.enterRule(self)
        }
        if let _ = ctx.expression() {
            ctx.expression()?.enterRule(self)
        }
    }
    
    override func enterLiteralExpression(_ ctx: CwiftParser.LiteralExpressionContext) {
        ctx.literal()?.enterRule(self)
    }
    
    override func enterLiteral(_ ctx: CwiftParser.LiteralContext) {
        if let integerLiteral = ctx.IntegerLiteral()?.getText() {
            let expression = NumberLiteral(stack: context.stack, value: integerLiteral, returnType: "Int", argumentType: "Int", destination: "rax")
            self.expressionStack.push(expression)
        }
        if let doubleLiteral = ctx.DoubleLiteral()?.getText() {
            let expression = NumberLiteral(stack: context.stack, value: doubleLiteral, returnType: "Double", argumentType: "Double", destination: "xmm0")
            self.expressionStack.push(expression)
        }
        if let booleanLiteral = ctx.booleanLiteral()?.getText() {
            let expression = ExpressionAtom()
            expression.type = .Boolean
            expression.value = booleanLiteral
        }
        if let nilLiteral = ctx.Nil()?.getText() {
            let expression = ExpressionAtom()
            expression.type = .Nil
            expression.value = nilLiteral
        }
    }
}

extension ExpressionListener {
    
    private func mergeExpressions<T:ExpressionTree>(amountOfArguments : Int) -> T {
        var argumentArray = [ExpressionTree]()
        for _ in 0..<amountOfArguments {
            argumentArray.append(self.expressionStack.pop())
        }
        let expression = T.init()
        for argument in argumentArray.reversed() {
            expression.arguments.push(argument)
            expression.argumentType = argument.returnType
            expression.returnType = argument.returnType
            expression.returnDestination = argument.returnDestination
        }
       
        self.expressionStack.push(expression)
        return expression
    }
    
    private func handleMultiplication(_ ctx: CwiftParser.MultiplicativeExpressionContext) {
        let _ : Multiplication = mergeExpressions(amountOfArguments: 2)
    }
    private func handleDivision(_ ctx: CwiftParser.MultiplicativeExpressionContext) {
        let _ : Division = mergeExpressions(amountOfArguments: 2)
    }
    private func handleRemainder(_ ctx: CwiftParser.MultiplicativeExpressionContext) {
        let _ : Remainder = mergeExpressions(amountOfArguments: 2)
    }
    private func handleAddition(_ ctx: CwiftParser.AdditiveExpressionContext) {
        let _ : Addition = mergeExpressions(amountOfArguments: 2)
    }
    private func handleSubtraction(_ ctx: CwiftParser.AdditiveExpressionContext) {
        let _ : Subtraction = mergeExpressions(amountOfArguments: 2)
    }
    private func handleMoreOrEqual(_ ctx: CwiftParser.RelationalExpressionContext) {
        let _ : MoreOrEqual = mergeExpressions(amountOfArguments: 2)
    }
    private func handleLessOrEqual(_ ctx: CwiftParser.RelationalExpressionContext) {
        let _ : LessOrEqual = mergeExpressions(amountOfArguments: 2)
    }
    private func handleMore(_ ctx: CwiftParser.RelationalExpressionContext) {
        let _ : More = mergeExpressions(amountOfArguments: 2)
    }
    private func handleLess(_ ctx: CwiftParser.RelationalExpressionContext) {
        let _ : Less = mergeExpressions(amountOfArguments: 2)
    }
    private func handleEqual(_ ctx: CwiftParser.EqualityExpressionContext) {
        let _ : Equal = mergeExpressions(amountOfArguments: 2)
    }
    private func handleNotEqual(_ ctx: CwiftParser.EqualityExpressionContext) {
        let _ : NotEqual = mergeExpressions(amountOfArguments: 2)
    }
    private func handleBitwiseAnd(_ ctx: CwiftParser.BitwiseAndExpressionContext) {
        let _ : BitwiseAnd = mergeExpressions(amountOfArguments: 2)
    }
    private func handleBitwiseXor(_ ctx: CwiftParser.BitwiseXorExpressionContext) {
        let _ : BitwiseXor = mergeExpressions(amountOfArguments: 2)
    }
    private func handleBitwiseOr(_ ctx: CwiftParser.BitwiseOrExpressionContext) {
        let _ : BitwiseOr = mergeExpressions(amountOfArguments: 2)
    }
    private func handleLogicalAnd(_ ctx: CwiftParser.LogicalAndExpressionContext) {
        let _ : LogicalAnd = mergeExpressions(amountOfArguments: 2)
    }
    private func handleLogicalOr(_ ctx: CwiftParser.LogicalOrExpressionContext) {
        let _ : LogicalOr = mergeExpressions(amountOfArguments: 2)
    }
    
    private func handleArrayAccess(_ ctx: CwiftParser.PostfixExpressionContext) {
        let _ : ArrayAccess = mergeExpressions(amountOfArguments: 2)
    }
    
    private func handleFunctionArgument(_ ctx: CwiftParser.FunctionCallArgumentContext) {
        let _ : LabeledArgument = mergeExpressions(amountOfArguments: 2)
    }
    
    private func handleFunctionCallExpression(label: String) {

        if label == "print" {
            let expression : FunctionCall = FunctionCall()
            expression.stack = context.stack
            expression.identifier = label
            expression.returnType = "Int"
            
            if numberOfArguments > 0 {
                expression.arguments.push(self.expressionStack.pop())
            }
            
            expression.value = label+"()"
            expressionStack.push(expression)
        }
        if let index = context.stack.findFunction(name: label) {
            let expression : FunctionCall = FunctionCall()
            expression.stack = context.stack
            expression.identifier = label
            expression.returnType = context.stack.getItem(at: index).declarationType
            
            expression.offset = context.stack.getDistance(from: index)
            var functionArguments = 0
            for function in context.functions {
                if function.name == label {
                    functionArguments = function.argumentList.count
                    for argument in function.argumentList {
                        self.initializedArguments.append(argument)
                    }
                }
            }

            for _ in 0..<functionArguments {
                expression.arguments.push(self.expressionStack.pop())
            }
            
            expression.argumentsNeeded = expression.arguments.count
            expression.value = label+"()"
            expressionStack.push(expression)
            
            initializedArguments = []
        }
    }
    
    private func handleAssigmentOperator(_ ctx: CwiftParser.AssignmentExpressionContext) {

        if let name = ctx.unaryExpression()?.postfixExpression()?.primaryExpression()?.Identifier()?.description {
            let value = self.expressionStack.pop()
            let variable = self.expressionStack.pop()
            
            let reference = ReferenceAccess(stack: context.stack, name: name)
            reference.value = name
            reference.returnType = variable.returnType
            reference.argumentType = variable.argumentType
            reference.returnDestination = "rax"
            reference.contextNeeded = (variable as? ObjectAccess)?.contextNeeded ?? false
            reference.initializedAguments = initializedArguments
            
            
            self.expressionStack.push(value)
            self.expressionStack.push(reference)
            
        }
        let _ : Assign = mergeExpressions(amountOfArguments: 2)
    }
    
    private func handleConditionalOperator(_ ctx: CwiftParser.ConditionalExpressionContext) {
        let expression : Conditional = mergeExpressions(amountOfArguments: 3)
        print(expression.getResult())
    }
}
