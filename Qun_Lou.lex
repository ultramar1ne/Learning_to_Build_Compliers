/* Run the following line in shell to test fib.min: */
/* flex Qun_Lou.lex && gcc -o lex lex.yy.c -lfl && ./lex <fibonacci.min >> out */

/* 1.Declarations*/
/* global variables/functions*, will be copied to yy.c */
%{ 
#include <stdio.h>
#include <string.h>
%}

/* 2.Definitions */
/* Name some regular expressions.  */
Blank "##".*[\n]|[ \n\t]+
Func	"function"
BeginP	"beginparams"
DIGIT	[0-9]+   

/* 3.Rules*/
/*（patterns）- (actions) */
%%
{Blank}	;	
{Func}		   {printf("FUNCTION\n");}
{BeginP}	      {printf("BEGIN_PARAMS\n");}
"endparams"		{printf("END_PARAMS\n");}
"beginlocals"	{printf("BEGIN_LOCALS\n");}
"endlocals"		{printf("END_LOCALS\n");}
"beginbody"		{printf("BEGIN_BODY\n");}
"endbody"		{printf("END_BODY\n");}
"integer"		{printf("INTEGER\n");}
"array"			{printf("ARRAY\n");}
"enum"         {printf("ENUM\n");}
"of"			   {printf("OF\n");}
"if"			   {printf("IF\n");}
"then"			{printf("THEN\n");}
"endif"			{printf("ENDIF\n");}
"else"			{printf("ELSE\n");}
"while"			{printf("WHILE\n");}
"do"			   {printf("DO\n");}
"beginloop"		{printf("BEGINLOOP\n");}
"endloop"		{printf("ENDLOOP\n");}
"continue"		{printf("CONTINUE\n");}
"read"			{printf("READ\n");}
"write"			{printf("WRITE\n");}
"and"			   {printf("AND\n");}
"or"			   {printf("OR\n");}
"not"			   {printf("NOT\n");}
"true"			{printf("TRUE\n");}
"false"			{printf("FALSE\n");}
"return"		   {printf("RETURN\n");}

"-"		{printf("SUB\n");}
"+"		{printf("ADD\n");}
"*"		{printf("MULT\n");}
"/"		{printf("DIV\n");}
"%"		{printf("MOD\n");}

"=="	{printf("EQ\n");}
"<>"	{printf("NEQ\n");}
"<"	{printf("LT\n");}
">"	{printf("GT\n");}
"<="	{printf("LTE\n");}
">="	{printf("GTE\n");}

[a-zA-Z][_a-zA-Z0-9]*	{ printf("IDENT %s\n", yytext);}
{DIGIT}	               { printf("NUMBER %s\n", yytext);}

";" 	{printf("SEMICOLON\n");}
":" 	{printf("COLON\n");}		
","	{printf("COMMA\n");}
"("	{printf("L_PAREN\n");}
")"	{printf("R_PAREN\n");}
"["	{printf("L_SQUARE_BRACKET\n");}
"]"	{printf("R_SQUARE_BRACKET\n");}	
":="	{printf("ASSIGN\n");}	
.		{printf("Error!!!!\n"); exit(0);}
%%

/* 4.User Subroutines*/
int main(int argc, char ** argv)
{
   yylex();
}

