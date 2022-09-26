%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
	extern int linenum;// use variable linenum from the lex file
	string a; //bgletter
	string b; //suffix
	string c; //suffix
	string d; //bgletter
	int e; //castle;

%}
%union
{
	int value;
	char * str;
}
%token        BLANK CAST DOT   
%token<str>	  BGLETTER SMLETTER LINE CAPTURE
%token<value> DIGITS

%type<value> movement
%type<str> suffix
%%
statements:
		statement statements
		|
		statement
		;
statement:
		movement BGLETTER SMLETTER DIGITS suffix SMLETTER DIGITS BLANK SMLETTER DIGITS suffix SMLETTER DIGITS test
		{
			cout<<"move "<<linenum<<endl;
			a=$2;
			b=$5;
			c=$11;
			if(a=="K")
			{
				if(b=="x")
				{
					cout<<" The white King on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white King on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}
				if(c=="x")
				{
					cout<<" The black pawn on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black pawn on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}
			}
			if(a=="Q")
			{
				if(b=="x")
				{
					cout<<" The white Queen on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Queen on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}	
				if(c=="x")
				{
					cout<<" The black pawn on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black pawn on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}			
			}
			if(a=="R")
			{
				if(b=="x")
				{
					cout<<" The white Rook on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Rook on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}	
				if(c=="x")
				{
					cout<<" The black pawn on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black pawn on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}		
			}
			if(a=="B")
			{
				if(b=="x")
				{
					cout<<" The white Bishop on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Bishop on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}	
				if(c=="x")
				{
					cout<<" The black pawn on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black pawn on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}	
			}
			if(a=="N")
			{
				if(b=="x")
				{
					cout<<" The white Knight on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Knight on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}	
				if(c=="x")
				{
					cout<<" The black pawn on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black pawn on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}	
			}
		}
		|
		movement SMLETTER DIGITS suffix SMLETTER DIGITS BLANK BGLETTER SMLETTER DIGITS suffix SMLETTER DIGITS test
		{
			cout<<"move "<<linenum<<endl;
			a=$8;
			b=$4;
			c=$11;
			if(b=="x")
			{
				cout<<" The white pawn on "<<$2<<$3<<" takes the pawn on "<<$5<<$6<<endl;
			}
			else
			{
				cout<<" white The pawn on "<<$2<<$3<<" moves to "<<$5<<$6<<endl;
			}

			if(a=="K")
			{
				if(c=="x")
				{
					cout<<" The black King on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black King on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}
			}
			if(a=="Q")
			{
				if(c=="x")
				{
					cout<<" The black Queen on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black Queen on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}				
			}
			if(a=="R")
			{
				if(c=="x")
				{
					cout<<" The black Rook on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black Rook on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}		
			}
			if(a=="B")
			{
				if(c=="x")
				{
					cout<<" The black Bishop on "<<$9<<$10<<" takes the pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black Bishop on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}	
			}
			if(a=="N")
			{
				if(c=="x")
				{
					cout<<" The black Knight on "<<$9<<$10<<" takes the  pawn on "<<$12<<$13<<endl;
				}
				else
				{
					cout<<" The black Knight on "<<$9<<$10<<" moves to "<<$12<<$13<<endl;
				}		
			}
		}
		|
		movement SMLETTER DIGITS suffix SMLETTER DIGITS BLANK SMLETTER DIGITS suffix SMLETTER DIGITS test
		{
			cout<<"move "<<linenum<<endl;
	
			b=$4;
			c=$10;
			if(b=="x")
			{
				cout<<" The white pawn on "<<$2<<$3<<" takes the pawn on "<<$5<<$6<<endl;
			}
			else
			{
				cout<<" The white pawn on "<<$2<<$3<<" moves to "<<$5<<$6<<endl;
			}
			if(c=="x")
			{
				cout<<" The black pawn on "<<$8<<$9<<" takes the pawn on "<<$11<<$12<<endl;
			}
			else
			{
				cout<<" The black pawn on "<<$8<<$9<<" moves to "<<$11<<$12<<endl;
			}
		}
		|
		movement BGLETTER SMLETTER DIGITS suffix SMLETTER DIGITS BLANK BGLETTER SMLETTER DIGITS suffix SMLETTER DIGITS test
		{
			cout<<"move "<<linenum<<endl;
			a=$2;
			b=$5;
			c=$9;
			d=$12;
			if(a=="K")
			{
				if(b=="x")
				{
					cout<<" The white King on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white King on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}
			}
			if(a=="Q")
			{
				if(b=="x")
				{
					cout<<" The white Queen on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Queen on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}			
			}
			if(a=="R")
			{
				if(b=="x")
				{
					cout<<" The white Rook on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Rook on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}		
			}
			if(a=="B")
			{
				if(b=="x")
				{
					cout<<" The white Bishop on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Bishop on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}	
			}
			if(a=="N")
			{
				if(b=="x")
				{
					cout<<" The white Knight on "<<$3<<$4<<" takes the pawn on "<<$6<<$7<<endl;
				}
				else
				{
					cout<<" The white Knight on "<<$3<<$4<<" moves to "<<$6<<$7<<endl;
				}	
			}


			if(c=="K")
			{
				if(d=="x")
				{
					cout<<" The black King on "<<$10<<$11<<" takes the pawn on "<<$13<<$14<<endl;
				}
				else
				{
					cout<<" The black King on "<<$10<<$11<<" moves to "<<$13<<$14<<endl;
				}
			}
			if(c=="Q")
			{
				if(d=="x")
				{
					cout<<" The black Queen on "<<$10<<$11<<" takes the pawn on "<<$13<<$14<<endl;
				}
				else
				{
					cout<<" The black Queen on "<<$10<<$11<<" moves to "<<$13<<$14<<endl;
				}			
			}
			if(c=="R")
			{
				if(d=="x")
				{
					cout<<" The black Rook on "<<$10<<$11<<" takes the pawn on "<<$13<<$14<<endl;
				}
				else
				{
					cout<<" The black Rook on "<<$10<<$11<<" moves to "<<$13<<$14<<endl;
				}		
			}
			if(c=="B")
			{
				if(d=="x")
				{
					cout<<" The black Bishop on "<<$10<<$11<<" takes the pawn on "<<$13<<$14<<endl;
				}
				else
				{
					cout<<" The black Bishop on "<<$10<<$11<<" moves to "<<$13<<$14<<endl;
				}	
			}
			if(c=="N")
			{
				if(d=="x")
				{
					cout<<" The black Knight on "<<$10<<$11<<" takes the pawn on "<<$13<<$14<<endl;
				}
				else
				{
					cout<<" The black Knight on "<<$10<<$11<<" moves to "<<$13<<$14<<endl;
				}	
			}
		}
		|
		movement castle BLANK BGLETTER SMLETTER DIGITS suffix SMLETTER DIGITS test
		{
			cout<<"move "<<linenum<<endl;
			a=$4;
			b=$7;
			if(e==1)
			{
				cout<<" The white is castling to "<<" King's side "<<endl;
			}
			else
			{
				cout<<" The white is castling to "<<" Queens's side "<<endl;
			}
			if(a=="K")
			{
				if(b=="x")
				{
					cout<<" The black King on "<<$5<<$6<<" takes the pawn on "<<$8<<$9<<endl;
				}
				else
				{
					cout<<" The black King on "<<$5<<$6<<" moves to "<<$8<<$9<<endl;
				}
			}
			if(a=="Q")
			{
				if(b=="x")
				{
					cout<<" The black Queen on "<<$5<<$6<<" takes the pawn on "<<$8<<$9<<endl;
				}
				else
				{
					cout<<" The black Quenn on "<<$5<<$6<<" moves to "<<$8<<$9<<endl;
				}			
			}
			if(a=="R")
			{
				if(b=="x")
				{
					cout<<" The black Rook on "<<$5<<$6<<" takes the pawn on "<<$8<<$9<<endl;
				}
				else
				{
					cout<<" The black Rook on "<<$5<<$6<<" moves to "<<$8<<$9<<endl;
				}		
			}
			if(a=="B")
			{
				if(b=="x")
				{
					cout<<" The black Bishop on "<<$5<<$6<<" takes the pawn on "<<$8<<$9<<endl;
				}
				else
				{
					cout<<" The black Bishop on "<<$5<<$6<<" moves to "<<$8<<$9<<endl;
				}	
			}
			if(a=="N")
			{
				if(b=="x")
				{
					cout<<" The black Knight on "<<$5<<$6<<" takes the pawn on "<<$8<<$9<<endl;
				}
				else
				{
					cout<<" The black Knight on "<<$5<<$6<<" moves to "<<$8<<$9<<endl;
				}	
			}

		}
		|
		movement castle BLANK SMLETTER DIGITS suffix SMLETTER DIGITS test
		{
			cout<<"move "<<linenum<<endl;
			c=$6;
			if(e==1)
			{
				cout<<" The white is castling to "<<" King's side "<<endl;
			}
			else
			{
				cout<<" The white is castling to "<<" Queens's side "<<endl;
			}
			if(c=="x")
				{
					cout<<" The black pawn on "<<$4<<$5<<" takes the pawn on "<<$7<<$8<<endl;
				}
				else
				{
					cout<<" The black pawn on "<<$4<<$5<<" moves to "<<$7<<$8<<endl;
				}
		}
		;
suffix:
		LINE
		{
			$$=($1); //????????
		}
		|
		CAPTURE
		{	
			$$=($1); //????????
		}
		;
castle:
		CAST LINE CAST 
		{
			e=1;
		}
		|
		CAST LINE CAST LINE CAST 
		{
			e=0;
		}
		;
movement:
		DIGITS DOT BLANK
		{
			$$=($1);
		}
		;
test:
		BLANK
		|

		;

%%
void yyerror(string s){
	cerr<<"Error at line: "<<linenum<<endl;
}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    /* Call the lexer, then quit. */
    yyin=fopen(argv[1],"r");
    yyparse();
    fclose(yyin);
    return 0;
}