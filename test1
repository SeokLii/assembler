#include <stdio.h>
#include <string.h>

/*args[1][256] = "mov";
args[2][256] = "mov";
args[3][256] = "mov";
args[4][256] = "mov";
args[5][256] = "mov";
args[6][256] = "mov";
args[7][256] = "mov";
*/

/*op[1][20] = "%esp,%ecx";
op[2][20] = "-0x4(%ebx), %eax";
op[3][20] = "$0x0, %ebx";
op[4][20] = "$0x0, %edx";
op[5][20] = "$0x1, %ecx";
op[6][20] = "$0x804a01f, %eax";
op[7][20] = "-0x4(%ebx), %eax";*/

int main() {
	
	char op[20] = "mov";
	char args[256] = "%esp,%ecx";
	
	char check_F[100];
	char check_L[100];
	int FCHECKPOINT = 0; //register 1, mem 2, eax 3, imm 4
	int LCHECKPOINT = 0;
	int Fcheck = 0;
	int Lcheck = 0;

	char *mcode;
	mcode = (char*)malloc(sizeof(char) * 20);

	char * ptr = strtok(args, ",");

	strcpy(check_F, ptr);
	printf("%s\n",check_F);
	ptr = strtok(NULL, "");
	strcpy(check_L, ptr);
	printf("%s\n", check_L);
	
	if (op[0] != 'm')
		mcode = "error";
	
	//FIRST CHECK
	if (check_F[0] == '%') 
	{
		if (check_F[1] == 'e' && check_F[2] == 'a' && check_F[3] == 'x')
			FCHECKPOINT = 4;
		else
			FCHECKPOINT = 1;
	}
	else if (check_F[0] == '$')
		FCHECKPOINT = 5;
	
	else if ((check_F[0] == '0' && check_F[1] == 'x')||(check_F[0] == '-' && check_F[1] == '0' && check_F[2] == 'x'))
		{
			for (int i = 0; i < 10; i++)
			{
				if (check_F[i] == '(')
					Fcheck++;
			}
			if (Fcheck == 1)
			{
				FCHECKPOINT = 3;
			}
			else
				FCHECKPOINT = 2;
		 }
	else if(check_F[0] == '(')
		FCHECKPOINT = 3;


	//LAST CHECK
	if (check_L[0] == '%')
	{
		if (check_L[1] == 'e' && check_L[2] == 'a' && check_L[3] == 'x')
			LCHECKPOINT = 4;
		else
			LCHECKPOINT = 1;
	}
	else if (check_L[0] == '$')
		LCHECKPOINT = 5;

	else if ((check_L[0] == '0' && check_L[1] == 'x') || (check_L[0] == '-' && check_L[1] == '0' && check_L[2] == 'x'))
		{
			for (int i = 0; i < 10; i++)
			{
				if (check_L[i] == '(')
					Lcheck++;
			}
			if (Lcheck == 1)
			{
				LCHECKPOINT = 3;
			}
			else
				LCHECKPOINT = 2;
		}
	else if (check_L[0] == '(')
		LCHECKPOINT = 3;
	
	//register 1, mem 2, (%mem) 3, eax 4, imm 5
	//1. register to rsegister 89
	if (FCHECKPOINT == 1 && (LCHECKPOINT == 1|| LCHECKPOINT == 4))
	{
		mcode = "89";
	}
	//2. mem to reg 8b 
	else if (FCHECKPOINT == 3 && (LCHECKPOINT == 1 || LCHECKPOINT == 4))
	{
		mcode = "8b";
	}
	//3. memory to register 8b
	//4. memory to eax a1 ( 0x, -0x)
	else if (FCHECKPOINT == 2 && LCHECKPOINT == 4)
	{
		mcode = "a1";
	}
	//eax to memory a3 ( 0x, -0x)
	else if (FCHECKPOINT == 4 && LCHECKPOINT == 2)
	{
		mcode = "a3";
	}
	//immediater to reg b8
	else if (FCHECKPOINT == 5 && (LCHECKPOINT == 1 || LCHECKPOINT == 4))
	{
		if(check_L[2] == 'a'&& check_L[3] == 'x') mcode = "b8";
		else if (check_L[2] == 'c'&& check_L[3] == 'x') mcode = "b9";
		else if (check_L[2] == 'd'&& check_L[3] == 'x') mcode = "ba";
		else if (check_L[2] == 'b'&& check_L[3] == 'x') mcode = "bb";
		else if (check_L[2] == 's'&& check_L[3] == 'p') mcode = "bc";
		else if (check_L[2] == 'b'&& check_L[3] == 'p') mcode = "bd";
		else if (check_L[2] == 's'&& check_L[3] == 'i') mcode = "be";
		else if (check_L[2] == 'd'&& check_L[3] == 'i') mcode = "bf";
	}
	else
		mcode = "error";

	printf("%s", mcode);
	return 0;
}
