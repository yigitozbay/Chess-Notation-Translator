digit	[0-9]
bletter	[A-Z]
sletter [a-z]
%{
  #include <stdio.h>
  #include <string.h>
  #include "y.tab.h"
  #include <iostream>
  using namespace std;
  int linenum=1;
%}
%%
"." return DOT;
"O"  {yylval.str=strdup(yytext); return CAST;};
"-"  {yylval.str=strdup(yytext); return LINE;}
" "  {yylval.str=strdup(yytext); return BLANK;}
"x"  {yylval.str=strdup(yytext); return CAPTURE;}
{bletter} {yylval.str=strdup(yytext); return BGLETTER;}
{sletter} {yylval.str=strdup(yytext); return SMLETTER;}
{digit}   {yylval.value=atoi(yytext); return DIGITS;}
\n	{linenum++;}
[ \t]+
%%
