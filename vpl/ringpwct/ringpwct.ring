/*
**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose 	:  Load RingPWCT Components 
**	Date 		: 2017.10.02
**	Author 		:  Mahmoud Fayed <msfclipper@yahoo.com>
*/

# Load RingPWCT Components 

	load "accessobject.ring"
	load "adddays.ring"
	load "additem.ring"
	load "assert.ring"
	load "assignment.ring"
	load "basicprogram.ring"
	load "binarysearch.ring"
	load "braces.ring"
	load "callfunc.ring"
	load "callmethod.ring"
	load "case.ring"
	load "chdir.ring"
	load "checkchar.ring"
	load "checkdatatype.ring"
	load "checkos.ring"
	load "class.ring"
	load "clock.ring"
	load "clockspersecond.ring"
	load "conversion.ring"
	load "currentdir.ring"
	load "date.ring"
	load "decrypt.ring"
	load "deleteitem.ring"
	load "diffdays.ring"
	load "doagain.ring"
	load "download.ring"
	load "else.ring"
	load "elseif.ring"
	load "encrypt.ring"
	load "eval.ring"
	load "exefilename.ring"
	load "exefolder.ring"
	load "exit.ring"
	load "filename.ring"
	load "file_clearerr.ring"
	load "file_close.ring"
	load "file_dir.ring"
	load "file_feof.ring"
	load "file_ferror.ring"
	load "file_fexists.ring"
	load "file_fflush.ring"
	load "file_fgetc.ring"
	load "file_fgetpos.ring"
	load "file_fgets.ring"
	load "file_fopen.ring"
	load "file_fputc.ring"
	load "file_fputs.ring"
	load "file_fread.ring"
	load "file_freopen.ring"
	load "file_fseek.ring"
	load "file_fsetpos.ring"
	load "file_ftell.ring"
	load "file_fwrite.ring"
	load "file_perror.ring"
	load "file_read.ring"
	load "file_remove.ring"
	load "file_rename.ring"
	load "file_rewind.ring"
	load "file_tempfile.ring"
	load "file_tempname.ring"
	load "file_ungetc.ring"
	load "file_write.ring"
	load "finditem.ring"
	load "findsubstring.ring"
	load "forinloop.ring"
	load "forloop.ring"
	load "freetyping.ring"
	load "func.ring"
	load "getchar.ring"
	load "getcharsfromstring.ring"
	load "getinput.ring"
	load "getlistitem.ring"
	load "getlistsize.ring"
	load "getobjectattribute.ring"
	load "getstringindex.ring"
	load "getstringlength.ring"
	load "getsubstring.ring"
	load "ifstatement.ring"
	load "import.ring"
	load "input.ring"
	load "insertitem.ring"
	load "list2string.ring"
	load "load.ring"
	load "loop.ring"
	load "lower.ring"
	load "math.ring"
	load "md5.ring"
	load "mysql_autocommit.ring"
	load "mysql_close.ring"
	load "mysql_columns.ring"
	load "mysql_commit.ring"
	load "mysql_connect.ring"
	load "mysql_error.ring"
	load "mysql_escape_string.ring"
	load "mysql_info.ring"
	load "mysql_init.ring"
	load "mysql_insert_id.ring"
	load "mysql_next_result.ring"
	load "mysql_query.ring"
	load "mysql_result.ring"
	load "mysql_result2.ring"
	load "mysql_rollback.ring"
	load "newemptylist.ring"
	load "newlistbyrange.ring"
	load "newlistbysize.ring"
	load "newobj.ring"
	load "numbersandbytes.ring"
	load "odbc_autocommit.ring"
	load "odbc_close.ring"
	load "odbc_colcount.ring"
	load "odbc_columns.ring"
	load "odbc_commit.ring"
	load "odbc_connect.ring"
	load "odbc_datasources.ring"
	load "odbc_disconnect.ring"
	load "odbc_drivers.ring"
	load "odbc_execute.ring"
	load "odbc_fetch.ring"
	load "odbc_getdata.ring"
	load "odbc_init.ring"
	load "odbc_rollback.ring"
	load "odbc_tables.ring"
	load "package.ring"
	load "prevfilename.ring"
	load "print.ring"
	load "raise.ring"
	load "randbytes.ring"
	load "return.ring"
	load "reverse.ring"
	load "sendemail.ring"
	load "setlistitem.ring"
	load "setobjectattribute.ring"
	load "setstringindex.ring"
	load "sha1.ring"
	load "sha224.ring"
	load "sha256.ring"
	load "sha384.ring"
	load "sha512.ring"
	load "shutdown.ring"
	load "sortlist.ring"
	load "sqlite_close.ring"
	load "sqlite_execute.ring"
	load "sqlite_init.ring"
	load "sqlite_open.ring"
	load "string2list.ring"
	load "stringcompare.ring"
	load "stringcopy.ring"
	load "stringleft.ring"
	load "stringlines.ring"
	load "stringright.ring"
	load "stringtrim.ring"
	load "substringtransform.ring"
	load "swapitems.ring"
	load "switch.ring"
	load "sysget.ring"
	load "system.ring"
	load "time.ring"
	load "timelist.ring"
	load "trycatch.ring"
	load "upper.ring"
	load "version.ring"
	load "whileloop.ring"
	load "windowsnl.ring"
	
