%{
	int vow_count = 0;
	int const_count = 0;
%}


%%
[aeiouAEIOU]	{vow_count++;}
[a-zA-Z]		{const_count++;}
%%

int main(){
	printf("Enter the string of vowels and consonants");
	yylex();
	printf("Number of vowels: %d\n", vow_count);
	printf("Number of consonants: %d\n", const_count);
	return 0;
}

int yywrap(){
	return 1;
}