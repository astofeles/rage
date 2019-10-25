/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_ANASIN_H_INCLUDED
# define YY_YY_ANASIN_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    GOTO = 258,
    WHILE = 259,
    IF = 260,
    ELSE = 261,
    SWITCH = 262,
    CASE = 263,
    FOR = 264,
    DO = 265,
    UNTIL = 266,
    RETURN = 267,
    PRINT = 268,
    TCHAR = 269,
    TINT = 270,
    TFLOAT = 271,
    TDOUBLE = 272,
    TSTRING = 273,
    AND = 274,
    OR = 275,
    NOT = 276,
    NAND = 277,
    XOR = 278,
    NOR = 279,
    VSTRING = 280,
    VBOOL = 281,
    LATRIB = 282,
    RATRIB = 283,
    SWAP = 284,
    ID = 285,
    NUMBER = 286,
    PLUS = 287,
    MINUS = 288,
    DIV = 289,
    MOD = 290,
    MULT = 291,
    POW = 292,
    LEQ = 293,
    GEQ = 294,
    LT = 295,
    GT = 296,
    EQU = 297,
    NEQ = 298,
    OPEN_PAR = 299,
    CLOSE_PAR = 300,
    OPEN_BRACK = 301,
    CLOSE_BRACK = 302,
    OPEN_CURLY = 303,
    CLOSE_CURLY = 304,
    SEMICOL = 305,
    COMMA = 306,
    COLLON = 307
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ANASIN_H_INCLUDED  */
