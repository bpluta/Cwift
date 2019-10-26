// Generated from Cwift.g4 by ANTLR 4.7.1
import Antlr4

open class CwiftParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = CwiftParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(CwiftParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, T__0 = 1, T__1 = 2, True = 3, False = 4, Colon = 5, Assign = 6, 
                 Arrow = 7, SemiColon = 8, Multiplication = 9, Division = 10, 
                 Remainder = 11, Addition = 12, Subtraction = 13, MoreOrEqual = 14, 
                 LessOrEqual = 15, More = 16, Less = 17, Equal = 18, NotEqual = 19, 
                 BitwiseAnd = 20, BitwiseXor = 21, BitwiseOr = 22, LogicalAnd = 23, 
                 LogicalOr = 24, Variable = 25, Constant = 26, Int = 27, 
                 Double = 28, Comma = 29, Question = 30, Bool = 31, Nil = 32, 
                 PrefixOperator = 33, IntegerLiteral = 34, NumberSequence = 35, 
                 NonzeroDigit = 36, Digit = 37, If = 38, Else = 39, While = 40, 
                 LeftParen = 41, RightParen = 42, LeftBrace = 43, RightBrace = 44, 
                 FloatingSequence = 45, DoubleLiteral = 46, Identifier = 47, 
                 WS = 48, BlockComment = 49, LineComment = 50
	}

	public
	static let RULE_statements = 0, RULE_statement = 1, RULE_returnStatement = 2, 
            RULE_branchStatement = 3, RULE_ifStatement = 4, RULE_ifExpression = 5, 
            RULE_elseIfExpression = 6, RULE_elseExpression = 7, RULE_loopStatement = 8, 
            RULE_codeBlock = 9, RULE_expression = 10, RULE_assignmentExpression = 11, 
            RULE_conditionalExpression = 12, RULE_logicalOrExpression = 13, 
            RULE_logicalAndExpression = 14, RULE_bitwiseOrExpression = 15, 
            RULE_bitwiseXorExpression = 16, RULE_bitwiseAndExpression = 17, 
            RULE_equalityExpression = 18, RULE_relationalExpression = 19, 
            RULE_additiveExpression = 20, RULE_multiplicativeExpression = 21, 
            RULE_conditionalOperator = 22, RULE_conditionalAlternativeOperator = 23, 
            RULE_assignmentOperator = 24, RULE_expressionOperator = 25, 
            RULE_unaryExpression = 26, RULE_postfixExpression = 27, RULE_functionCallExpression = 28, 
            RULE_functionCallArgumentClause = 29, RULE_functionCallArgumentList = 30, 
            RULE_functionDeclaration = 31, RULE_parameterClause = 32, RULE_parameterList = 33, 
            RULE_parameter = 34, RULE_returnSignature = 35, RULE_externalParameterName = 36, 
            RULE_localParameterName = 37, RULE_functionCallArgument = 38, 
            RULE_primaryExpression = 39, RULE_literalExpression = 40, RULE_literal = 41, 
            RULE_declaration = 42, RULE_variableDeclaration = 43, RULE_constantDeclaration = 44, 
            RULE_initializer = 45, RULE_declarator = 46, RULE_typeStatement = 47, 
            RULE_primitiveTypeStatement = 48, RULE_typeDeclarator = 49, 
            RULE_primitiveTypeDeclarator = 50, RULE_typeName = 51, RULE_booleanLiteral = 52

	public
	static let ruleNames: [String] = [
		"statements", "statement", "returnStatement", "branchStatement", "ifStatement", 
		"ifExpression", "elseIfExpression", "elseExpression", "loopStatement", 
		"codeBlock", "expression", "assignmentExpression", "conditionalExpression", 
		"logicalOrExpression", "logicalAndExpression", "bitwiseOrExpression", 
		"bitwiseXorExpression", "bitwiseAndExpression", "equalityExpression", 
		"relationalExpression", "additiveExpression", "multiplicativeExpression", 
		"conditionalOperator", "conditionalAlternativeOperator", "assignmentOperator", 
		"expressionOperator", "unaryExpression", "postfixExpression", "functionCallExpression", 
		"functionCallArgumentClause", "functionCallArgumentList", "functionDeclaration", 
		"parameterClause", "parameterList", "parameter", "returnSignature", "externalParameterName", 
		"localParameterName", "functionCallArgument", "primaryExpression", "literalExpression", 
		"literal", "declaration", "variableDeclaration", "constantDeclaration", 
		"initializer", "declarator", "typeStatement", "primitiveTypeStatement", 
		"typeDeclarator", "primitiveTypeDeclarator", "typeName", "booleanLiteral"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "'return'", "'func'", "'true'", "'false'", "':'", "'='", "'->'", 
		"';'", "'*'", "'/'", "'%'", "'+'", "'-'", "'>='", "'<='", "'>'", "'<'", 
		"'=='", "'!='", "'&'", "'^'", "'|'", "'&&'", "'||'", "'var'", "'let'", 
		"'Int'", "'Double'", "','", "'?'", "'Bool'", "'nil'", nil, nil, nil, nil, 
		nil, "'if'", "'else'", "'while'", "'('", "')'", "'{'", "'}'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, "True", "False", "Colon", "Assign", "Arrow", "SemiColon", 
		"Multiplication", "Division", "Remainder", "Addition", "Subtraction", 
		"MoreOrEqual", "LessOrEqual", "More", "Less", "Equal", "NotEqual", "BitwiseAnd", 
		"BitwiseXor", "BitwiseOr", "LogicalAnd", "LogicalOr", "Variable", "Constant", 
		"Int", "Double", "Comma", "Question", "Bool", "Nil", "PrefixOperator", 
		"IntegerLiteral", "NumberSequence", "NonzeroDigit", "Digit", "If", "Else", 
		"While", "LeftParen", "RightParen", "LeftBrace", "RightBrace", "FloatingSequence", 
		"DoubleLiteral", "Identifier", "WS", "BlockComment", "LineComment"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Cwift.g4" }

	override open
	func getRuleNames() -> [String] { return CwiftParser.ruleNames }

	override open
	func getSerializedATN() -> String { return CwiftParser._serializedATN }

	override open
	func getATN() -> ATN { return CwiftParser._ATN }

	override open
	func getVocabulary() -> Vocabulary {
	    return CwiftParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,CwiftParser._ATN,CwiftParser._decisionToDFA, CwiftParser._sharedContextCache)
	}

	public class StatementsContext: ParserRuleContext {
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_statements
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterStatements(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitStatements(self)
			}
		}
	}
	@discardableResult
	 open func statements() throws -> StatementsContext {
		var _localctx: StatementsContext = StatementsContext(_ctx, getState())
		try enterRule(_localctx, 0, CwiftParser.RULE_statements)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(107) 
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	repeat {
		 		setState(106)
		 		try statement()


		 		setState(109); 
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	} while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CwiftParser.Tokens.T__0.rawValue,CwiftParser.Tokens.T__1.rawValue,CwiftParser.Tokens.True.rawValue,CwiftParser.Tokens.False.rawValue,CwiftParser.Tokens.Variable.rawValue,CwiftParser.Tokens.Constant.rawValue,CwiftParser.Tokens.Nil.rawValue,CwiftParser.Tokens.IntegerLiteral.rawValue,CwiftParser.Tokens.If.rawValue,CwiftParser.Tokens.While.rawValue,CwiftParser.Tokens.LeftParen.rawValue,CwiftParser.Tokens.DoubleLiteral.rawValue,CwiftParser.Tokens.Identifier.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
			open
			func declaration() -> DeclarationContext? {
				return getRuleContext(DeclarationContext.self, 0)
			}
			open
			func loopStatement() -> LoopStatementContext? {
				return getRuleContext(LoopStatementContext.self, 0)
			}
			open
			func branchStatement() -> BranchStatementContext? {
				return getRuleContext(BranchStatementContext.self, 0)
			}
			open
			func returnStatement() -> ReturnStatementContext? {
				return getRuleContext(ReturnStatementContext.self, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_statement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitStatement(self)
			}
		}
	}
	@discardableResult
	 open func statement() throws -> StatementContext {
		var _localctx: StatementContext = StatementContext(_ctx, getState())
		try enterRule(_localctx, 2, CwiftParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(116)
		 	try _errHandler.sync(self)
		 	switch (CwiftParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .T__1:fallthrough
		 	case .Variable:fallthrough
		 	case .Constant:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(111)
		 		try declaration()

		 		break

		 	case .While:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(112)
		 		try loopStatement()

		 		break

		 	case .If:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(113)
		 		try branchStatement()

		 		break

		 	case .T__0:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(114)
		 		try returnStatement()

		 		break
		 	case .True:fallthrough
		 	case .False:fallthrough
		 	case .Nil:fallthrough
		 	case .IntegerLiteral:fallthrough
		 	case .LeftParen:fallthrough
		 	case .DoubleLiteral:fallthrough
		 	case .Identifier:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(115)
		 		try expression()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ReturnStatementContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_returnStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterReturnStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitReturnStatement(self)
			}
		}
	}
	@discardableResult
	 open func returnStatement() throws -> ReturnStatementContext {
		var _localctx: ReturnStatementContext = ReturnStatementContext(_ctx, getState())
		try enterRule(_localctx, 4, CwiftParser.RULE_returnStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(118)
		 	try match(CwiftParser.Tokens.T__0.rawValue)
		 	setState(119)
		 	try expression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BranchStatementContext: ParserRuleContext {
			open
			func ifStatement() -> IfStatementContext? {
				return getRuleContext(IfStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_branchStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterBranchStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitBranchStatement(self)
			}
		}
	}
	@discardableResult
	 open func branchStatement() throws -> BranchStatementContext {
		var _localctx: BranchStatementContext = BranchStatementContext(_ctx, getState())
		try enterRule(_localctx, 6, CwiftParser.RULE_branchStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(121)
		 	try ifStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IfStatementContext: ParserRuleContext {
			open
			func ifExpression() -> IfExpressionContext? {
				return getRuleContext(IfExpressionContext.self, 0)
			}
			open
			func elseIfExpression() -> [ElseIfExpressionContext] {
				return getRuleContexts(ElseIfExpressionContext.self)
			}
			open
			func elseIfExpression(_ i: Int) -> ElseIfExpressionContext? {
				return getRuleContext(ElseIfExpressionContext.self, i)
			}
			open
			func elseExpression() -> ElseExpressionContext? {
				return getRuleContext(ElseExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_ifStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterIfStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitIfStatement(self)
			}
		}
	}
	@discardableResult
	 open func ifStatement() throws -> IfStatementContext {
		var _localctx: IfStatementContext = IfStatementContext(_ctx, getState())
		try enterRule(_localctx, 8, CwiftParser.RULE_ifStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(123)
		 	try ifExpression()
		 	setState(127)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,2,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(124)
		 			try elseIfExpression()

		 	 
		 		}
		 		setState(129)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,2,_ctx)
		 	}
		 	setState(131)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CwiftParser.Tokens.Else.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(130)
		 		try elseExpression()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IfExpressionContext: ParserRuleContext {
			open
			func If() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.If.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func codeBlock() -> CodeBlockContext? {
				return getRuleContext(CodeBlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_ifExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterIfExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitIfExpression(self)
			}
		}
	}
	@discardableResult
	 open func ifExpression() throws -> IfExpressionContext {
		var _localctx: IfExpressionContext = IfExpressionContext(_ctx, getState())
		try enterRule(_localctx, 10, CwiftParser.RULE_ifExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(133)
		 	try match(CwiftParser.Tokens.If.rawValue)
		 	setState(134)
		 	try expression()
		 	setState(135)
		 	try codeBlock()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ElseIfExpressionContext: ParserRuleContext {
			open
			func Else() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Else.rawValue, 0)
			}
			open
			func ifExpression() -> IfExpressionContext? {
				return getRuleContext(IfExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_elseIfExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterElseIfExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitElseIfExpression(self)
			}
		}
	}
	@discardableResult
	 open func elseIfExpression() throws -> ElseIfExpressionContext {
		var _localctx: ElseIfExpressionContext = ElseIfExpressionContext(_ctx, getState())
		try enterRule(_localctx, 12, CwiftParser.RULE_elseIfExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(137)
		 	try match(CwiftParser.Tokens.Else.rawValue)
		 	setState(138)
		 	try ifExpression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ElseExpressionContext: ParserRuleContext {
			open
			func Else() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Else.rawValue, 0)
			}
			open
			func codeBlock() -> CodeBlockContext? {
				return getRuleContext(CodeBlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_elseExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterElseExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitElseExpression(self)
			}
		}
	}
	@discardableResult
	 open func elseExpression() throws -> ElseExpressionContext {
		var _localctx: ElseExpressionContext = ElseExpressionContext(_ctx, getState())
		try enterRule(_localctx, 14, CwiftParser.RULE_elseExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(140)
		 	try match(CwiftParser.Tokens.Else.rawValue)
		 	setState(141)
		 	try codeBlock()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LoopStatementContext: ParserRuleContext {
			open
			func While() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.While.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func codeBlock() -> CodeBlockContext? {
				return getRuleContext(CodeBlockContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_loopStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterLoopStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitLoopStatement(self)
			}
		}
	}
	@discardableResult
	 open func loopStatement() throws -> LoopStatementContext {
		var _localctx: LoopStatementContext = LoopStatementContext(_ctx, getState())
		try enterRule(_localctx, 16, CwiftParser.RULE_loopStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(143)
		 	try match(CwiftParser.Tokens.While.rawValue)
		 	setState(144)
		 	try expression()
		 	setState(145)
		 	try codeBlock()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class CodeBlockContext: ParserRuleContext {
			open
			func LeftBrace() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LeftBrace.rawValue, 0)
			}
			open
			func RightBrace() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.RightBrace.rawValue, 0)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_codeBlock
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterCodeBlock(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitCodeBlock(self)
			}
		}
	}
	@discardableResult
	 open func codeBlock() throws -> CodeBlockContext {
		var _localctx: CodeBlockContext = CodeBlockContext(_ctx, getState())
		try enterRule(_localctx, 18, CwiftParser.RULE_codeBlock)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(147)
		 	try match(CwiftParser.Tokens.LeftBrace.rawValue)
		 	setState(149)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CwiftParser.Tokens.T__0.rawValue,CwiftParser.Tokens.T__1.rawValue,CwiftParser.Tokens.True.rawValue,CwiftParser.Tokens.False.rawValue,CwiftParser.Tokens.Variable.rawValue,CwiftParser.Tokens.Constant.rawValue,CwiftParser.Tokens.Nil.rawValue,CwiftParser.Tokens.IntegerLiteral.rawValue,CwiftParser.Tokens.If.rawValue,CwiftParser.Tokens.While.rawValue,CwiftParser.Tokens.LeftParen.rawValue,CwiftParser.Tokens.DoubleLiteral.rawValue,CwiftParser.Tokens.Identifier.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }()) {
		 		setState(148)
		 		try statements()

		 	}

		 	setState(151)
		 	try match(CwiftParser.Tokens.RightBrace.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionContext: ParserRuleContext {
			open
			func assignmentExpression() -> AssignmentExpressionContext? {
				return getRuleContext(AssignmentExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_expression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitExpression(self)
			}
		}
	}
	@discardableResult
	 open func expression() throws -> ExpressionContext {
		var _localctx: ExpressionContext = ExpressionContext(_ctx, getState())
		try enterRule(_localctx, 20, CwiftParser.RULE_expression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(153)
		 	try assignmentExpression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AssignmentExpressionContext: ParserRuleContext {
			open
			func conditionalExpression() -> ConditionalExpressionContext? {
				return getRuleContext(ConditionalExpressionContext.self, 0)
			}
			open
			func unaryExpression() -> UnaryExpressionContext? {
				return getRuleContext(UnaryExpressionContext.self, 0)
			}
			open
			func Assign() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Assign.rawValue, 0)
			}
			open
			func assignmentExpression() -> AssignmentExpressionContext? {
				return getRuleContext(AssignmentExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_assignmentExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterAssignmentExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitAssignmentExpression(self)
			}
		}
	}
	@discardableResult
	 open func assignmentExpression() throws -> AssignmentExpressionContext {
		var _localctx: AssignmentExpressionContext = AssignmentExpressionContext(_ctx, getState())
		try enterRule(_localctx, 22, CwiftParser.RULE_assignmentExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(160)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(155)
		 		try conditionalExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(156)
		 		try unaryExpression()
		 		setState(157)
		 		try match(CwiftParser.Tokens.Assign.rawValue)
		 		setState(158)
		 		try assignmentExpression()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConditionalExpressionContext: ParserRuleContext {
			open
			func logicalOrExpression() -> LogicalOrExpressionContext? {
				return getRuleContext(LogicalOrExpressionContext.self, 0)
			}
			open
			func Question() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Question.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func Colon() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Colon.rawValue, 0)
			}
			open
			func conditionalExpression() -> ConditionalExpressionContext? {
				return getRuleContext(ConditionalExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_conditionalExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterConditionalExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitConditionalExpression(self)
			}
		}
	}
	@discardableResult
	 open func conditionalExpression() throws -> ConditionalExpressionContext {
		var _localctx: ConditionalExpressionContext = ConditionalExpressionContext(_ctx, getState())
		try enterRule(_localctx, 24, CwiftParser.RULE_conditionalExpression)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(162)
		 	try logicalOrExpression(0)
		 	setState(168)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CwiftParser.Tokens.Question.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(163)
		 		try match(CwiftParser.Tokens.Question.rawValue)
		 		setState(164)
		 		try expression()
		 		setState(165)
		 		try match(CwiftParser.Tokens.Colon.rawValue)
		 		setState(166)
		 		try conditionalExpression()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LogicalOrExpressionContext: ParserRuleContext {
			open
			func logicalAndExpression() -> LogicalAndExpressionContext? {
				return getRuleContext(LogicalAndExpressionContext.self, 0)
			}
			open
			func logicalOrExpression() -> LogicalOrExpressionContext? {
				return getRuleContext(LogicalOrExpressionContext.self, 0)
			}
			open
			func LogicalOr() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LogicalOr.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_logicalOrExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterLogicalOrExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitLogicalOrExpression(self)
			}
		}
	}

	 public final  func logicalOrExpression( ) throws -> LogicalOrExpressionContext   {
		return try logicalOrExpression(0)
	}
	@discardableResult
	private func logicalOrExpression(_ _p: Int) throws -> LogicalOrExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: LogicalOrExpressionContext = LogicalOrExpressionContext(_ctx, _parentState)
		var  _prevctx: LogicalOrExpressionContext = _localctx
		var _startState: Int = 26
		try enterRecursionRule(_localctx, 26, CwiftParser.RULE_logicalOrExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(171)
			try logicalAndExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(178)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = LogicalOrExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_logicalOrExpression)
					setState(173)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(174)
					try match(CwiftParser.Tokens.LogicalOr.rawValue)
					setState(175)
					try logicalAndExpression(0)

			 
				}
				setState(180)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class LogicalAndExpressionContext: ParserRuleContext {
			open
			func bitwiseOrExpression() -> BitwiseOrExpressionContext? {
				return getRuleContext(BitwiseOrExpressionContext.self, 0)
			}
			open
			func logicalAndExpression() -> LogicalAndExpressionContext? {
				return getRuleContext(LogicalAndExpressionContext.self, 0)
			}
			open
			func LogicalAnd() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LogicalAnd.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_logicalAndExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterLogicalAndExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitLogicalAndExpression(self)
			}
		}
	}

	 public final  func logicalAndExpression( ) throws -> LogicalAndExpressionContext   {
		return try logicalAndExpression(0)
	}
	@discardableResult
	private func logicalAndExpression(_ _p: Int) throws -> LogicalAndExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: LogicalAndExpressionContext = LogicalAndExpressionContext(_ctx, _parentState)
		var  _prevctx: LogicalAndExpressionContext = _localctx
		var _startState: Int = 28
		try enterRecursionRule(_localctx, 28, CwiftParser.RULE_logicalAndExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(182)
			try bitwiseOrExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(189)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,8,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = LogicalAndExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_logicalAndExpression)
					setState(184)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(185)
					try match(CwiftParser.Tokens.LogicalAnd.rawValue)
					setState(186)
					try bitwiseOrExpression(0)

			 
				}
				setState(191)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,8,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class BitwiseOrExpressionContext: ParserRuleContext {
			open
			func bitwiseXorExpression() -> BitwiseXorExpressionContext? {
				return getRuleContext(BitwiseXorExpressionContext.self, 0)
			}
			open
			func bitwiseOrExpression() -> BitwiseOrExpressionContext? {
				return getRuleContext(BitwiseOrExpressionContext.self, 0)
			}
			open
			func BitwiseOr() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.BitwiseOr.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_bitwiseOrExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterBitwiseOrExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitBitwiseOrExpression(self)
			}
		}
	}

	 public final  func bitwiseOrExpression( ) throws -> BitwiseOrExpressionContext   {
		return try bitwiseOrExpression(0)
	}
	@discardableResult
	private func bitwiseOrExpression(_ _p: Int) throws -> BitwiseOrExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: BitwiseOrExpressionContext = BitwiseOrExpressionContext(_ctx, _parentState)
		var  _prevctx: BitwiseOrExpressionContext = _localctx
		var _startState: Int = 30
		try enterRecursionRule(_localctx, 30, CwiftParser.RULE_bitwiseOrExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(193)
			try bitwiseXorExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(200)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,9,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = BitwiseOrExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_bitwiseOrExpression)
					setState(195)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(196)
					try match(CwiftParser.Tokens.BitwiseOr.rawValue)
					setState(197)
					try bitwiseXorExpression(0)

			 
				}
				setState(202)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,9,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class BitwiseXorExpressionContext: ParserRuleContext {
			open
			func bitwiseAndExpression() -> BitwiseAndExpressionContext? {
				return getRuleContext(BitwiseAndExpressionContext.self, 0)
			}
			open
			func bitwiseXorExpression() -> BitwiseXorExpressionContext? {
				return getRuleContext(BitwiseXorExpressionContext.self, 0)
			}
			open
			func BitwiseXor() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.BitwiseXor.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_bitwiseXorExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterBitwiseXorExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitBitwiseXorExpression(self)
			}
		}
	}

	 public final  func bitwiseXorExpression( ) throws -> BitwiseXorExpressionContext   {
		return try bitwiseXorExpression(0)
	}
	@discardableResult
	private func bitwiseXorExpression(_ _p: Int) throws -> BitwiseXorExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: BitwiseXorExpressionContext = BitwiseXorExpressionContext(_ctx, _parentState)
		var  _prevctx: BitwiseXorExpressionContext = _localctx
		var _startState: Int = 32
		try enterRecursionRule(_localctx, 32, CwiftParser.RULE_bitwiseXorExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(204)
			try bitwiseAndExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(211)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,10,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = BitwiseXorExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_bitwiseXorExpression)
					setState(206)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(207)
					try match(CwiftParser.Tokens.BitwiseXor.rawValue)
					setState(208)
					try bitwiseAndExpression(0)

			 
				}
				setState(213)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,10,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class BitwiseAndExpressionContext: ParserRuleContext {
			open
			func equalityExpression() -> EqualityExpressionContext? {
				return getRuleContext(EqualityExpressionContext.self, 0)
			}
			open
			func bitwiseAndExpression() -> BitwiseAndExpressionContext? {
				return getRuleContext(BitwiseAndExpressionContext.self, 0)
			}
			open
			func BitwiseAnd() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.BitwiseAnd.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_bitwiseAndExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterBitwiseAndExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitBitwiseAndExpression(self)
			}
		}
	}

	 public final  func bitwiseAndExpression( ) throws -> BitwiseAndExpressionContext   {
		return try bitwiseAndExpression(0)
	}
	@discardableResult
	private func bitwiseAndExpression(_ _p: Int) throws -> BitwiseAndExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: BitwiseAndExpressionContext = BitwiseAndExpressionContext(_ctx, _parentState)
		var  _prevctx: BitwiseAndExpressionContext = _localctx
		var _startState: Int = 34
		try enterRecursionRule(_localctx, 34, CwiftParser.RULE_bitwiseAndExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(215)
			try equalityExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(222)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,11,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					_localctx = BitwiseAndExpressionContext(_parentctx, _parentState);
					try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_bitwiseAndExpression)
					setState(217)
					if (!(precpred(_ctx, 1))) {
					    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
					}
					setState(218)
					try match(CwiftParser.Tokens.BitwiseAnd.rawValue)
					setState(219)
					try equalityExpression(0)

			 
				}
				setState(224)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,11,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class EqualityExpressionContext: ParserRuleContext {
			open
			func relationalExpression() -> RelationalExpressionContext? {
				return getRuleContext(RelationalExpressionContext.self, 0)
			}
			open
			func equalityExpression() -> EqualityExpressionContext? {
				return getRuleContext(EqualityExpressionContext.self, 0)
			}
			open
			func Equal() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Equal.rawValue, 0)
			}
			open
			func NotEqual() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.NotEqual.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_equalityExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterEqualityExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitEqualityExpression(self)
			}
		}
	}

	 public final  func equalityExpression( ) throws -> EqualityExpressionContext   {
		return try equalityExpression(0)
	}
	@discardableResult
	private func equalityExpression(_ _p: Int) throws -> EqualityExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: EqualityExpressionContext = EqualityExpressionContext(_ctx, _parentState)
		var  _prevctx: EqualityExpressionContext = _localctx
		var _startState: Int = 36
		try enterRecursionRule(_localctx, 36, CwiftParser.RULE_equalityExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(226)
			try relationalExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(236)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(234)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
					case 1:
						_localctx = EqualityExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_equalityExpression)
						setState(228)
						if (!(precpred(_ctx, 2))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
						}
						setState(229)
						try match(CwiftParser.Tokens.Equal.rawValue)
						setState(230)
						try relationalExpression(0)

						break
					case 2:
						_localctx = EqualityExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_equalityExpression)
						setState(231)
						if (!(precpred(_ctx, 1))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
						}
						setState(232)
						try match(CwiftParser.Tokens.NotEqual.rawValue)
						setState(233)
						try relationalExpression(0)

						break
					default: break
					}
			 
				}
				setState(238)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class RelationalExpressionContext: ParserRuleContext {
			open
			func additiveExpression() -> AdditiveExpressionContext? {
				return getRuleContext(AdditiveExpressionContext.self, 0)
			}
			open
			func relationalExpression() -> RelationalExpressionContext? {
				return getRuleContext(RelationalExpressionContext.self, 0)
			}
			open
			func Less() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Less.rawValue, 0)
			}
			open
			func More() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.More.rawValue, 0)
			}
			open
			func LessOrEqual() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LessOrEqual.rawValue, 0)
			}
			open
			func MoreOrEqual() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.MoreOrEqual.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_relationalExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterRelationalExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitRelationalExpression(self)
			}
		}
	}

	 public final  func relationalExpression( ) throws -> RelationalExpressionContext   {
		return try relationalExpression(0)
	}
	@discardableResult
	private func relationalExpression(_ _p: Int) throws -> RelationalExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: RelationalExpressionContext = RelationalExpressionContext(_ctx, _parentState)
		var  _prevctx: RelationalExpressionContext = _localctx
		var _startState: Int = 38
		try enterRecursionRule(_localctx, 38, CwiftParser.RULE_relationalExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(240)
			try additiveExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(256)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,15,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(254)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,14, _ctx)) {
					case 1:
						_localctx = RelationalExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_relationalExpression)
						setState(242)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(243)
						try match(CwiftParser.Tokens.Less.rawValue)
						setState(244)
						try additiveExpression(0)

						break
					case 2:
						_localctx = RelationalExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_relationalExpression)
						setState(245)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(246)
						try match(CwiftParser.Tokens.More.rawValue)
						setState(247)
						try additiveExpression(0)

						break
					case 3:
						_localctx = RelationalExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_relationalExpression)
						setState(248)
						if (!(precpred(_ctx, 2))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
						}
						setState(249)
						try match(CwiftParser.Tokens.LessOrEqual.rawValue)
						setState(250)
						try additiveExpression(0)

						break
					case 4:
						_localctx = RelationalExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_relationalExpression)
						setState(251)
						if (!(precpred(_ctx, 1))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
						}
						setState(252)
						try match(CwiftParser.Tokens.MoreOrEqual.rawValue)
						setState(253)
						try additiveExpression(0)

						break
					default: break
					}
			 
				}
				setState(258)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,15,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class AdditiveExpressionContext: ParserRuleContext {
			open
			func multiplicativeExpression() -> MultiplicativeExpressionContext? {
				return getRuleContext(MultiplicativeExpressionContext.self, 0)
			}
			open
			func additiveExpression() -> AdditiveExpressionContext? {
				return getRuleContext(AdditiveExpressionContext.self, 0)
			}
			open
			func Addition() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Addition.rawValue, 0)
			}
			open
			func Subtraction() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Subtraction.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_additiveExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterAdditiveExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitAdditiveExpression(self)
			}
		}
	}

	 public final  func additiveExpression( ) throws -> AdditiveExpressionContext   {
		return try additiveExpression(0)
	}
	@discardableResult
	private func additiveExpression(_ _p: Int) throws -> AdditiveExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: AdditiveExpressionContext = AdditiveExpressionContext(_ctx, _parentState)
		var  _prevctx: AdditiveExpressionContext = _localctx
		var _startState: Int = 40
		try enterRecursionRule(_localctx, 40, CwiftParser.RULE_additiveExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(260)
			try multiplicativeExpression(0)

			_ctx!.stop = try _input.LT(-1)
			setState(270)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,17,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(268)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,16, _ctx)) {
					case 1:
						_localctx = AdditiveExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_additiveExpression)
						setState(262)
						if (!(precpred(_ctx, 2))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
						}
						setState(263)
						try match(CwiftParser.Tokens.Addition.rawValue)
						setState(264)
						try multiplicativeExpression(0)

						break
					case 2:
						_localctx = AdditiveExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_additiveExpression)
						setState(265)
						if (!(precpred(_ctx, 1))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
						}
						setState(266)
						try match(CwiftParser.Tokens.Subtraction.rawValue)
						setState(267)
						try multiplicativeExpression(0)

						break
					default: break
					}
			 
				}
				setState(272)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,17,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class MultiplicativeExpressionContext: ParserRuleContext {
			open
			func unaryExpression() -> UnaryExpressionContext? {
				return getRuleContext(UnaryExpressionContext.self, 0)
			}
			open
			func multiplicativeExpression() -> MultiplicativeExpressionContext? {
				return getRuleContext(MultiplicativeExpressionContext.self, 0)
			}
			open
			func Multiplication() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Multiplication.rawValue, 0)
			}
			open
			func Division() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Division.rawValue, 0)
			}
			open
			func Remainder() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Remainder.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_multiplicativeExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterMultiplicativeExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitMultiplicativeExpression(self)
			}
		}
	}

	 public final  func multiplicativeExpression( ) throws -> MultiplicativeExpressionContext   {
		return try multiplicativeExpression(0)
	}
	@discardableResult
	private func multiplicativeExpression(_ _p: Int) throws -> MultiplicativeExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		var _parentState: Int = getState()
		var _localctx: MultiplicativeExpressionContext = MultiplicativeExpressionContext(_ctx, _parentState)
		var  _prevctx: MultiplicativeExpressionContext = _localctx
		var _startState: Int = 42
		try enterRecursionRule(_localctx, 42, CwiftParser.RULE_multiplicativeExpression, _p)
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(274)
			try unaryExpression()

			_ctx!.stop = try _input.LT(-1)
			setState(287)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(285)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,18, _ctx)) {
					case 1:
						_localctx = MultiplicativeExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_multiplicativeExpression)
						setState(276)
						if (!(precpred(_ctx, 3))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 3)"))
						}
						setState(277)
						try match(CwiftParser.Tokens.Multiplication.rawValue)
						setState(278)
						try unaryExpression()

						break
					case 2:
						_localctx = MultiplicativeExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_multiplicativeExpression)
						setState(279)
						if (!(precpred(_ctx, 2))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 2)"))
						}
						setState(280)
						try match(CwiftParser.Tokens.Division.rawValue)
						setState(281)
						try unaryExpression()

						break
					case 3:
						_localctx = MultiplicativeExpressionContext(_parentctx, _parentState);
						try pushNewRecursionContext(_localctx, _startState, CwiftParser.RULE_multiplicativeExpression)
						setState(282)
						if (!(precpred(_ctx, 1))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 1)"))
						}
						setState(283)
						try match(CwiftParser.Tokens.Remainder.rawValue)
						setState(284)
						try unaryExpression()

						break
					default: break
					}
			 
				}
				setState(289)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,19,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class ConditionalOperatorContext: ParserRuleContext {
			open
			func Question() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Question.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_conditionalOperator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterConditionalOperator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitConditionalOperator(self)
			}
		}
	}
	@discardableResult
	 open func conditionalOperator() throws -> ConditionalOperatorContext {
		var _localctx: ConditionalOperatorContext = ConditionalOperatorContext(_ctx, getState())
		try enterRule(_localctx, 44, CwiftParser.RULE_conditionalOperator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(290)
		 	try match(CwiftParser.Tokens.Question.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConditionalAlternativeOperatorContext: ParserRuleContext {
			open
			func Colon() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Colon.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_conditionalAlternativeOperator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterConditionalAlternativeOperator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitConditionalAlternativeOperator(self)
			}
		}
	}
	@discardableResult
	 open func conditionalAlternativeOperator() throws -> ConditionalAlternativeOperatorContext {
		var _localctx: ConditionalAlternativeOperatorContext = ConditionalAlternativeOperatorContext(_ctx, getState())
		try enterRule(_localctx, 46, CwiftParser.RULE_conditionalAlternativeOperator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(292)
		 	try match(CwiftParser.Tokens.Colon.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AssignmentOperatorContext: ParserRuleContext {
			open
			func Assign() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Assign.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_assignmentOperator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterAssignmentOperator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitAssignmentOperator(self)
			}
		}
	}
	@discardableResult
	 open func assignmentOperator() throws -> AssignmentOperatorContext {
		var _localctx: AssignmentOperatorContext = AssignmentOperatorContext(_ctx, getState())
		try enterRule(_localctx, 48, CwiftParser.RULE_assignmentOperator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(294)
		 	try match(CwiftParser.Tokens.Assign.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionOperatorContext: ParserRuleContext {
			open
			func Multiplication() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Multiplication.rawValue, 0)
			}
			open
			func Division() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Division.rawValue, 0)
			}
			open
			func Remainder() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Remainder.rawValue, 0)
			}
			open
			func Addition() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Addition.rawValue, 0)
			}
			open
			func Subtraction() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Subtraction.rawValue, 0)
			}
			open
			func MoreOrEqual() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.MoreOrEqual.rawValue, 0)
			}
			open
			func LessOrEqual() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LessOrEqual.rawValue, 0)
			}
			open
			func More() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.More.rawValue, 0)
			}
			open
			func Less() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Less.rawValue, 0)
			}
			open
			func Equal() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Equal.rawValue, 0)
			}
			open
			func NotEqual() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.NotEqual.rawValue, 0)
			}
			open
			func BitwiseAnd() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.BitwiseAnd.rawValue, 0)
			}
			open
			func BitwiseXor() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.BitwiseXor.rawValue, 0)
			}
			open
			func BitwiseOr() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.BitwiseOr.rawValue, 0)
			}
			open
			func LogicalAnd() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LogicalAnd.rawValue, 0)
			}
			open
			func LogicalOr() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LogicalOr.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_expressionOperator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterExpressionOperator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitExpressionOperator(self)
			}
		}
	}
	@discardableResult
	 open func expressionOperator() throws -> ExpressionOperatorContext {
		var _localctx: ExpressionOperatorContext = ExpressionOperatorContext(_ctx, getState())
		try enterRule(_localctx, 50, CwiftParser.RULE_expressionOperator)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(296)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CwiftParser.Tokens.Multiplication.rawValue,CwiftParser.Tokens.Division.rawValue,CwiftParser.Tokens.Remainder.rawValue,CwiftParser.Tokens.Addition.rawValue,CwiftParser.Tokens.Subtraction.rawValue,CwiftParser.Tokens.MoreOrEqual.rawValue,CwiftParser.Tokens.LessOrEqual.rawValue,CwiftParser.Tokens.More.rawValue,CwiftParser.Tokens.Less.rawValue,CwiftParser.Tokens.Equal.rawValue,CwiftParser.Tokens.NotEqual.rawValue,CwiftParser.Tokens.BitwiseAnd.rawValue,CwiftParser.Tokens.BitwiseXor.rawValue,CwiftParser.Tokens.BitwiseOr.rawValue,CwiftParser.Tokens.LogicalAnd.rawValue,CwiftParser.Tokens.LogicalOr.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class UnaryExpressionContext: ParserRuleContext {
			open
			func postfixExpression() -> PostfixExpressionContext? {
				return getRuleContext(PostfixExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_unaryExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterUnaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitUnaryExpression(self)
			}
		}
	}
	@discardableResult
	 open func unaryExpression() throws -> UnaryExpressionContext {
		var _localctx: UnaryExpressionContext = UnaryExpressionContext(_ctx, getState())
		try enterRule(_localctx, 52, CwiftParser.RULE_unaryExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(298)
		 	try postfixExpression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PostfixExpressionContext: ParserRuleContext {
			open
			func functionCallExpression() -> FunctionCallExpressionContext? {
				return getRuleContext(FunctionCallExpressionContext.self, 0)
			}
			open
			func primaryExpression() -> PrimaryExpressionContext? {
				return getRuleContext(PrimaryExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_postfixExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterPostfixExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitPostfixExpression(self)
			}
		}
	}
	@discardableResult
	 open func postfixExpression() throws -> PostfixExpressionContext {
		var _localctx: PostfixExpressionContext = PostfixExpressionContext(_ctx, getState())
		try enterRule(_localctx, 54, CwiftParser.RULE_postfixExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(302)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,20, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(300)
		 		try functionCallExpression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(301)
		 		try primaryExpression()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallExpressionContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func functionCallArgumentClause() -> FunctionCallArgumentClauseContext? {
				return getRuleContext(FunctionCallArgumentClauseContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_functionCallExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterFunctionCallExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitFunctionCallExpression(self)
			}
		}
	}
	@discardableResult
	 open func functionCallExpression() throws -> FunctionCallExpressionContext {
		var _localctx: FunctionCallExpressionContext = FunctionCallExpressionContext(_ctx, getState())
		try enterRule(_localctx, 56, CwiftParser.RULE_functionCallExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(304)
		 	try match(CwiftParser.Tokens.Identifier.rawValue)
		 	setState(305)
		 	try functionCallArgumentClause()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallArgumentClauseContext: ParserRuleContext {
			open
			func LeftParen() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LeftParen.rawValue, 0)
			}
			open
			func RightParen() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.RightParen.rawValue, 0)
			}
			open
			func functionCallArgumentList() -> FunctionCallArgumentListContext? {
				return getRuleContext(FunctionCallArgumentListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_functionCallArgumentClause
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterFunctionCallArgumentClause(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitFunctionCallArgumentClause(self)
			}
		}
	}
	@discardableResult
	 open func functionCallArgumentClause() throws -> FunctionCallArgumentClauseContext {
		var _localctx: FunctionCallArgumentClauseContext = FunctionCallArgumentClauseContext(_ctx, getState())
		try enterRule(_localctx, 58, CwiftParser.RULE_functionCallArgumentClause)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(313)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,21, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(307)
		 		try match(CwiftParser.Tokens.LeftParen.rawValue)
		 		setState(308)
		 		try match(CwiftParser.Tokens.RightParen.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(309)
		 		try match(CwiftParser.Tokens.LeftParen.rawValue)
		 		setState(310)
		 		try functionCallArgumentList()
		 		setState(311)
		 		try match(CwiftParser.Tokens.RightParen.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallArgumentListContext: ParserRuleContext {
			open
			func functionCallArgument() -> [FunctionCallArgumentContext] {
				return getRuleContexts(FunctionCallArgumentContext.self)
			}
			open
			func functionCallArgument(_ i: Int) -> FunctionCallArgumentContext? {
				return getRuleContext(FunctionCallArgumentContext.self, i)
			}
			open
			func Comma() -> [TerminalNode] {
				return getTokens(CwiftParser.Tokens.Comma.rawValue)
			}
			open
			func Comma(_ i:Int) -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Comma.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_functionCallArgumentList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterFunctionCallArgumentList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitFunctionCallArgumentList(self)
			}
		}
	}
	@discardableResult
	 open func functionCallArgumentList() throws -> FunctionCallArgumentListContext {
		var _localctx: FunctionCallArgumentListContext = FunctionCallArgumentListContext(_ctx, getState())
		try enterRule(_localctx, 60, CwiftParser.RULE_functionCallArgumentList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(315)
		 	try functionCallArgument()
		 	setState(320)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CwiftParser.Tokens.Comma.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(316)
		 		try match(CwiftParser.Tokens.Comma.rawValue)
		 		setState(317)
		 		try functionCallArgument()


		 		setState(322)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionDeclarationContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func parameterClause() -> ParameterClauseContext? {
				return getRuleContext(ParameterClauseContext.self, 0)
			}
			open
			func codeBlock() -> CodeBlockContext? {
				return getRuleContext(CodeBlockContext.self, 0)
			}
			open
			func returnSignature() -> ReturnSignatureContext? {
				return getRuleContext(ReturnSignatureContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_functionDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterFunctionDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitFunctionDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func functionDeclaration() throws -> FunctionDeclarationContext {
		var _localctx: FunctionDeclarationContext = FunctionDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 62, CwiftParser.RULE_functionDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(323)
		 	try match(CwiftParser.Tokens.T__1.rawValue)
		 	setState(324)
		 	try match(CwiftParser.Tokens.Identifier.rawValue)
		 	setState(325)
		 	try parameterClause()
		 	setState(327)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CwiftParser.Tokens.Arrow.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(326)
		 		try returnSignature()

		 	}

		 	setState(329)
		 	try codeBlock()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterClauseContext: ParserRuleContext {
			open
			func LeftParen() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LeftParen.rawValue, 0)
			}
			open
			func RightParen() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.RightParen.rawValue, 0)
			}
			open
			func parameterList() -> ParameterListContext? {
				return getRuleContext(ParameterListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_parameterClause
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterParameterClause(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitParameterClause(self)
			}
		}
	}
	@discardableResult
	 open func parameterClause() throws -> ParameterClauseContext {
		var _localctx: ParameterClauseContext = ParameterClauseContext(_ctx, getState())
		try enterRule(_localctx, 64, CwiftParser.RULE_parameterClause)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(337)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,24, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(331)
		 		try match(CwiftParser.Tokens.LeftParen.rawValue)
		 		setState(332)
		 		try match(CwiftParser.Tokens.RightParen.rawValue)

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(333)
		 		try match(CwiftParser.Tokens.LeftParen.rawValue)
		 		setState(334)
		 		try parameterList()
		 		setState(335)
		 		try match(CwiftParser.Tokens.RightParen.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterListContext: ParserRuleContext {
			open
			func parameter() -> [ParameterContext] {
				return getRuleContexts(ParameterContext.self)
			}
			open
			func parameter(_ i: Int) -> ParameterContext? {
				return getRuleContext(ParameterContext.self, i)
			}
			open
			func Comma() -> [TerminalNode] {
				return getTokens(CwiftParser.Tokens.Comma.rawValue)
			}
			open
			func Comma(_ i:Int) -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Comma.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_parameterList
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterParameterList(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitParameterList(self)
			}
		}
	}
	@discardableResult
	 open func parameterList() throws -> ParameterListContext {
		var _localctx: ParameterListContext = ParameterListContext(_ctx, getState())
		try enterRule(_localctx, 66, CwiftParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(339)
		 	try parameter()
		 	setState(344)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CwiftParser.Tokens.Comma.rawValue
		 	      return testSet
		 	 }()) {
		 		setState(340)
		 		try match(CwiftParser.Tokens.Comma.rawValue)
		 		setState(341)
		 		try parameter()


		 		setState(346)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterContext: ParserRuleContext {
			open
			func localParameterName() -> LocalParameterNameContext? {
				return getRuleContext(LocalParameterNameContext.self, 0)
			}
			open
			func Colon() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Colon.rawValue, 0)
			}
			open
			func typeStatement() -> TypeStatementContext? {
				return getRuleContext(TypeStatementContext.self, 0)
			}
			open
			func externalParameterName() -> ExternalParameterNameContext? {
				return getRuleContext(ExternalParameterNameContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_parameter
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterParameter(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitParameter(self)
			}
		}
	}
	@discardableResult
	 open func parameter() throws -> ParameterContext {
		var _localctx: ParameterContext = ParameterContext(_ctx, getState())
		try enterRule(_localctx, 68, CwiftParser.RULE_parameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(348)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,26,_ctx)) {
		 	case 1:
		 		setState(347)
		 		try externalParameterName()

		 		break
		 	default: break
		 	}
		 	setState(350)
		 	try localParameterName()
		 	setState(351)
		 	try match(CwiftParser.Tokens.Colon.rawValue)
		 	setState(352)
		 	try typeStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ReturnSignatureContext: ParserRuleContext {
			open
			func Arrow() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Arrow.rawValue, 0)
			}
			open
			func typeStatement() -> TypeStatementContext? {
				return getRuleContext(TypeStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_returnSignature
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterReturnSignature(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitReturnSignature(self)
			}
		}
	}
	@discardableResult
	 open func returnSignature() throws -> ReturnSignatureContext {
		var _localctx: ReturnSignatureContext = ReturnSignatureContext(_ctx, getState())
		try enterRule(_localctx, 70, CwiftParser.RULE_returnSignature)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(354)
		 	try match(CwiftParser.Tokens.Arrow.rawValue)
		 	setState(355)
		 	try typeStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExternalParameterNameContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_externalParameterName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterExternalParameterName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitExternalParameterName(self)
			}
		}
	}
	@discardableResult
	 open func externalParameterName() throws -> ExternalParameterNameContext {
		var _localctx: ExternalParameterNameContext = ExternalParameterNameContext(_ctx, getState())
		try enterRule(_localctx, 72, CwiftParser.RULE_externalParameterName)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(357)
		 	try match(CwiftParser.Tokens.Identifier.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LocalParameterNameContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_localParameterName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterLocalParameterName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitLocalParameterName(self)
			}
		}
	}
	@discardableResult
	 open func localParameterName() throws -> LocalParameterNameContext {
		var _localctx: LocalParameterNameContext = LocalParameterNameContext(_ctx, getState())
		try enterRule(_localctx, 74, CwiftParser.RULE_localParameterName)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(359)
		 	try match(CwiftParser.Tokens.Identifier.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionCallArgumentContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func Colon() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Colon.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_functionCallArgument
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterFunctionCallArgument(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitFunctionCallArgument(self)
			}
		}
	}
	@discardableResult
	 open func functionCallArgument() throws -> FunctionCallArgumentContext {
		var _localctx: FunctionCallArgumentContext = FunctionCallArgumentContext(_ctx, getState())
		try enterRule(_localctx, 76, CwiftParser.RULE_functionCallArgument)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(365)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,27, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(361)
		 		try expression()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(362)
		 		try match(CwiftParser.Tokens.Identifier.rawValue)
		 		setState(363)
		 		try match(CwiftParser.Tokens.Colon.rawValue)
		 		setState(364)
		 		try expression()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrimaryExpressionContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func literalExpression() -> LiteralExpressionContext? {
				return getRuleContext(LiteralExpressionContext.self, 0)
			}
			open
			func LeftParen() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.LeftParen.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func RightParen() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.RightParen.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_primaryExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterPrimaryExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitPrimaryExpression(self)
			}
		}
	}
	@discardableResult
	 open func primaryExpression() throws -> PrimaryExpressionContext {
		var _localctx: PrimaryExpressionContext = PrimaryExpressionContext(_ctx, getState())
		try enterRule(_localctx, 78, CwiftParser.RULE_primaryExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(373)
		 	try _errHandler.sync(self)
		 	switch (CwiftParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .Identifier:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(367)
		 		try match(CwiftParser.Tokens.Identifier.rawValue)

		 		break
		 	case .True:fallthrough
		 	case .False:fallthrough
		 	case .Nil:fallthrough
		 	case .IntegerLiteral:fallthrough
		 	case .DoubleLiteral:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(368)
		 		try literalExpression()

		 		break

		 	case .LeftParen:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(369)
		 		try match(CwiftParser.Tokens.LeftParen.rawValue)
		 		setState(370)
		 		try expression()
		 		setState(371)
		 		try match(CwiftParser.Tokens.RightParen.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LiteralExpressionContext: ParserRuleContext {
			open
			func literal() -> LiteralContext? {
				return getRuleContext(LiteralContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_literalExpression
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterLiteralExpression(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitLiteralExpression(self)
			}
		}
	}
	@discardableResult
	 open func literalExpression() throws -> LiteralExpressionContext {
		var _localctx: LiteralExpressionContext = LiteralExpressionContext(_ctx, getState())
		try enterRule(_localctx, 80, CwiftParser.RULE_literalExpression)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(375)
		 	try literal()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class LiteralContext: ParserRuleContext {
			open
			func IntegerLiteral() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.IntegerLiteral.rawValue, 0)
			}
			open
			func DoubleLiteral() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.DoubleLiteral.rawValue, 0)
			}
			open
			func booleanLiteral() -> BooleanLiteralContext? {
				return getRuleContext(BooleanLiteralContext.self, 0)
			}
			open
			func Nil() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Nil.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_literal
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitLiteral(self)
			}
		}
	}
	@discardableResult
	 open func literal() throws -> LiteralContext {
		var _localctx: LiteralContext = LiteralContext(_ctx, getState())
		try enterRule(_localctx, 82, CwiftParser.RULE_literal)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(381)
		 	try _errHandler.sync(self)
		 	switch (CwiftParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .IntegerLiteral:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(377)
		 		try match(CwiftParser.Tokens.IntegerLiteral.rawValue)

		 		break

		 	case .DoubleLiteral:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(378)
		 		try match(CwiftParser.Tokens.DoubleLiteral.rawValue)

		 		break
		 	case .True:fallthrough
		 	case .False:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(379)
		 		try booleanLiteral()

		 		break

		 	case .Nil:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(380)
		 		try match(CwiftParser.Tokens.Nil.rawValue)

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclarationContext: ParserRuleContext {
			open
			func variableDeclaration() -> VariableDeclarationContext? {
				return getRuleContext(VariableDeclarationContext.self, 0)
			}
			open
			func constantDeclaration() -> ConstantDeclarationContext? {
				return getRuleContext(ConstantDeclarationContext.self, 0)
			}
			open
			func functionDeclaration() -> FunctionDeclarationContext? {
				return getRuleContext(FunctionDeclarationContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_declaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func declaration() throws -> DeclarationContext {
		var _localctx: DeclarationContext = DeclarationContext(_ctx, getState())
		try enterRule(_localctx, 84, CwiftParser.RULE_declaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(386)
		 	try _errHandler.sync(self)
		 	switch (CwiftParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .Variable:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(383)
		 		try variableDeclaration()

		 		break

		 	case .Constant:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(384)
		 		try constantDeclaration()

		 		break

		 	case .T__1:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(385)
		 		try functionDeclaration()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class VariableDeclarationContext: ParserRuleContext {
			open
			func Variable() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Variable.rawValue, 0)
			}
			open
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
			open
			func assignmentOperator() -> AssignmentOperatorContext? {
				return getRuleContext(AssignmentOperatorContext.self, 0)
			}
			open
			func initializer() -> InitializerContext? {
				return getRuleContext(InitializerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_variableDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterVariableDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitVariableDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func variableDeclaration() throws -> VariableDeclarationContext {
		var _localctx: VariableDeclarationContext = VariableDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 86, CwiftParser.RULE_variableDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(395)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,31, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(388)
		 		try match(CwiftParser.Tokens.Variable.rawValue)
		 		setState(389)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(390)
		 		try match(CwiftParser.Tokens.Variable.rawValue)
		 		setState(391)
		 		try declarator()
		 		setState(392)
		 		try assignmentOperator()
		 		setState(393)
		 		try initializer()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ConstantDeclarationContext: ParserRuleContext {
			open
			func Constant() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Constant.rawValue, 0)
			}
			open
			func declarator() -> DeclaratorContext? {
				return getRuleContext(DeclaratorContext.self, 0)
			}
			open
			func assignmentOperator() -> AssignmentOperatorContext? {
				return getRuleContext(AssignmentOperatorContext.self, 0)
			}
			open
			func initializer() -> InitializerContext? {
				return getRuleContext(InitializerContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_constantDeclaration
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterConstantDeclaration(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitConstantDeclaration(self)
			}
		}
	}
	@discardableResult
	 open func constantDeclaration() throws -> ConstantDeclarationContext {
		var _localctx: ConstantDeclarationContext = ConstantDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 88, CwiftParser.RULE_constantDeclaration)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(404)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,32, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(397)
		 		try match(CwiftParser.Tokens.Constant.rawValue)
		 		setState(398)
		 		try declarator()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(399)
		 		try match(CwiftParser.Tokens.Constant.rawValue)
		 		setState(400)
		 		try declarator()
		 		setState(401)
		 		try assignmentOperator()
		 		setState(402)
		 		try initializer()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class InitializerContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_initializer
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterInitializer(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitInitializer(self)
			}
		}
	}
	@discardableResult
	 open func initializer() throws -> InitializerContext {
		var _localctx: InitializerContext = InitializerContext(_ctx, getState())
		try enterRule(_localctx, 90, CwiftParser.RULE_initializer)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(406)
		 	try expression()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class DeclaratorContext: ParserRuleContext {
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func Colon() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Colon.rawValue, 0)
			}
			open
			func typeDeclarator() -> TypeDeclaratorContext? {
				return getRuleContext(TypeDeclaratorContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_declarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func declarator() throws -> DeclaratorContext {
		var _localctx: DeclaratorContext = DeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 92, CwiftParser.RULE_declarator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(408)
		 	try match(CwiftParser.Tokens.Identifier.rawValue)
		 	setState(409)
		 	try match(CwiftParser.Tokens.Colon.rawValue)
		 	setState(410)
		 	try typeDeclarator()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeStatementContext: ParserRuleContext {
			open
			func primitiveTypeStatement() -> PrimitiveTypeStatementContext? {
				return getRuleContext(PrimitiveTypeStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_typeStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterTypeStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitTypeStatement(self)
			}
		}
	}
	@discardableResult
	 open func typeStatement() throws -> TypeStatementContext {
		var _localctx: TypeStatementContext = TypeStatementContext(_ctx, getState())
		try enterRule(_localctx, 94, CwiftParser.RULE_typeStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(412)
		 	try primitiveTypeStatement()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrimitiveTypeStatementContext: ParserRuleContext {
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_primitiveTypeStatement
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterPrimitiveTypeStatement(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitPrimitiveTypeStatement(self)
			}
		}
	}
	@discardableResult
	 open func primitiveTypeStatement() throws -> PrimitiveTypeStatementContext {
		var _localctx: PrimitiveTypeStatementContext = PrimitiveTypeStatementContext(_ctx, getState())
		try enterRule(_localctx, 96, CwiftParser.RULE_primitiveTypeStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(414)
		 	try typeName()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeDeclaratorContext: ParserRuleContext {
			open
			func primitiveTypeDeclarator() -> PrimitiveTypeDeclaratorContext? {
				return getRuleContext(PrimitiveTypeDeclaratorContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_typeDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterTypeDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitTypeDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func typeDeclarator() throws -> TypeDeclaratorContext {
		var _localctx: TypeDeclaratorContext = TypeDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 98, CwiftParser.RULE_typeDeclarator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(416)
		 	try primitiveTypeDeclarator()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class PrimitiveTypeDeclaratorContext: ParserRuleContext {
			open
			func typeName() -> TypeNameContext? {
				return getRuleContext(TypeNameContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_primitiveTypeDeclarator
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterPrimitiveTypeDeclarator(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitPrimitiveTypeDeclarator(self)
			}
		}
	}
	@discardableResult
	 open func primitiveTypeDeclarator() throws -> PrimitiveTypeDeclaratorContext {
		var _localctx: PrimitiveTypeDeclaratorContext = PrimitiveTypeDeclaratorContext(_ctx, getState())
		try enterRule(_localctx, 100, CwiftParser.RULE_primitiveTypeDeclarator)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(418)
		 	try typeName()

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeNameContext: ParserRuleContext {
			open
			func Int() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Int.rawValue, 0)
			}
			open
			func Identifier() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Identifier.rawValue, 0)
			}
			open
			func Bool() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Bool.rawValue, 0)
			}
			open
			func Double() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.Double.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_typeName
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterTypeName(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitTypeName(self)
			}
		}
	}
	@discardableResult
	 open func typeName() throws -> TypeNameContext {
		var _localctx: TypeNameContext = TypeNameContext(_ctx, getState())
		try enterRule(_localctx, 102, CwiftParser.RULE_typeName)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(420)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = {  () -> Bool in
		 	   let testArray: [Int] = [_la, CwiftParser.Tokens.Int.rawValue,CwiftParser.Tokens.Double.rawValue,CwiftParser.Tokens.Bool.rawValue,CwiftParser.Tokens.Identifier.rawValue]
		 	    return  Utils.testBitLeftShiftArray(testArray, 0)
		 	}()
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BooleanLiteralContext: ParserRuleContext {
			open
			func True() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.True.rawValue, 0)
			}
			open
			func False() -> TerminalNode? {
				return getToken(CwiftParser.Tokens.False.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return CwiftParser.RULE_booleanLiteral
		}
		override open
		func enterRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.enterBooleanLiteral(self)
			}
		}
		override open
		func exitRule(_ listener: ParseTreeListener) {
			if let listener = listener as? CwiftListener {
				listener.exitBooleanLiteral(self)
			}
		}
	}
	@discardableResult
	 open func booleanLiteral() throws -> BooleanLiteralContext {
		var _localctx: BooleanLiteralContext = BooleanLiteralContext(_ctx, getState())
		try enterRule(_localctx, 104, CwiftParser.RULE_booleanLiteral)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(422)
		 	_la = try _input.LA(1)
		 	if (!(//closure
		 	 { () -> Bool in
		 	      let testSet: Bool = _la == CwiftParser.Tokens.True.rawValue || _la == CwiftParser.Tokens.False.rawValue
		 	      return testSet
		 	 }())) {
		 	try _errHandler.recoverInline(self)
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  13:
			return try logicalOrExpression_sempred(_localctx?.castdown(LogicalOrExpressionContext.self), predIndex)
		case  14:
			return try logicalAndExpression_sempred(_localctx?.castdown(LogicalAndExpressionContext.self), predIndex)
		case  15:
			return try bitwiseOrExpression_sempred(_localctx?.castdown(BitwiseOrExpressionContext.self), predIndex)
		case  16:
			return try bitwiseXorExpression_sempred(_localctx?.castdown(BitwiseXorExpressionContext.self), predIndex)
		case  17:
			return try bitwiseAndExpression_sempred(_localctx?.castdown(BitwiseAndExpressionContext.self), predIndex)
		case  18:
			return try equalityExpression_sempred(_localctx?.castdown(EqualityExpressionContext.self), predIndex)
		case  19:
			return try relationalExpression_sempred(_localctx?.castdown(RelationalExpressionContext.self), predIndex)
		case  20:
			return try additiveExpression_sempred(_localctx?.castdown(AdditiveExpressionContext.self), predIndex)
		case  21:
			return try multiplicativeExpression_sempred(_localctx?.castdown(MultiplicativeExpressionContext.self), predIndex)
	    default: return true
		}
	}
	private func logicalOrExpression_sempred(_ _localctx: LogicalOrExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func logicalAndExpression_sempred(_ _localctx: LogicalAndExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 1:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func bitwiseOrExpression_sempred(_ _localctx: BitwiseOrExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 2:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func bitwiseXorExpression_sempred(_ _localctx: BitwiseXorExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 3:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func bitwiseAndExpression_sempred(_ _localctx: BitwiseAndExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 4:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func equalityExpression_sempred(_ _localctx: EqualityExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 5:return precpred(_ctx, 2)
		    case 6:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func relationalExpression_sempred(_ _localctx: RelationalExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 7:return precpred(_ctx, 4)
		    case 8:return precpred(_ctx, 3)
		    case 9:return precpred(_ctx, 2)
		    case 10:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func additiveExpression_sempred(_ _localctx: AdditiveExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 11:return precpred(_ctx, 2)
		    case 12:return precpred(_ctx, 1)
		    default: return true
		}
	}
	private func multiplicativeExpression_sempred(_ _localctx: MultiplicativeExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 13:return precpred(_ctx, 3)
		    case 14:return precpred(_ctx, 2)
		    case 15:return precpred(_ctx, 1)
		    default: return true
		}
	}


	public
	static let _serializedATN = CwiftParserATN().jsonString

	public
	static let _ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}