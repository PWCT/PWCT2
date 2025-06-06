#/*
#**	Project 	: Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose 	: Load RingPWCT Components
#**	Date 		: 2017.10.02
#**	Author 		: Mahmoud Fayed <msfclipper@yahoo.com>
#*/
C_VPL_NAME = "RingPWCT"
#Load RingPWCT Components
load "accessobject.ring"
load "adddays.ring"
load "additem.ring"
load "and.ring"
load "anonfunc.ring"
load "assert.ring"
load "assignment.ring"
load "basicprogram.ring"
load "binarysearch.ring"
load "braces.ring"
load "callfunc.ring"
load "callfuncbyvariable.ring"
load "callmethod.ring"
load "case.ring"
load "chdir.ring"
load "checkchar.ring"
load "checkdatatype.ring"
load "checkos.ring"
load "class.ring"
load "clock.ring"
load "clockspersecond.ring"
load "comment_header.ring"
load "comment_image.ring"
load "comment_newline.ring"
load "comment_text.ring"
load "confirmmessage.ring"
load "conversion.ring"
load "conversionclass.ring"
load "currentdir.ring"
load "datatypeclass.ring"
load "date.ring"
load "datetimeclass.ring"
load "debugclass.ring"
load "decrement.ring"
load "decrypt.ring"
load "deleteitem.ring"
load "diffdays.ring"
load "division.ring"
load "doagain.ring"
load "download.ring"
load "else.ring"
load "elseif.ring"
load "encrypt.ring"
load "equal.ring"
load "eval.ring"
load "exefilename.ring"
load "exefolder.ring"
load "exit.ring"
load "expression.ring"
load "fileclass.ring"
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
load "getcolordialog.ring"
load "getfolderdialog.ring"
load "getfontdialog.ring"
load "getinput.ring"
load "getlistitem.ring"
load "getlistsize.ring"
load "getobjectattribute.ring"
load "getstringindex.ring"
load "getstringlength.ring"
load "getsubstring.ring"
load "greaterthan.ring"
load "greaterthanorequal.ring"
load "hashtableclass.ring"
load "ifstatement.ring"
load "import.ring"
load "increment.ring"
load "input.ring"
load "inputbox.ring"
load "insertitem.ring"
load "internetclass.ring"
load "lessthan.ring"
load "lessthanorequal.ring"
load "libcurl_easycleanup.ring"
load "libcurl_easyinit.ring"
load "libcurl_easyperform.ring"
load "libcurl_easyperformsilent.ring"
load "libcurl_easysetopt.ring"
load "list2string.ring"
load "listclass.ring"
load "load.ring"
load "loop.ring"
load "lower.ring"
load "math.ring"
load "mathclass.ring"
load "md5.ring"
load "modulus.ring"
load "multiplication.ring"
load "mysqlclass.ring"
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
load "nestedfunc.ring"
load "newaction.ring"
load "newemptylist.ring"
load "newhyperlink.ring"
load "newimage.ring"
load "newlistbyrange.ring"
load "newlistbysize.ring"
load "newmediaplayer.ring"
load "newmenu.ring"
load "newmenubar.ring"
load "newobj.ring"
load "newqapp.ring"
load "newqbuttongroup.ring"
load "newqcheckbox.ring"
load "newqcombobox.ring"
load "newqdateedit.ring"
load "newqdial.ring"
load "newqframe.ring"
load "newqlabel.ring"
load "newqlineedit.ring"
load "newqlistwidget.ring"
load "newqprogressbar.ring"
load "newqpushbutton.ring"
load "newqradiobutton.ring"
load "newqslider.ring"
load "newqspinbox.ring"
load "newqtablewidget.ring"
load "newqtabwidget.ring"
load "newqtextedit.ring"
load "newqtreeview.ring"
load "newqtreevwidget.ring"
load "newqwebview.ring"
load "newqwidget.ring"
load "newseparator.ring"
load "newstatusbar.ring"
load "newtimer.ring"
load "newtoolbar.ring"
load "newvideowidget.ring"
load "not.ring"
load "notequal.ring"
load "numbersandbytes.ring"
load "objectslib.ring"
load "odbcclass.ring"
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
load "openfiledialog.ring"
load "or.ring"
load "package.ring"
load "prevfilename.ring"
load "print.ring"
load "qalleventsclass.ring"
load "qappclass.ring"
load "qcheckboxclass.ring"
load "qcolordialogclass.ring"
load "qcomboboxclass.ring"
load "qdatetimeeditclass.ring"
load "qdesktopwidgetclass.ring"
load "qdialsliderclass.ring"
load "qdockwidgetclass.ring"
load "qfiledialogclass.ring"
load "qfontdialogclass.ring"
load "qframeclass.ring"
load "qhboxlayoutclass.ring"
load "qinputdialogclass.ring"
load "qlabelclass.ring"
load "qlcdnumberclass.ring"
load "qlineeditclass.ring"
load "qlistwidgetclass.ring"
load "qmediaplayerclass.ring"
load "qmessageboxclass.ring"
load "qpainterclass.ring"
load "qpenclass.ring"
load "qpictureclass.ring"
load "qpixmapclass.ring"
load "qprinterclass.ring"
load "qprintpreviewdialogclass.ring"
load "qprogressbarclass.ring"
load "qpushbuttonclass.ring"
load "qradiobuttonclass.ring"
load "qregularexpressionclass.ring"
load "qsliderclass.ring"
load "qspinboxclass.ring"
load "qsqldatabaseclass.ring"
load "qsqlqueryclass.ring"
load "qstatusbarclass.ring"
load "qtablewidgetclass.ring"
load "qtabwidgetclass.ring"
load "qtcpserverclass.ring"
load "qtcpsocketclass.ring"
load "qtexteditclass.ring"
load "qtimerclass.ring"
load "qtoolbarclass.ring"
load "qtreewidgetclass.ring"
load "queueclass.ring"
load "qvboxlayoutclass.ring"
load "qvideowidgetclass.ring"
load "qwebviewclass.ring"
load "qwidgetclass.ring"
load "raise.ring"
load "randbytes.ring"
load "refmeta_addattribute.ring"
load "refmeta_addmethod.ring"
load "refmeta_attributes.ring"
load "refmeta_cfunctions.ring"
load "refmeta_classes.ring"
load "refmeta_classname.ring"
load "refmeta_functions.ring"
load "refmeta_getattribute.ring"
load "refmeta_globals.ring"
load "refmeta_isattribute.ring"
load "refmeta_iscfunction.ring"
load "refmeta_isclass.ring"
load "refmeta_isfunction.ring"
load "refmeta_isglobal.ring"
load "refmeta_islocal.ring"
load "refmeta_ismethod.ring"
load "refmeta_isobject.ring"
load "refmeta_ispackage.ring"
load "refmeta_ispackageclass.ring"
load "refmeta_isprivateattribute.ring"
load "refmeta_isprivatemethod.ring"
load "refmeta_locals.ring"
load "refmeta_mergemethods.ring"
load "refmeta_methods.ring"
load "refmeta_objectid.ring"
load "refmeta_packageclasses.ring"
load "refmeta_packagename.ring"
load "refmeta_packages.ring"
load "refmeta_setattribute.ring"
load "return.ring"
load "reverse.ring"
load "savefiledialog.ring"
load "securityclass.ring"
load "sendemail.ring"
load "setlistitem.ring"
load "setobjectattribute.ring"
load "setstringindex.ring"
load "sha1.ring"
load "sha224.ring"
load "sha256.ring"
load "sha384.ring"
load "sha512.ring"
load "showmessage.ring"
load "shutdown.ring"
load "sortlist.ring"
load "sqliteclass.ring"
load "sqlite_close.ring"
load "sqlite_execute.ring"
load "sqlite_init.ring"
load "sqlite_open.ring"
load "stackclass.ring"
load "stdbaseclass.ring"
load "stdlib_apppath.ring"
load "stdlib_binarydigits.ring"
load "stdlib_capitalized.ring"
load "stdlib_changestring.ring"
load "stdlib_dayofweek.ring"
load "stdlib_direxists.ring"
load "stdlib_endswith.ring"
load "stdlib_epochtime.ring"
load "stdlib_evenorodd.ring"
load "stdlib_factorial.ring"
load "stdlib_factors.ring"
load "stdlib_fibonacci.ring"
load "stdlib_file2list.ring"
load "stdlib_filter.ring"
load "stdlib_fsize.ring"
load "stdlib_gcd.ring"
load "stdlib_getnumber.ring"
load "stdlib_getstring.ring"
load "stdlib_isleapyear.ring"
load "stdlib_ismainsourcefile.ring"
load "stdlib_isprime.ring"
load "stdlib_isspecial.ring"
load "stdlib_isvowel.ring"
load "stdlib_justfilename.ring"
load "stdlib_justfilepath.ring"
load "stdlib_lcm.ring"
load "stdlib_linecount.ring"
load "stdlib_list2file.ring"
load "stdlib_listallfiles.ring"
load "stdlib_makedir.ring"
load "stdlib_map.ring"
load "stdlib_matrixmulti.ring"
load "stdlib_matrixtrans.ring"
load "stdlib_newlist.ring"
load "stdlib_palindrome.ring"
load "stdlib_permutation.ring"
load "stdlib_print.ring"
load "stdlib_print2str.ring"
load "stdlib_prodlist.ring"
load "stdlib_puts.ring"
load "stdlib_readline.ring"
load "stdlib_sign.ring"
load "stdlib_sleep.ring"
load "stdlib_split.ring"
load "stdlib_splitmany.ring"
load "stdlib_startswith.ring"
load "stdlib_substring.ring"
load "stdlib_sumlist.ring"
load "stdlib_systemcmd.ring"
load "stdlib_times.ring"
load "stdlib_trim.ring"
load "string2list.ring"
load "stringclass.ring"
load "stringcompare.ring"
load "stringcopy.ring"
load "stringleft.ring"
load "stringlines.ring"
load "stringright.ring"
load "stringtrim.ring"
load "substringtransform.ring"
load "subtract.ring"
load "sum.ring"
load "swapitems.ring"
load "switch.ring"
load "sysget.ring"
load "system.ring"
load "systemclass.ring"
load "templates.ring"
load "time.ring"
load "timelist.ring"
load "treeclass.ring"
load "trycatch.ring"
load "upper.ring"
load "version.ring"
load "weblib_applicationclass.ring"
load "weblib_bootstrappageclass.ring"
load "weblib_htmlpageclass.ring"
load "weblib_newpage.ring"
load "weblib_newwebobject.ring"
load "weblib_newwebpagesubobject.ring"
load "weblib_pageclass.ring"
load "weblib_scriptfunctionsclass.ring"
load "weblib_startwebapplication.ring"
load "weblib_stylefunctionsclass.ring"
load "weblib_template.ring"
load "weblib_webpageclass.ring"
load "whileloop.ring"
load "windowcontroller.ring"
load "windowsnl.ring"
#Add components to the Components list
cComponentsPath = C_CB_COMPONENTSPATH
aComponentsFilesList+(cComponentsPath+"accessobject.ring")
aComponentsFilesList+(cComponentsPath+"adddays.ring")
aComponentsFilesList+(cComponentsPath+"additem.ring")
aComponentsFilesList+(cComponentsPath+"and.ring")
aComponentsFilesList+(cComponentsPath+"anonfunc.ring")
aComponentsFilesList+(cComponentsPath+"assert.ring")
aComponentsFilesList+(cComponentsPath+"assignment.ring")
aComponentsFilesList+(cComponentsPath+"basicprogram.ring")
aComponentsFilesList+(cComponentsPath+"binarysearch.ring")
aComponentsFilesList+(cComponentsPath+"braces.ring")
aComponentsFilesList+(cComponentsPath+"callfunc.ring")
aComponentsFilesList+(cComponentsPath+"callfuncbyvariable.ring")
aComponentsFilesList+(cComponentsPath+"callmethod.ring")
aComponentsFilesList+(cComponentsPath+"case.ring")
aComponentsFilesList+(cComponentsPath+"chdir.ring")
aComponentsFilesList+(cComponentsPath+"checkchar.ring")
aComponentsFilesList+(cComponentsPath+"checkdatatype.ring")
aComponentsFilesList+(cComponentsPath+"checkos.ring")
aComponentsFilesList+(cComponentsPath+"class.ring")
aComponentsFilesList+(cComponentsPath+"clock.ring")
aComponentsFilesList+(cComponentsPath+"clockspersecond.ring")
aComponentsFilesList+(cComponentsPath+"comment_header.ring")
aComponentsFilesList+(cComponentsPath+"comment_image.ring")
aComponentsFilesList+(cComponentsPath+"comment_newline.ring")
aComponentsFilesList+(cComponentsPath+"comment_text.ring")
aComponentsFilesList+(cComponentsPath+"confirmmessage.ring")
aComponentsFilesList+(cComponentsPath+"conversion.ring")
aComponentsFilesList+(cComponentsPath+"conversionclass.ring")
aComponentsFilesList+(cComponentsPath+"currentdir.ring")
aComponentsFilesList+(cComponentsPath+"datatypeclass.ring")
aComponentsFilesList+(cComponentsPath+"date.ring")
aComponentsFilesList+(cComponentsPath+"datetimeclass.ring")
aComponentsFilesList+(cComponentsPath+"debugclass.ring")
aComponentsFilesList+(cComponentsPath+"decrement.ring")
aComponentsFilesList+(cComponentsPath+"decrypt.ring")
aComponentsFilesList+(cComponentsPath+"deleteitem.ring")
aComponentsFilesList+(cComponentsPath+"diffdays.ring")
aComponentsFilesList+(cComponentsPath+"division.ring")
aComponentsFilesList+(cComponentsPath+"doagain.ring")
aComponentsFilesList+(cComponentsPath+"download.ring")
aComponentsFilesList+(cComponentsPath+"else.ring")
aComponentsFilesList+(cComponentsPath+"elseif.ring")
aComponentsFilesList+(cComponentsPath+"encrypt.ring")
aComponentsFilesList+(cComponentsPath+"equal.ring")
aComponentsFilesList+(cComponentsPath+"eval.ring")
aComponentsFilesList+(cComponentsPath+"exefilename.ring")
aComponentsFilesList+(cComponentsPath+"exefolder.ring")
aComponentsFilesList+(cComponentsPath+"exit.ring")
aComponentsFilesList+(cComponentsPath+"expression.ring")
aComponentsFilesList+(cComponentsPath+"fileclass.ring")
aComponentsFilesList+(cComponentsPath+"filename.ring")
aComponentsFilesList+(cComponentsPath+"file_clearerr.ring")
aComponentsFilesList+(cComponentsPath+"file_close.ring")
aComponentsFilesList+(cComponentsPath+"file_dir.ring")
aComponentsFilesList+(cComponentsPath+"file_feof.ring")
aComponentsFilesList+(cComponentsPath+"file_ferror.ring")
aComponentsFilesList+(cComponentsPath+"file_fexists.ring")
aComponentsFilesList+(cComponentsPath+"file_fflush.ring")
aComponentsFilesList+(cComponentsPath+"file_fgetc.ring")
aComponentsFilesList+(cComponentsPath+"file_fgetpos.ring")
aComponentsFilesList+(cComponentsPath+"file_fgets.ring")
aComponentsFilesList+(cComponentsPath+"file_fopen.ring")
aComponentsFilesList+(cComponentsPath+"file_fputc.ring")
aComponentsFilesList+(cComponentsPath+"file_fputs.ring")
aComponentsFilesList+(cComponentsPath+"file_fread.ring")
aComponentsFilesList+(cComponentsPath+"file_freopen.ring")
aComponentsFilesList+(cComponentsPath+"file_fseek.ring")
aComponentsFilesList+(cComponentsPath+"file_fsetpos.ring")
aComponentsFilesList+(cComponentsPath+"file_ftell.ring")
aComponentsFilesList+(cComponentsPath+"file_fwrite.ring")
aComponentsFilesList+(cComponentsPath+"file_perror.ring")
aComponentsFilesList+(cComponentsPath+"file_read.ring")
aComponentsFilesList+(cComponentsPath+"file_remove.ring")
aComponentsFilesList+(cComponentsPath+"file_rename.ring")
aComponentsFilesList+(cComponentsPath+"file_rewind.ring")
aComponentsFilesList+(cComponentsPath+"file_tempfile.ring")
aComponentsFilesList+(cComponentsPath+"file_tempname.ring")
aComponentsFilesList+(cComponentsPath+"file_ungetc.ring")
aComponentsFilesList+(cComponentsPath+"file_write.ring")
aComponentsFilesList+(cComponentsPath+"finditem.ring")
aComponentsFilesList+(cComponentsPath+"findsubstring.ring")
aComponentsFilesList+(cComponentsPath+"forinloop.ring")
aComponentsFilesList+(cComponentsPath+"forloop.ring")
aComponentsFilesList+(cComponentsPath+"freetyping.ring")
aComponentsFilesList+(cComponentsPath+"func.ring")
aComponentsFilesList+(cComponentsPath+"getchar.ring")
aComponentsFilesList+(cComponentsPath+"getcharsfromstring.ring")
aComponentsFilesList+(cComponentsPath+"getcolordialog.ring")
aComponentsFilesList+(cComponentsPath+"getfolderdialog.ring")
aComponentsFilesList+(cComponentsPath+"getfontdialog.ring")
aComponentsFilesList+(cComponentsPath+"getinput.ring")
aComponentsFilesList+(cComponentsPath+"getlistitem.ring")
aComponentsFilesList+(cComponentsPath+"getlistsize.ring")
aComponentsFilesList+(cComponentsPath+"getobjectattribute.ring")
aComponentsFilesList+(cComponentsPath+"getstringindex.ring")
aComponentsFilesList+(cComponentsPath+"getstringlength.ring")
aComponentsFilesList+(cComponentsPath+"getsubstring.ring")
aComponentsFilesList+(cComponentsPath+"greaterthan.ring")
aComponentsFilesList+(cComponentsPath+"greaterthanorequal.ring")
aComponentsFilesList+(cComponentsPath+"hashtableclass.ring")
aComponentsFilesList+(cComponentsPath+"ifstatement.ring")
aComponentsFilesList+(cComponentsPath+"import.ring")
aComponentsFilesList+(cComponentsPath+"increment.ring")
aComponentsFilesList+(cComponentsPath+"input.ring")
aComponentsFilesList+(cComponentsPath+"inputbox.ring")
aComponentsFilesList+(cComponentsPath+"insertitem.ring")
aComponentsFilesList+(cComponentsPath+"internetclass.ring")
aComponentsFilesList+(cComponentsPath+"lessthan.ring")
aComponentsFilesList+(cComponentsPath+"lessthanorequal.ring")
aComponentsFilesList+(cComponentsPath+"libcurl_easycleanup.ring")
aComponentsFilesList+(cComponentsPath+"libcurl_easyinit.ring")
aComponentsFilesList+(cComponentsPath+"libcurl_easyperform.ring")
aComponentsFilesList+(cComponentsPath+"libcurl_easyperformsilent.ring")
aComponentsFilesList+(cComponentsPath+"libcurl_easysetopt.ring")
aComponentsFilesList+(cComponentsPath+"list2string.ring")
aComponentsFilesList+(cComponentsPath+"listclass.ring")
aComponentsFilesList+(cComponentsPath+"load.ring")
aComponentsFilesList+(cComponentsPath+"loop.ring")
aComponentsFilesList+(cComponentsPath+"lower.ring")
aComponentsFilesList+(cComponentsPath+"math.ring")
aComponentsFilesList+(cComponentsPath+"mathclass.ring")
aComponentsFilesList+(cComponentsPath+"md5.ring")
aComponentsFilesList+(cComponentsPath+"modulus.ring")
aComponentsFilesList+(cComponentsPath+"multiplication.ring")
aComponentsFilesList+(cComponentsPath+"mysqlclass.ring")
aComponentsFilesList+(cComponentsPath+"mysql_autocommit.ring")
aComponentsFilesList+(cComponentsPath+"mysql_close.ring")
aComponentsFilesList+(cComponentsPath+"mysql_columns.ring")
aComponentsFilesList+(cComponentsPath+"mysql_commit.ring")
aComponentsFilesList+(cComponentsPath+"mysql_connect.ring")
aComponentsFilesList+(cComponentsPath+"mysql_error.ring")
aComponentsFilesList+(cComponentsPath+"mysql_escape_string.ring")
aComponentsFilesList+(cComponentsPath+"mysql_info.ring")
aComponentsFilesList+(cComponentsPath+"mysql_init.ring")
aComponentsFilesList+(cComponentsPath+"mysql_insert_id.ring")
aComponentsFilesList+(cComponentsPath+"mysql_next_result.ring")
aComponentsFilesList+(cComponentsPath+"mysql_query.ring")
aComponentsFilesList+(cComponentsPath+"mysql_result.ring")
aComponentsFilesList+(cComponentsPath+"mysql_result2.ring")
aComponentsFilesList+(cComponentsPath+"mysql_rollback.ring")
aComponentsFilesList+(cComponentsPath+"nestedfunc.ring")
aComponentsFilesList+(cComponentsPath+"newaction.ring")
aComponentsFilesList+(cComponentsPath+"newemptylist.ring")
aComponentsFilesList+(cComponentsPath+"newhyperlink.ring")
aComponentsFilesList+(cComponentsPath+"newimage.ring")
aComponentsFilesList+(cComponentsPath+"newlistbyrange.ring")
aComponentsFilesList+(cComponentsPath+"newlistbysize.ring")
aComponentsFilesList+(cComponentsPath+"newmediaplayer.ring")
aComponentsFilesList+(cComponentsPath+"newmenu.ring")
aComponentsFilesList+(cComponentsPath+"newmenubar.ring")
aComponentsFilesList+(cComponentsPath+"newobj.ring")
aComponentsFilesList+(cComponentsPath+"newqapp.ring")
aComponentsFilesList+(cComponentsPath+"newqbuttongroup.ring")
aComponentsFilesList+(cComponentsPath+"newqcheckbox.ring")
aComponentsFilesList+(cComponentsPath+"newqcombobox.ring")
aComponentsFilesList+(cComponentsPath+"newqdateedit.ring")
aComponentsFilesList+(cComponentsPath+"newqdial.ring")
aComponentsFilesList+(cComponentsPath+"newqframe.ring")
aComponentsFilesList+(cComponentsPath+"newqlabel.ring")
aComponentsFilesList+(cComponentsPath+"newqlineedit.ring")
aComponentsFilesList+(cComponentsPath+"newqlistwidget.ring")
aComponentsFilesList+(cComponentsPath+"newqprogressbar.ring")
aComponentsFilesList+(cComponentsPath+"newqpushbutton.ring")
aComponentsFilesList+(cComponentsPath+"newqradiobutton.ring")
aComponentsFilesList+(cComponentsPath+"newqslider.ring")
aComponentsFilesList+(cComponentsPath+"newqspinbox.ring")
aComponentsFilesList+(cComponentsPath+"newqtablewidget.ring")
aComponentsFilesList+(cComponentsPath+"newqtabwidget.ring")
aComponentsFilesList+(cComponentsPath+"newqtextedit.ring")
aComponentsFilesList+(cComponentsPath+"newqtreeview.ring")
aComponentsFilesList+(cComponentsPath+"newqtreevwidget.ring")
aComponentsFilesList+(cComponentsPath+"newqwebview.ring")
aComponentsFilesList+(cComponentsPath+"newqwidget.ring")
aComponentsFilesList+(cComponentsPath+"newseparator.ring")
aComponentsFilesList+(cComponentsPath+"newstatusbar.ring")
aComponentsFilesList+(cComponentsPath+"newtimer.ring")
aComponentsFilesList+(cComponentsPath+"newtoolbar.ring")
aComponentsFilesList+(cComponentsPath+"newvideowidget.ring")
aComponentsFilesList+(cComponentsPath+"not.ring")
aComponentsFilesList+(cComponentsPath+"notequal.ring")
aComponentsFilesList+(cComponentsPath+"numbersandbytes.ring")
aComponentsFilesList+(cComponentsPath+"objectslib.ring")
aComponentsFilesList+(cComponentsPath+"odbcclass.ring")
aComponentsFilesList+(cComponentsPath+"odbc_autocommit.ring")
aComponentsFilesList+(cComponentsPath+"odbc_close.ring")
aComponentsFilesList+(cComponentsPath+"odbc_colcount.ring")
aComponentsFilesList+(cComponentsPath+"odbc_columns.ring")
aComponentsFilesList+(cComponentsPath+"odbc_commit.ring")
aComponentsFilesList+(cComponentsPath+"odbc_connect.ring")
aComponentsFilesList+(cComponentsPath+"odbc_datasources.ring")
aComponentsFilesList+(cComponentsPath+"odbc_disconnect.ring")
aComponentsFilesList+(cComponentsPath+"odbc_drivers.ring")
aComponentsFilesList+(cComponentsPath+"odbc_execute.ring")
aComponentsFilesList+(cComponentsPath+"odbc_fetch.ring")
aComponentsFilesList+(cComponentsPath+"odbc_getdata.ring")
aComponentsFilesList+(cComponentsPath+"odbc_init.ring")
aComponentsFilesList+(cComponentsPath+"odbc_rollback.ring")
aComponentsFilesList+(cComponentsPath+"odbc_tables.ring")
aComponentsFilesList+(cComponentsPath+"openfiledialog.ring")
aComponentsFilesList+(cComponentsPath+"or.ring")
aComponentsFilesList+(cComponentsPath+"package.ring")
aComponentsFilesList+(cComponentsPath+"prevfilename.ring")
aComponentsFilesList+(cComponentsPath+"print.ring")
aComponentsFilesList+(cComponentsPath+"qalleventsclass.ring")
aComponentsFilesList+(cComponentsPath+"qappclass.ring")
aComponentsFilesList+(cComponentsPath+"qcheckboxclass.ring")
aComponentsFilesList+(cComponentsPath+"qcolordialogclass.ring")
aComponentsFilesList+(cComponentsPath+"qcomboboxclass.ring")
aComponentsFilesList+(cComponentsPath+"qdatetimeeditclass.ring")
aComponentsFilesList+(cComponentsPath+"qdesktopwidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"qdialsliderclass.ring")
aComponentsFilesList+(cComponentsPath+"qdockwidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"qfiledialogclass.ring")
aComponentsFilesList+(cComponentsPath+"qfontdialogclass.ring")
aComponentsFilesList+(cComponentsPath+"qframeclass.ring")
aComponentsFilesList+(cComponentsPath+"qhboxlayoutclass.ring")
aComponentsFilesList+(cComponentsPath+"qinputdialogclass.ring")
aComponentsFilesList+(cComponentsPath+"qlabelclass.ring")
aComponentsFilesList+(cComponentsPath+"qlcdnumberclass.ring")
aComponentsFilesList+(cComponentsPath+"qlineeditclass.ring")
aComponentsFilesList+(cComponentsPath+"qlistwidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"qmediaplayerclass.ring")
aComponentsFilesList+(cComponentsPath+"qmessageboxclass.ring")
aComponentsFilesList+(cComponentsPath+"qpainterclass.ring")
aComponentsFilesList+(cComponentsPath+"qpenclass.ring")
aComponentsFilesList+(cComponentsPath+"qpictureclass.ring")
aComponentsFilesList+(cComponentsPath+"qpixmapclass.ring")
aComponentsFilesList+(cComponentsPath+"qprinterclass.ring")
aComponentsFilesList+(cComponentsPath+"qprintpreviewdialogclass.ring")
aComponentsFilesList+(cComponentsPath+"qprogressbarclass.ring")
aComponentsFilesList+(cComponentsPath+"qpushbuttonclass.ring")
aComponentsFilesList+(cComponentsPath+"qradiobuttonclass.ring")
aComponentsFilesList+(cComponentsPath+"qregularexpressionclass.ring")
aComponentsFilesList+(cComponentsPath+"qsliderclass.ring")
aComponentsFilesList+(cComponentsPath+"qspinboxclass.ring")
aComponentsFilesList+(cComponentsPath+"qsqldatabaseclass.ring")
aComponentsFilesList+(cComponentsPath+"qsqlqueryclass.ring")
aComponentsFilesList+(cComponentsPath+"qstatusbarclass.ring")
aComponentsFilesList+(cComponentsPath+"qtablewidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"qtabwidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"qtcpserverclass.ring")
aComponentsFilesList+(cComponentsPath+"qtcpsocketclass.ring")
aComponentsFilesList+(cComponentsPath+"qtexteditclass.ring")
aComponentsFilesList+(cComponentsPath+"qtimerclass.ring")
aComponentsFilesList+(cComponentsPath+"qtoolbarclass.ring")
aComponentsFilesList+(cComponentsPath+"qtreewidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"queueclass.ring")
aComponentsFilesList+(cComponentsPath+"qvboxlayoutclass.ring")
aComponentsFilesList+(cComponentsPath+"qvideowidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"qwebviewclass.ring")
aComponentsFilesList+(cComponentsPath+"qwidgetclass.ring")
aComponentsFilesList+(cComponentsPath+"raise.ring")
aComponentsFilesList+(cComponentsPath+"randbytes.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_addattribute.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_addmethod.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_attributes.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_cfunctions.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_classes.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_classname.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_functions.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_getattribute.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_globals.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_isattribute.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_iscfunction.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_isclass.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_isfunction.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_isglobal.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_islocal.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_ismethod.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_isobject.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_ispackage.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_ispackageclass.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_isprivateattribute.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_isprivatemethod.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_locals.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_mergemethods.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_methods.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_objectid.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_packageclasses.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_packagename.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_packages.ring")
aComponentsFilesList+(cComponentsPath+"refmeta_setattribute.ring")
aComponentsFilesList+(cComponentsPath+"return.ring")
aComponentsFilesList+(cComponentsPath+"reverse.ring")
aComponentsFilesList+(cComponentsPath+"savefiledialog.ring")
aComponentsFilesList+(cComponentsPath+"securityclass.ring")
aComponentsFilesList+(cComponentsPath+"sendemail.ring")
aComponentsFilesList+(cComponentsPath+"setlistitem.ring")
aComponentsFilesList+(cComponentsPath+"setobjectattribute.ring")
aComponentsFilesList+(cComponentsPath+"setstringindex.ring")
aComponentsFilesList+(cComponentsPath+"sha1.ring")
aComponentsFilesList+(cComponentsPath+"sha224.ring")
aComponentsFilesList+(cComponentsPath+"sha256.ring")
aComponentsFilesList+(cComponentsPath+"sha384.ring")
aComponentsFilesList+(cComponentsPath+"sha512.ring")
aComponentsFilesList+(cComponentsPath+"showmessage.ring")
aComponentsFilesList+(cComponentsPath+"shutdown.ring")
aComponentsFilesList+(cComponentsPath+"sortlist.ring")
aComponentsFilesList+(cComponentsPath+"sqliteclass.ring")
aComponentsFilesList+(cComponentsPath+"sqlite_close.ring")
aComponentsFilesList+(cComponentsPath+"sqlite_execute.ring")
aComponentsFilesList+(cComponentsPath+"sqlite_init.ring")
aComponentsFilesList+(cComponentsPath+"sqlite_open.ring")
aComponentsFilesList+(cComponentsPath+"stackclass.ring")
aComponentsFilesList+(cComponentsPath+"stdbaseclass.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_apppath.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_binarydigits.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_capitalized.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_changestring.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_dayofweek.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_direxists.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_endswith.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_epochtime.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_evenorodd.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_factorial.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_factors.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_fibonacci.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_file2list.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_filter.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_fsize.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_gcd.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_getnumber.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_getstring.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_isleapyear.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_ismainsourcefile.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_isprime.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_isspecial.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_isvowel.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_justfilename.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_justfilepath.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_lcm.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_linecount.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_list2file.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_listallfiles.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_makedir.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_map.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_matrixmulti.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_matrixtrans.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_newlist.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_palindrome.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_permutation.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_print.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_print2str.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_prodlist.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_puts.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_readline.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_sign.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_sleep.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_split.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_splitmany.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_startswith.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_substring.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_sumlist.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_systemcmd.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_times.ring")
aComponentsFilesList+(cComponentsPath+"stdlib_trim.ring")
aComponentsFilesList+(cComponentsPath+"string2list.ring")
aComponentsFilesList+(cComponentsPath+"stringclass.ring")
aComponentsFilesList+(cComponentsPath+"stringcompare.ring")
aComponentsFilesList+(cComponentsPath+"stringcopy.ring")
aComponentsFilesList+(cComponentsPath+"stringleft.ring")
aComponentsFilesList+(cComponentsPath+"stringlines.ring")
aComponentsFilesList+(cComponentsPath+"stringright.ring")
aComponentsFilesList+(cComponentsPath+"stringtrim.ring")
aComponentsFilesList+(cComponentsPath+"substringtransform.ring")
aComponentsFilesList+(cComponentsPath+"subtract.ring")
aComponentsFilesList+(cComponentsPath+"sum.ring")
aComponentsFilesList+(cComponentsPath+"swapitems.ring")
aComponentsFilesList+(cComponentsPath+"switch.ring")
aComponentsFilesList+(cComponentsPath+"sysget.ring")
aComponentsFilesList+(cComponentsPath+"system.ring")
aComponentsFilesList+(cComponentsPath+"systemclass.ring")
aComponentsFilesList+(cComponentsPath+"templates.ring")
aComponentsFilesList+(cComponentsPath+"time.ring")
aComponentsFilesList+(cComponentsPath+"timelist.ring")
aComponentsFilesList+(cComponentsPath+"treeclass.ring")
aComponentsFilesList+(cComponentsPath+"trycatch.ring")
aComponentsFilesList+(cComponentsPath+"upper.ring")
aComponentsFilesList+(cComponentsPath+"version.ring")
aComponentsFilesList+(cComponentsPath+"weblib_applicationclass.ring")
aComponentsFilesList+(cComponentsPath+"weblib_bootstrappageclass.ring")
aComponentsFilesList+(cComponentsPath+"weblib_htmlpageclass.ring")
aComponentsFilesList+(cComponentsPath+"weblib_newpage.ring")
aComponentsFilesList+(cComponentsPath+"weblib_newwebobject.ring")
aComponentsFilesList+(cComponentsPath+"weblib_newwebpagesubobject.ring")
aComponentsFilesList+(cComponentsPath+"weblib_pageclass.ring")
aComponentsFilesList+(cComponentsPath+"weblib_scriptfunctionsclass.ring")
aComponentsFilesList+(cComponentsPath+"weblib_startwebapplication.ring")
aComponentsFilesList+(cComponentsPath+"weblib_stylefunctionsclass.ring")
aComponentsFilesList+(cComponentsPath+"weblib_template.ring")
aComponentsFilesList+(cComponentsPath+"weblib_webpageclass.ring")
aComponentsFilesList+(cComponentsPath+"whileloop.ring")
aComponentsFilesList+(cComponentsPath+"windowcontroller.ring")
aComponentsFilesList+(cComponentsPath+"windowsnl.ring")
