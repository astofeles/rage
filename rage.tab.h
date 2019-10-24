/* A Bison parser, made by GNU Bison 3.3.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2019 Free Software Foundation,
   Inc.

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_RAGE_TAB_H_INCLUDED
# define YY_YY_RAGE_TAB_H_INCLUDED
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
    LABEL = 286,
    NUMBER = 287,
    PLUS = 288,
    MINUS = 289,
    DIV = 290,
    MOD = 291,
    MULT = 292,
    POW = 293,
    LEQ = 294,
    GEQ = 295,
    LT = 296,
    GT = 297,
    EQU = 298,
    NEQ = 299,
    OPEN_PAR = 300,
    CLOSE_PAR = 301,
    OPEN_BRACK = 302,
    CLOSE_BRACK = 303,
    OPEN_CURLY = 304,
    CLOSE_CURLY = 305,
    SEMICOL = 306
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

#endif /* !YY_YY_RAGE_TAB_H_INCLUDED  */
