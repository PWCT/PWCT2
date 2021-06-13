/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose : Import Tool - Main File
**	Date : 2020.02.15
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

load "importfiles.ring"

load "../vsfgenerator/generator.ring"

if isMainSourceFile() {
	ImportFile("input/test11.ring","output/test11.pwct",C_PRINTOUTPUT)
}

