/* Copyright (c) 2017 Mahmoud Fayed <msfclipper@yahoo.com> */
#include "windows.h"
#include "stdio.h"
#include "stdlib.h"
#include "conio.h"
int WINAPI WinMain ( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd )
{
	ShellExecuteA(NULL, "open", "ringw.exe", "pwct.ringo arabic", NULL, 1);
	return 0;
}
