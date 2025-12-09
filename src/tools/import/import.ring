/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Main File
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "importfiles.ring"

load "../vsfgenerator/generator.ring"

lTestFiles = True

if isMainSourceFile() {
	if lTestFiles { 
		ImportFile("input/test18.ring","output/test18.pwct",C_PRINTOUTPUT)
	else 
		? RingCode2PWCT("if x = 3 ? :Three ok")
	}
}

