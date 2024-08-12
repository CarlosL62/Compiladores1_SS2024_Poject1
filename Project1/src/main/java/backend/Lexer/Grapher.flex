%%

/* Options and declarations */
%public
%class Lexer
%unicode
%cup

%{
  /* Java code section (import statements, member variables, etc.) */
  import java_cup.runtime.Symbol;
%}

/* Regular expressions and lexical rules */
%{

/* Token Definitions */
%}

%%

/* Regular Expression Rules */
%{
/* Keywords */
graficar                 { return symbol(sym.GRAFICAR); }

/* Shapes */
poligono                 { return symbol(sym.POLIGONO); }
cuadrado                 { return symbol(sym.CUADRADO); }
circulo                  { return symbol(sym.CIRCULO); }

/* Colors */
amarillo                 { return symbol(sym.AMARILLO); }
verde                    { return symbol(sym.VERDE); }
rojo                     { return symbol(sym.ROJO); }

/* Identifiers */
[a-zA-Z_][a-zA-Z_0-9]*   { return symbol(sym.IDENTIFIER, yytext()); }

/* Numbers */
[0-9]+                   { return symbol(sym.NUMBER, Integer.parseInt(yytext())); }

/* Operators */
"+"                      { return symbol(sym.PLUS); }
"-"                      { return symbol(sym.MINUS); }
"*"                      { return symbol(sym.MULTIPLY); }
"/"                      { return symbol(sym.DIVIDE); }

/* Punctuation */
"("                      { return symbol(sym.LPAREN); }
")"                      { return symbol(sym.RPAREN); }
","                      { return symbol(sym.COMMA); }

/* Whitespace and Comments */
[ \t\r\n]+               { /* Ignore whitespace */ }
"//" [^\n]*              { /* Ignore single-line comments */ }
"/*" [^*]* "*/"          { /* Ignore multi-line comments */ }

/* Error handling */
.                        { System.err.println("Illegal character: " + yytext()); }

%%

/* User Code Section */
private Symbol symbol(int type) {
  return new Symbol(type, yyline, yycolumn);
}

private Symbol symbol(int type, Object value) {
  return new Symbol(type, yyline, yycolumn, value);
}
