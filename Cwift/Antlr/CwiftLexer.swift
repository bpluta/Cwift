// Generated from Cwift.g4 by ANTLR 4.7.1
import Antlr4

open class CwiftLexer: Lexer {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = CwiftLexer._ATN.getNumberOfDecisions()
          for i in 0..<length {
          	    decisionToDFA.append(DFA(CwiftLexer._ATN.getDecisionState(i)!, i))
          }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	static let T__0=1, T__1=2, True=3, False=4, Colon=5, Assign=6, Arrow=7, 
            SemiColon=8, Multiplication=9, Division=10, Remainder=11, Addition=12, 
            Subtraction=13, MoreOrEqual=14, LessOrEqual=15, More=16, Less=17, 
            Equal=18, NotEqual=19, BitwiseAnd=20, BitwiseXor=21, BitwiseOr=22, 
            LogicalAnd=23, LogicalOr=24, Variable=25, Constant=26, Int=27, 
            Double=28, Comma=29, Question=30, Bool=31, Nil=32, PrefixOperator=33, 
            IntegerLiteral=34, NumberSequence=35, NonzeroDigit=36, Digit=37, 
            If=38, Else=39, While=40, LeftParen=41, RightParen=42, LeftBrace=43, 
            RightBrace=44, FloatingSequence=45, DoubleLiteral=46, Identifier=47, 
            WS=48, BlockComment=49, LineComment=50

	public
	static let channelNames: [String] = [
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	]

	public
	static let modeNames: [String] = [
		"DEFAULT_MODE"
	]

	public
	static let ruleNames: [String] = [
		"T__0", "T__1", "True", "False", "Colon", "Assign", "Arrow", "SemiColon", 
		"Multiplication", "Division", "Remainder", "Addition", "Subtraction", 
		"MoreOrEqual", "LessOrEqual", "More", "Less", "Equal", "NotEqual", "BitwiseAnd", 
		"BitwiseXor", "BitwiseOr", "LogicalAnd", "LogicalOr", "Variable", "Constant", 
		"Int", "Double", "Comma", "Question", "Bool", "Nil", "PrefixOperator", 
		"IntegerLiteral", "NumberSequence", "NonzeroDigit", "Digit", "If", "Else", 
		"While", "LeftParen", "RightParen", "LeftBrace", "RightBrace", "FloatingSequence", 
		"DoubleLiteral", "Identifier", "WS", "BlockComment", "LineComment"
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
	func getVocabulary() -> Vocabulary {
		return CwiftLexer.VOCABULARY
	}

	public
	required init(_ input: CharStream) {
	    RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION)
		super.init(input)
		_interp = LexerATNSimulator(self, CwiftLexer._ATN, CwiftLexer._decisionToDFA, CwiftLexer._sharedContextCache)
	}

	override open
	func getGrammarFileName() -> String { return "Cwift.g4" }

	override open
	func getRuleNames() -> [String] { return CwiftLexer.ruleNames }

	override open
	func getSerializedATN() -> String { return CwiftLexer._serializedATN }

	override open
	func getChannelNames() -> [String] { return CwiftLexer.channelNames }

	override open
	func getModeNames() -> [String] { return CwiftLexer.modeNames }

	override open
	func getATN() -> ATN { return CwiftLexer._ATN }


	public
	static let _serializedATN: String = CwiftLexerATN().jsonString

	public
	static let _ATN: ATN = ATNDeserializer().deserializeFromJson(_serializedATN)
}