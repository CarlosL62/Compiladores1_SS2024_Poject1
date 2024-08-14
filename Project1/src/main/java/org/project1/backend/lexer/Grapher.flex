package org.project1.backend.lexer;

import java_cup.runtime.*;
import org.project1.Cup.ParserSym;

%%

%public
%class Lexer
%unicode
%caseless
%line
%column
%cup

// REGEX
WHITESPACES = ([\s\t\r\n]+)
NUMBER = ([0-9][0-9]*)
LETTER = [a-zA-Z]
ID = {WHITESPACES}*({LETTER}|_)+({LETTER}|{NUMBER}|_)*

// Instructions
GRAPH = "graficar"
ANIMATE = "animar"
OBJECT = "objeto"
PREVIOUS = "anterior"

// Operations
PLUS = "+"
MINUS = "-"
TIMES = "*"
DIVISION = "/"
LPAREN = "("
RPAREN = ")"
EQUALS = "="

// Colors
BLUE = "azul"
RED = "rojo"
YELLOW = "amarillo"
GREEN = "verde"
// Other colors
ORANGE = "naranja"
GRAY = "gris"
BLACK = "negro"
PURPLE = "purpura"
GOLDEN = "dorado"

// Types of animation
// LINE is defined in the next section
CURVE = "curva"

//Objects to graph
CIRCLE = "circulo"
SQUARE = "cuadrado"
RECTANGLE = "rectangulo"
LINE = "linea"
POLYGON = "poligono"

COMMA = ","

%{
        StringBuffer stringBuffer = new StringBuffer();

        //ESTOS METODOS LOS PODES COPIAR POR QUE SE USA LO MISMO ES PARA PASAR LOS SIMBOLOS

        private Symbol symbol(int type){
            return new Symbol(type, yyline+1, yycolumn+1);
        }

        private Symbol symbol(int type, Object value){
            return new Symbol(type, yyline+1, yycolumn+1, value);
        }
%}

//Aca retornamos el END OF FILE
%eofval{
    return new Symbol(ParserSym.EOF);
%eofval}

%%

<YYINITIAL>{

//Instructions
{GRAPH} {return new Symbol(ParserSym.GRAPH, yytext());}
{ANIMATE} {return new Symbol(ParserSym.ANIMATE, yytext());}
{OBJECT} {return new Symbol(ParserSym.OBJECT, yytext());}
{PREVIOUS} {return new Symbol(ParserSym.PREVIOUS, yytext());}

//Operators
{PLUS} {return new Symbol(ParserSym.PLUS, yycolumn, yyline, yytext());}
{MINUS} {return new Symbol(ParserSym.MINUS, yycolumn, yyline, yytext());}
{TIMES} {return new Symbol(ParserSym.TIMES, yycolumn, yyline, yytext());}
{DIVISION} {return new Symbol(ParserSym.DIVISION, yycolumn, yyline, yytext());}
{LPAREN} {return new Symbol(ParserSym.LPAREN, yycolumn, yyline, yytext());}
{RPAREN} {return new Symbol(ParserSym.RPAREN, yycolumn, yyline, yytext());}
{EQUALS} {return new Symbol(ParserSym.EQUALS, yycolumn, yyline, yytext());}

// Colors
{BLUE} {return new Symbol(ParserSym.BLUE, yytext());}
{RED} {return new Symbol(ParserSym.RED, yytext());}
{YELLOW} {return new Symbol(ParserSym.YELLOW, yytext());}
{GREEN} {return new Symbol(ParserSym.GREEN, yytext());}
{ORANGE} {return new Symbol(ParserSym.ORANGE, yytext());}
{GRAY} {return new Symbol(ParserSym.GRAY, yytext());}
{BLACK} {return new Symbol(ParserSym.BLACK, yytext());}
{PURPLE} {return new Symbol(ParserSym.PURPLE, yytext());}
{GOLDEN} {return new Symbol(ParserSym.GOLDEN, yytext());}

// Type Animations
{CURVE} {return new Symbol(ParserSym.CURVE, yytext());}

// Objects
{CIRCLE} {return new Symbol(ParserSym.CIRCLE, yytext());}
{SQUARE} {return new Symbol(ParserSym.SQUARE, yytext());}
{RECTANGLE} {return new Symbol(ParserSym.RECTANGLE, yytext());}
{LINE} {return new Symbol(ParserSym.LINE, yytext());}
{POLYGON} {return new Symbol(ParserSym.POLYGON, yytext());}

// Comma, numbers and white spaces
{COMMA} {return new Symbol(ParserSym.COMMA, yytext());}
{NUMBER} {return new Symbol(ParserSym.NUMBER, yytext());}
{ID}  {return new Symbol(ParserSym.ID, yytext());}
{WHITESPACES} {/*ignore*/}

//Errors
[^]                      {/*addError(yytext());*/}

}