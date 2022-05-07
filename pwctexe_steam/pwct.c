/* Copyright (c) 2022 Mahmoud Fayed <msfclipper@yahoo.com> */
#include "windows.h"
#include "stdio.h"
#include "stdlib.h"
#include "conio.h"
int WINAPI WinMain ( HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd )
{
	SetCurrentDirectory("PWCT");
	// We avoid this solution because it doesn't wait until the execution is done
	// We need to wait so Steam can calucate the usage time
	//ShellExecuteA(NULL, "open", "..\\ring\\bin\\ringw.exe", "pwct.ringo", NULL, 1);
	
	// We avoid this solution because it display the command prompt window
	//system("..\\ring\\bin\\ringw.exe pwct.ringo");
	
	// We apply this solution because it wait for the program + don't display the command prompt
	SHELLEXECUTEINFO ShExecInfo = {0};
	ShExecInfo.cbSize = sizeof(SHELLEXECUTEINFO);
	ShExecInfo.fMask = SEE_MASK_NOCLOSEPROCESS;
	ShExecInfo.hwnd = NULL;
	ShExecInfo.lpVerb = NULL;
	ShExecInfo.lpFile = "..\\ring\\bin\\ringw.exe";        
	ShExecInfo.lpParameters = "pwct.ringo";   
	ShExecInfo.lpDirectory = NULL;
	ShExecInfo.nShow = SW_SHOW;
	ShExecInfo.hInstApp = NULL; 
	ShellExecuteEx(&ShExecInfo);
	WaitForSingleObject(ShExecInfo.hProcess, INFINITE);
	CloseHandle(ShExecInfo.hProcess);
	return 0;
}
