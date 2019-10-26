// Generated from Cwift.g4 by ANTLR 4.7.1
import Antlr4

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CwiftParser}.
 */
public protocol CwiftListener: ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CwiftParser#statements}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatements(_ ctx: CwiftParser.StatementsContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#statements}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatements(_ ctx: CwiftParser.StatementsContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterStatement(_ ctx: CwiftParser.StatementContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#statement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitStatement(_ ctx: CwiftParser.StatementContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#returnStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterReturnStatement(_ ctx: CwiftParser.ReturnStatementContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#returnStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitReturnStatement(_ ctx: CwiftParser.ReturnStatementContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#branchStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBranchStatement(_ ctx: CwiftParser.BranchStatementContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#branchStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBranchStatement(_ ctx: CwiftParser.BranchStatementContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#ifStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIfStatement(_ ctx: CwiftParser.IfStatementContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#ifStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIfStatement(_ ctx: CwiftParser.IfStatementContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#ifExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterIfExpression(_ ctx: CwiftParser.IfExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#ifExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitIfExpression(_ ctx: CwiftParser.IfExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#elseIfExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterElseIfExpression(_ ctx: CwiftParser.ElseIfExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#elseIfExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitElseIfExpression(_ ctx: CwiftParser.ElseIfExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#elseExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterElseExpression(_ ctx: CwiftParser.ElseExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#elseExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitElseExpression(_ ctx: CwiftParser.ElseExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#loopStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLoopStatement(_ ctx: CwiftParser.LoopStatementContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#loopStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLoopStatement(_ ctx: CwiftParser.LoopStatementContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#codeBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterCodeBlock(_ ctx: CwiftParser.CodeBlockContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#codeBlock}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitCodeBlock(_ ctx: CwiftParser.CodeBlockContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpression(_ ctx: CwiftParser.ExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#expression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpression(_ ctx: CwiftParser.ExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#assignmentExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAssignmentExpression(_ ctx: CwiftParser.AssignmentExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#assignmentExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAssignmentExpression(_ ctx: CwiftParser.AssignmentExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#conditionalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConditionalExpression(_ ctx: CwiftParser.ConditionalExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#conditionalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConditionalExpression(_ ctx: CwiftParser.ConditionalExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#logicalOrExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLogicalOrExpression(_ ctx: CwiftParser.LogicalOrExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#logicalOrExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLogicalOrExpression(_ ctx: CwiftParser.LogicalOrExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#logicalAndExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLogicalAndExpression(_ ctx: CwiftParser.LogicalAndExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#logicalAndExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLogicalAndExpression(_ ctx: CwiftParser.LogicalAndExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#bitwiseOrExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBitwiseOrExpression(_ ctx: CwiftParser.BitwiseOrExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#bitwiseOrExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBitwiseOrExpression(_ ctx: CwiftParser.BitwiseOrExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#bitwiseXorExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBitwiseXorExpression(_ ctx: CwiftParser.BitwiseXorExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#bitwiseXorExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBitwiseXorExpression(_ ctx: CwiftParser.BitwiseXorExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#bitwiseAndExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBitwiseAndExpression(_ ctx: CwiftParser.BitwiseAndExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#bitwiseAndExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBitwiseAndExpression(_ ctx: CwiftParser.BitwiseAndExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#equalityExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterEqualityExpression(_ ctx: CwiftParser.EqualityExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#equalityExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitEqualityExpression(_ ctx: CwiftParser.EqualityExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#relationalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterRelationalExpression(_ ctx: CwiftParser.RelationalExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#relationalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitRelationalExpression(_ ctx: CwiftParser.RelationalExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#additiveExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAdditiveExpression(_ ctx: CwiftParser.AdditiveExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#additiveExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAdditiveExpression(_ ctx: CwiftParser.AdditiveExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#multiplicativeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterMultiplicativeExpression(_ ctx: CwiftParser.MultiplicativeExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#multiplicativeExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitMultiplicativeExpression(_ ctx: CwiftParser.MultiplicativeExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#conditionalOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConditionalOperator(_ ctx: CwiftParser.ConditionalOperatorContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#conditionalOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConditionalOperator(_ ctx: CwiftParser.ConditionalOperatorContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#conditionalAlternativeOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConditionalAlternativeOperator(_ ctx: CwiftParser.ConditionalAlternativeOperatorContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#conditionalAlternativeOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConditionalAlternativeOperator(_ ctx: CwiftParser.ConditionalAlternativeOperatorContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#assignmentOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterAssignmentOperator(_ ctx: CwiftParser.AssignmentOperatorContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#assignmentOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitAssignmentOperator(_ ctx: CwiftParser.AssignmentOperatorContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#expressionOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExpressionOperator(_ ctx: CwiftParser.ExpressionOperatorContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#expressionOperator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExpressionOperator(_ ctx: CwiftParser.ExpressionOperatorContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#unaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterUnaryExpression(_ ctx: CwiftParser.UnaryExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#unaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitUnaryExpression(_ ctx: CwiftParser.UnaryExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#postfixExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPostfixExpression(_ ctx: CwiftParser.PostfixExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#postfixExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPostfixExpression(_ ctx: CwiftParser.PostfixExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#functionCallExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionCallExpression(_ ctx: CwiftParser.FunctionCallExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#functionCallExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionCallExpression(_ ctx: CwiftParser.FunctionCallExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#functionCallArgumentClause}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionCallArgumentClause(_ ctx: CwiftParser.FunctionCallArgumentClauseContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#functionCallArgumentClause}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionCallArgumentClause(_ ctx: CwiftParser.FunctionCallArgumentClauseContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#functionCallArgumentList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionCallArgumentList(_ ctx: CwiftParser.FunctionCallArgumentListContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#functionCallArgumentList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionCallArgumentList(_ ctx: CwiftParser.FunctionCallArgumentListContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#functionDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionDeclaration(_ ctx: CwiftParser.FunctionDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#functionDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionDeclaration(_ ctx: CwiftParser.FunctionDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#parameterClause}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameterClause(_ ctx: CwiftParser.ParameterClauseContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#parameterClause}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameterClause(_ ctx: CwiftParser.ParameterClauseContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#parameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameterList(_ ctx: CwiftParser.ParameterListContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#parameterList}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameterList(_ ctx: CwiftParser.ParameterListContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#parameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterParameter(_ ctx: CwiftParser.ParameterContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#parameter}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitParameter(_ ctx: CwiftParser.ParameterContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#returnSignature}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterReturnSignature(_ ctx: CwiftParser.ReturnSignatureContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#returnSignature}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitReturnSignature(_ ctx: CwiftParser.ReturnSignatureContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#externalParameterName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterExternalParameterName(_ ctx: CwiftParser.ExternalParameterNameContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#externalParameterName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitExternalParameterName(_ ctx: CwiftParser.ExternalParameterNameContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#localParameterName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLocalParameterName(_ ctx: CwiftParser.LocalParameterNameContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#localParameterName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLocalParameterName(_ ctx: CwiftParser.LocalParameterNameContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#functionCallArgument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterFunctionCallArgument(_ ctx: CwiftParser.FunctionCallArgumentContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#functionCallArgument}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitFunctionCallArgument(_ ctx: CwiftParser.FunctionCallArgumentContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#primaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrimaryExpression(_ ctx: CwiftParser.PrimaryExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#primaryExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrimaryExpression(_ ctx: CwiftParser.PrimaryExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#literalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLiteralExpression(_ ctx: CwiftParser.LiteralExpressionContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#literalExpression}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLiteralExpression(_ ctx: CwiftParser.LiteralExpressionContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#literal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterLiteral(_ ctx: CwiftParser.LiteralContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#literal}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitLiteral(_ ctx: CwiftParser.LiteralContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#declaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDeclaration(_ ctx: CwiftParser.DeclarationContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#declaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDeclaration(_ ctx: CwiftParser.DeclarationContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#variableDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterVariableDeclaration(_ ctx: CwiftParser.VariableDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#variableDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitVariableDeclaration(_ ctx: CwiftParser.VariableDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#constantDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterConstantDeclaration(_ ctx: CwiftParser.ConstantDeclarationContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#constantDeclaration}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitConstantDeclaration(_ ctx: CwiftParser.ConstantDeclarationContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#initializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterInitializer(_ ctx: CwiftParser.InitializerContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#initializer}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitInitializer(_ ctx: CwiftParser.InitializerContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#declarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterDeclarator(_ ctx: CwiftParser.DeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#declarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitDeclarator(_ ctx: CwiftParser.DeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#typeStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeStatement(_ ctx: CwiftParser.TypeStatementContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#typeStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeStatement(_ ctx: CwiftParser.TypeStatementContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#primitiveTypeStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrimitiveTypeStatement(_ ctx: CwiftParser.PrimitiveTypeStatementContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#primitiveTypeStatement}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrimitiveTypeStatement(_ ctx: CwiftParser.PrimitiveTypeStatementContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#typeDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeDeclarator(_ ctx: CwiftParser.TypeDeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#typeDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeDeclarator(_ ctx: CwiftParser.TypeDeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#primitiveTypeDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterPrimitiveTypeDeclarator(_ ctx: CwiftParser.PrimitiveTypeDeclaratorContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#primitiveTypeDeclarator}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitPrimitiveTypeDeclarator(_ ctx: CwiftParser.PrimitiveTypeDeclaratorContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#typeName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterTypeName(_ ctx: CwiftParser.TypeNameContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#typeName}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitTypeName(_ ctx: CwiftParser.TypeNameContext)
	/**
	 * Enter a parse tree produced by {@link CwiftParser#booleanLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func enterBooleanLiteral(_ ctx: CwiftParser.BooleanLiteralContext)
	/**
	 * Exit a parse tree produced by {@link CwiftParser#booleanLiteral}.
	 - Parameters:
	   - ctx: the parse tree
	 */
	func exitBooleanLiteral(_ ctx: CwiftParser.BooleanLiteralContext)
}