# Add components to the Components list 

	cComponentsPath = C_CB_COMPONENTSPATH

	aComponentsFilesList + (cComponentsPath + "accessobject.ring")
	aComponentsFilesList + (cComponentsPath + "adddays.ring")
	aComponentsFilesList + (cComponentsPath + "additem.ring")
	aComponentsFilesList + (cComponentsPath + "assert.ring")
	aComponentsFilesList + (cComponentsPath + "assignment.ring")
	aComponentsFilesList + (cComponentsPath + "basicprogram.ring")
	aComponentsFilesList + (cComponentsPath + "binarysearch.ring")
	aComponentsFilesList + (cComponentsPath + "braces.ring")
	aComponentsFilesList + (cComponentsPath + "callfunc.ring")
	aComponentsFilesList + (cComponentsPath + "callmethod.ring")
	aComponentsFilesList + (cComponentsPath + "case.ring")
	aComponentsFilesList + (cComponentsPath + "chdir.ring")
	aComponentsFilesList + (cComponentsPath + "checkchar.ring")
	aComponentsFilesList + (cComponentsPath + "checkdatatype.ring")
	aComponentsFilesList + (cComponentsPath + "checkos.ring")
	aComponentsFilesList + (cComponentsPath + "class.ring")
	aComponentsFilesList + (cComponentsPath + "clock.ring")
	aComponentsFilesList + (cComponentsPath + "clockspersecond.ring")
	aComponentsFilesList + (cComponentsPath + "conversion.ring")
	aComponentsFilesList + (cComponentsPath + "currentdir.ring")
	aComponentsFilesList + (cComponentsPath + "date.ring")
	aComponentsFilesList + (cComponentsPath + "decrypt.ring")
	aComponentsFilesList + (cComponentsPath + "deleteitem.ring")
	aComponentsFilesList + (cComponentsPath + "diffdays.ring")
	aComponentsFilesList + (cComponentsPath + "doagain.ring")
	aComponentsFilesList + (cComponentsPath + "download.ring")
	aComponentsFilesList + (cComponentsPath + "else.ring")
	aComponentsFilesList + (cComponentsPath + "elseif.ring")
	aComponentsFilesList + (cComponentsPath + "encrypt.ring")
	aComponentsFilesList + (cComponentsPath + "eval.ring")
	aComponentsFilesList + (cComponentsPath + "exefilename.ring")
	aComponentsFilesList + (cComponentsPath + "exefolder.ring")
	aComponentsFilesList + (cComponentsPath + "exit.ring")
	aComponentsFilesList + (cComponentsPath + "filename.ring")
	aComponentsFilesList + (cComponentsPath + "file_clearerr.ring")
	aComponentsFilesList + (cComponentsPath + "file_close.ring")
	aComponentsFilesList + (cComponentsPath + "file_dir.ring")
	aComponentsFilesList + (cComponentsPath + "file_feof.ring")
	aComponentsFilesList + (cComponentsPath + "file_ferror.ring")
	aComponentsFilesList + (cComponentsPath + "file_fexists.ring")
	aComponentsFilesList + (cComponentsPath + "file_fflush.ring")
	aComponentsFilesList + (cComponentsPath + "file_fgetc.ring")
	aComponentsFilesList + (cComponentsPath + "file_fgetpos.ring")
	aComponentsFilesList + (cComponentsPath + "file_fgets.ring")
	aComponentsFilesList + (cComponentsPath + "file_fopen.ring")
	aComponentsFilesList + (cComponentsPath + "file_fputc.ring")
	aComponentsFilesList + (cComponentsPath + "file_fputs.ring")
	aComponentsFilesList + (cComponentsPath + "file_fread.ring")
	aComponentsFilesList + (cComponentsPath + "file_freopen.ring")
	aComponentsFilesList + (cComponentsPath + "file_fseek.ring")
	aComponentsFilesList + (cComponentsPath + "file_fsetpos.ring")
	aComponentsFilesList + (cComponentsPath + "file_ftell.ring")
	aComponentsFilesList + (cComponentsPath + "file_fwrite.ring")
	aComponentsFilesList + (cComponentsPath + "file_perror.ring")
	aComponentsFilesList + (cComponentsPath + "file_read.ring")
	aComponentsFilesList + (cComponentsPath + "file_remove.ring")
	aComponentsFilesList + (cComponentsPath + "file_rename.ring")
	aComponentsFilesList + (cComponentsPath + "file_rewind.ring")
	aComponentsFilesList + (cComponentsPath + "file_tempfile.ring")
	aComponentsFilesList + (cComponentsPath + "file_tempname.ring")
	aComponentsFilesList + (cComponentsPath + "file_ungetc.ring")
	aComponentsFilesList + (cComponentsPath + "file_write.ring")
	aComponentsFilesList + (cComponentsPath + "finditem.ring")
	aComponentsFilesList + (cComponentsPath + "findsubstring.ring")
	aComponentsFilesList + (cComponentsPath + "forinloop.ring")
	aComponentsFilesList + (cComponentsPath + "forloop.ring")
	aComponentsFilesList + (cComponentsPath + "freetyping.ring")
	aComponentsFilesList + (cComponentsPath + "func.ring")
	aComponentsFilesList + (cComponentsPath + "getchar.ring")
	aComponentsFilesList + (cComponentsPath + "getcharsfromstring.ring")
	aComponentsFilesList + (cComponentsPath + "getinput.ring")
	aComponentsFilesList + (cComponentsPath + "getlistitem.ring")
	aComponentsFilesList + (cComponentsPath + "getlistsize.ring")
	aComponentsFilesList + (cComponentsPath + "getobjectattribute.ring")
	aComponentsFilesList + (cComponentsPath + "getstringindex.ring")
	aComponentsFilesList + (cComponentsPath + "getstringlength.ring")
	aComponentsFilesList + (cComponentsPath + "getsubstring.ring")
	aComponentsFilesList + (cComponentsPath + "ifstatement.ring")
	aComponentsFilesList + (cComponentsPath + "import.ring")
	aComponentsFilesList + (cComponentsPath + "input.ring")
	aComponentsFilesList + (cComponentsPath + "insertitem.ring")
	aComponentsFilesList + (cComponentsPath + "list2string.ring")
	aComponentsFilesList + (cComponentsPath + "load.ring")
	aComponentsFilesList + (cComponentsPath + "loop.ring")
	aComponentsFilesList + (cComponentsPath + "lower.ring")
	aComponentsFilesList + (cComponentsPath + "math.ring")
	aComponentsFilesList + (cComponentsPath + "md5.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_autocommit.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_close.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_columns.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_commit.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_connect.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_error.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_escape_string.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_info.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_init.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_insert_id.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_next_result.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_query.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_result.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_result2.ring")
	aComponentsFilesList + (cComponentsPath + "mysql_rollback.ring")
	aComponentsFilesList + (cComponentsPath + "newemptylist.ring")
	aComponentsFilesList + (cComponentsPath + "newlistbyrange.ring")
	aComponentsFilesList + (cComponentsPath + "newlistbysize.ring")
	aComponentsFilesList + (cComponentsPath + "newobj.ring")
	aComponentsFilesList + (cComponentsPath + "numbersandbytes.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_autocommit.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_close.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_colcount.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_columns.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_commit.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_connect.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_datasources.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_disconnect.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_drivers.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_execute.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_fetch.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_getdata.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_init.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_rollback.ring")
	aComponentsFilesList + (cComponentsPath + "odbc_tables.ring")
	aComponentsFilesList + (cComponentsPath + "package.ring")
	aComponentsFilesList + (cComponentsPath + "prevfilename.ring")
	aComponentsFilesList + (cComponentsPath + "print.ring")
	aComponentsFilesList + (cComponentsPath + "raise.ring")
	aComponentsFilesList + (cComponentsPath + "randbytes.ring")
	aComponentsFilesList + (cComponentsPath + "return.ring")
	aComponentsFilesList + (cComponentsPath + "reverse.ring")
	aComponentsFilesList + (cComponentsPath + "sendemail.ring")
	aComponentsFilesList + (cComponentsPath + "setlistitem.ring")
	aComponentsFilesList + (cComponentsPath + "setobjectattribute.ring")
	aComponentsFilesList + (cComponentsPath + "setstringindex.ring")
	aComponentsFilesList + (cComponentsPath + "sha1.ring")
	aComponentsFilesList + (cComponentsPath + "sha224.ring")
	aComponentsFilesList + (cComponentsPath + "sha256.ring")
	aComponentsFilesList + (cComponentsPath + "sha384.ring")
	aComponentsFilesList + (cComponentsPath + "sha512.ring")
	aComponentsFilesList + (cComponentsPath + "shutdown.ring")
	aComponentsFilesList + (cComponentsPath + "sortlist.ring")
	aComponentsFilesList + (cComponentsPath + "sqlite_close.ring")
	aComponentsFilesList + (cComponentsPath + "sqlite_execute.ring")
	aComponentsFilesList + (cComponentsPath + "sqlite_init.ring")
	aComponentsFilesList + (cComponentsPath + "sqlite_open.ring")
	aComponentsFilesList + (cComponentsPath + "string2list.ring")
	aComponentsFilesList + (cComponentsPath + "stringcompare.ring")
	aComponentsFilesList + (cComponentsPath + "stringcopy.ring")
	aComponentsFilesList + (cComponentsPath + "stringleft.ring")
	aComponentsFilesList + (cComponentsPath + "stringlines.ring")
	aComponentsFilesList + (cComponentsPath + "stringright.ring")
	aComponentsFilesList + (cComponentsPath + "stringtrim.ring")
	aComponentsFilesList + (cComponentsPath + "substringtransform.ring")
	aComponentsFilesList + (cComponentsPath + "swapitems.ring")
	aComponentsFilesList + (cComponentsPath + "switch.ring")
	aComponentsFilesList + (cComponentsPath + "sysget.ring")
	aComponentsFilesList + (cComponentsPath + "system.ring")
	aComponentsFilesList + (cComponentsPath + "time.ring")
	aComponentsFilesList + (cComponentsPath + "timelist.ring")
	aComponentsFilesList + (cComponentsPath + "translation")
	aComponentsFilesList + (cComponentsPath + "trycatch.ring")
	aComponentsFilesList + (cComponentsPath + "upper.ring")
	aComponentsFilesList + (cComponentsPath + "version.ring")
	aComponentsFilesList + (cComponentsPath + "whileloop.ring")
	aComponentsFilesList + (cComponentsPath + "windowsnl.ring")
	
