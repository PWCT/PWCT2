/* Copyright (c) 2013-2024 Mahmoud Fayed <msfclipper@yahoo.com> */

#define RINGFORMOBILE_CLEARSCREEN	0
#define RINGFORMOBILE_WRITERINGOFILE	0

#include <QApplication>
#include <QWidget>
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QTextStream>
#include <QUrl>

#ifdef QT_WEBVIEW_WEBENGINE_BACKEND
	#include <QtWebEngine>
#endif 

// Load Ring

extern "C" {
#include "ring/include/ring.h"
}

#include "ringqt/include/ring_qt.h"

#include "ring/src/rstring.c"
#include "ring/src/ritem.c"
#include "ring/src/ritems.c"
#include "ring/src/rlist.c"
#include "ring/src/scanner.c"
#include "ring/src/parser.c"
#include "ring/src/stmt.c"
#include "ring/src/expr.c"
#include "ring/src/codegen.c"
#include "ring/src/vm.c"
#include "ring/src/vmerror.c"
#include "ring/src/vmeval.c"
#include "ring/src/vmthread.c"
#include "ring/src/vmexpr.c"
#include "ring/src/vmvars.c"
#include "ring/src/vmlists.c"
#include "ring/src/vmfuncs.c"
#include "ring/src/vmoop.c"
#include "ring/src/vmtry.c"
#include "ring/src/vmstr.c"
#include "ring/src/vmjump.c"
#include "ring/src/vmrange.c"
#include "ring/src/vmperf.c"
#include "ring/src/vmexit.c"
#include "ring/src/vmstack.c"
#include "ring/src/vmstate.c"
#include "ring/src/ringapi.c"
#include "ring/src/genlib_e.c"
#include "ring/src/math_e.c"
#include "ring/src/file_e.c"
#include "ring/src/general.c"
#include "ring/src/state.c"
#include "ring/src/meta_e.c"
#include "ring/src/vminfo_e.c"
#include "ring/src/list_e.c"
#include "ring/src/os_e.c"
#include "ring/src/ext.c"
#include "ring/src/hashlib.c"
#include "ring/src/rhtable.c"
#include "ring/src/vmgc.c"
#include "ring/src/objfile.c"

void ringapp_delete_file(QString path,const char *cFile) ;
void ringapp_deleteappfiles(void) ;

int main(int argc, char *argv[])
{

    QApplication a(argc,argv);
	
    #ifdef QT_WEBVIEW_WEBENGINE_BACKEND
	QtWebEngine::initialize();
    #endif
	
    #if RINGFORMOBILE_CLEARSCREEN == 1
    	QWidget waiting ;
    	waiting.setStyleSheet("background-color:black;");
    	waiting.show();
    #endif

    // Create Ring State
    RingState *pRingState;
    pRingState = ring_state_new();

    // Set the application folder
    QString path ;
    path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) ;
    QDir::setCurrent(path);

    #if RINGFORMOBILE_WRITERINGOFILE == 1

    	// Delete the application files
	ringapp_deleteappfiles();

    	// Copy Ring Object File (pwct.ringo) from Resources to Temp Folder
    	QString path2 ;
    	path2 = path+"/pwct.ringo";
    	QFile::copy(":/pwct.ringo",path2);
    	ring_state_runobjectfile(pRingState,"pwct.ringo");
 	
    	// Delete the application files
	ringapp_deleteappfiles();

    #else

	// Run the object file directly from resources	
	QFile oObjectFile(":/pwct.ringo");
	oObjectFile.open(QFile::ReadOnly);
	unsigned int nFileSize = (unsigned int) oObjectFile.size();
        unsigned char *cCode;
        cCode = (unsigned char *) malloc(nFileSize+1);
        memcpy(cCode,oObjectFile.readAll().toStdString().c_str(),nFileSize);
        cCode[nFileSize] = EOF;
        pRingState->nRingInsideRing = 1 ;
        ring_state_runobjectstring(pRingState,(char *) cCode,"pwct.ringo");
        free(cCode);

	
    #endif

    ring_state_delete(pRingState);

    return 0;

}

void ringapp_delete_file(QString path,const char *cFile)
{
    char mytarget[100];
    sprintf(mytarget,"%s/%s",path.toStdString().c_str(),cFile);
    QFile myfile;
    myfile.setFileName(mytarget);
    myfile.setPermissions(QFile::ReadOther | QFile::WriteOther);
    myfile.remove();
}

void ringapp_deleteappfiles(void)
{
    QString path ;
    path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) ;
    QDir::setCurrent(path);
    ringapp_delete_file(path,"pwct.ringo");
}

// Custom functions (See ring/src/ext.c for RING_API_REGISTER usage)

RING_FUNC(ring_loadlib)
{
    // Just a prototype to pass functions calls to loadlib() from Ring Object File
    // We don't need loadlib() because ring_qt.cpp is already embedded in the Qt project
}

RING_FUNC(ring_ismobileqt)
{
    // A function used by RingQt (Appfile() function) to access files using resources
    RING_API_RETNUMBER(1);
}

RING_FUNC(ring_qDebug)
{
    // A function used by RingQt (Appfile() function) to access files using resources
    qDebug( "%s", RING_API_GETSTRING(1) );
}
