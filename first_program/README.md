
# Process

### In Windows
1. Download and install Dev C++
	Download Embarcadero Dev C++: https://www.bloodshed.net/
2. Download and install flex
	https://gnuwin32.sourceforge.net/packages/flex.htm
3. Download and install bison
	https://gnuwin32.sourceforge.net/packages/bison.htm
4. Copy the path of flex and dev_c++ to environment variables
5. Go to the project (code) folder in explorer and type "cmd" in address bar and press enter
	i.e. open the folder in cmd
5. Compile lex file by flex compiler to get lex.yy.c file
	cmd: flex wordcount.l
6. Compile newly generated lex.yy.c file using gcc
	cmd: gcc lex.yy.c
7. run the newly generated executable
	cmd: a.exe
8. Type your text
9. After completing text input press "Ctrl + z" and hit enter
10. Congrats! You get your result.