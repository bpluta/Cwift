grammar Cwift;

statements
  : statement+
  ;

statement
  : declaration
  | loopStatement
  | branchStatement
  | returnStatement
  | expression
  ;

returnStatement
  : 'return' expression
  ;

branchStatement
  : ifStatement
  ;

ifStatement
  : ifExpression elseIfExpression* elseExpression?
  ;

ifExpression
  : If expression codeBlock
  ;

elseIfExpression
  : Else ifExpression
  ;

elseExpression
  : Else codeBlock
  ;

loopStatement
  : While expression codeBlock
  ;

codeBlock
  : LeftBrace statements? RightBrace
  ;

expression
  : assignmentExpression
  ;

assignmentExpression
  : conditionalExpression
  | unaryExpression Assign assignmentExpression
  ;

conditionalExpression
  : logicalOrExpression (Question expression Colon conditionalExpression)?
  ;

logicalOrExpression
  : logicalAndExpression
  | logicalOrExpression LogicalOr logicalAndExpression
  ;

logicalAndExpression
  : bitwiseOrExpression
  | logicalAndExpression LogicalAnd bitwiseOrExpression
  ;

bitwiseOrExpression
  : bitwiseXorExpression
  | bitwiseOrExpression BitwiseOr bitwiseXorExpression
  ;

bitwiseXorExpression
  : bitwiseAndExpression
  | bitwiseXorExpression BitwiseXor bitwiseAndExpression
  ;

bitwiseAndExpression
  : equalityExpression
  | bitwiseAndExpression BitwiseAnd equalityExpression
  ;

equalityExpression
  : relationalExpression
  | equalityExpression Equal relationalExpression
  | equalityExpression NotEqual relationalExpression
  ;

relationalExpression
  : additiveExpression
  | relationalExpression Less additiveExpression
  | relationalExpression More additiveExpression
  | relationalExpression LessOrEqual additiveExpression
  | relationalExpression MoreOrEqual additiveExpression
  ;

additiveExpression
  : multiplicativeExpression
  | additiveExpression Addition multiplicativeExpression
  | additiveExpression Subtraction multiplicativeExpression
  ;

multiplicativeExpression
  : unaryExpression
  | multiplicativeExpression Multiplication unaryExpression
  | multiplicativeExpression Division unaryExpression
  | multiplicativeExpression Remainder unaryExpression
  ;


conditionalOperator
  : Question
  ;

conditionalAlternativeOperator
  : Colon
  ;

assignmentOperator
  : Assign
  ;

expressionOperator
  : Multiplication
  | Division
  | Remainder
  | Addition
  | Subtraction
  | MoreOrEqual
  | LessOrEqual
  | More
  | Less
  | Equal
  | NotEqual
  | BitwiseAnd
  | BitwiseXor
  | BitwiseOr
  | LogicalAnd
  | LogicalOr
  ;


unaryExpression
  : postfixExpression
  ;

postfixExpression
  : functionCallExpression
  | primaryExpression
  ;

functionCallExpression
  : Identifier functionCallArgumentClause
  ;

functionCallArgumentClause
  : LeftParen RightParen
  | LeftParen functionCallArgumentList RightParen
  ;

functionCallArgumentList
  : functionCallArgument ( Comma functionCallArgument )*
  ;

functionDeclaration
  : 'func' Identifier parameterClause returnSignature? codeBlock
  ;

parameterClause
  : LeftParen RightParen
  | LeftParen parameterList RightParen
  ;

parameterList
  : parameter ( Comma parameter )*
  ;

parameter
  : externalParameterName? localParameterName Colon typeStatement
  ;

returnSignature
  : Arrow typeStatement
  ;

externalParameterName
  : Identifier
  ;

localParameterName
  : Identifier
  ;

functionCallArgument
  : expression
  | Identifier Colon expression
  ;

primaryExpression
  : Identifier
  | literalExpression
  | LeftParen expression RightParen
  ;

literalExpression
  : literal
  ;

literal
  : IntegerLiteral
  | DoubleLiteral
  | booleanLiteral
  | Nil
  ;

declaration
  : variableDeclaration
  | constantDeclaration
  | functionDeclaration
  ;

variableDeclaration
  : Variable declarator
  | Variable declarator assignmentOperator initializer
  ;

constantDeclaration
  : Constant declarator
  | Constant declarator assignmentOperator initializer
  ;

initializer
  : expression
  ;

declarator
  : Identifier Colon typeDeclarator
  ;

typeStatement
  : primitiveTypeStatement
  ;

primitiveTypeStatement
  : typeName
  ;

typeDeclarator
  : primitiveTypeDeclarator
  ;

primitiveTypeDeclarator
  : typeName
  ;

typeName
  : Int
  | Identifier
  | Bool
  | Double
  ;

booleanLiteral
  : True
  | False
  ;

True: 'true';
False: 'false';
Colon : ':';
Assign : '=';
Arrow : '->';
SemiColon : ';';
Multiplication: '*';
Division: '/';
Remainder: '%';
Addition: '+';
Subtraction: '-';
MoreOrEqual: '>=';
LessOrEqual: '<=';
More: '>';
Less: '<';
Equal: '==';
NotEqual: '!=';
BitwiseAnd: '&';
BitwiseXor: '^';
BitwiseOr: '|';
LogicalAnd: '&&';
LogicalOr: '||';
Variable : 'var';
Constant : 'let';
Int: 'Int';
Double: 'Double';
Comma: ',';
Question: '?';
Bool: 'Bool';
Nil: 'nil';
PrefixOperator: '-' | '!' | '~';
IntegerLiteral: NumberSequence;
NumberSequence: NonzeroDigit Digit* | '0';
NonzeroDigit: [1-9];
Digit: [0-9];
If: 'if';
Else: 'else';
While: 'while';
LeftParen: '(';
RightParen: ')';
LeftBrace: '{';
RightBrace: '}';
FloatingSequence: Digit+;
DoubleLiteral: NumberSequence '.' FloatingSequence;

Identifier: [a-zA-Z_][a-zA-Z_0-9]*;

WS : [ \n\r\t]+ -> skip;
BlockComment: '/*' .*? '*/' -> skip;
LineComment: '//' ~[\r\n]* -> skip;
