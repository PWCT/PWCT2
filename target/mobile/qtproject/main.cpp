/* Copyright (c) 2013-2019 Mahmoud Fayed <msfclipper@yahoo.com> */

#define RINGFORMOBILE_WRITERINGOFILE	0
#define RINGFORMOBILE_RINGOFILEASCCODE	1

#include <QApplication>
#include <QWidget>
#include <QQuickWidget>
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
#include "ring.h"
#include "ringappcode.h"
}

#include "ring_qt.h"

#include "ring_string.c"
#include "ring_item.c"
#include "ring_items.c"
#include "ring_list.c"
#include "ring_scanner.c"
#include "ring_parser.c"
#include "ring_stmt.c"
#include "ring_expr.c"
#include "ring_codegen.c"
#include "ring_vm.c"
#include "ring_vmexpr.c"
#include "ring_vmvars.c"
#include "ring_vmlists.c"
#include "ring_vmfuncs.c"
#include "ring_vmoop.c"
#include "ring_vmcui.c"
#include "ring_vmtrycatch.c"
#include "ring_vmstrindex.c"
#include "ring_vmjump.c"
#include "ring_vmduprange.c"
#include "ring_vmperformance.c"
#include "ring_vmexit.c"
#include "ring_vmstackvars.c"
#include "ring_vmstate.c"
#include "ring_api.c"
#include "ring_vmmath.c"
#include "ring_vmfile.c"
#include "ring_state.c"
#include "ring_vmrefmeta.c"
#include "ring_vmlistfuncs.c"
#include "ring_vmos.c"
#include "ring_ext.c"
#include "ring_hashlib.c"
#include "ring_hashtable.c"
#include "ring_vmgc.c"
#include "ring_objfile.c"

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
    qDebug( RING_API_GETSTRING(1) );
}

void ringapp_delete_file(QString path,const char *cFile) ;
void ringapp_deleteappfiles(void) ;

int main(int argc, char *argv[])
{

    QApplication a(argc,argv);

    #ifdef QT_WEBVIEW_WEBENGINE_BACKEND
        QtWebEngine::initialize();
    #endif
	
    QWidget waiting ;

    waiting.setStyleSheet("background: url(:/images/pwctlogo.png) no-repeat center center fixed;");

    waiting.show();
    a.processEvents();

    QString path ;
    path = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) ;
    QDir::setCurrent(path);

    RingState *pRingState;
    pRingState = ring_state_new();
    ring_vm_funcregister("loadlib",ring_loadlib);
    ring_vm_funcregister("ismobileqt",ring_ismobileqt);
    ring_vm_funcregister("qdebug",ring_qDebug);

	#if RINGFORMOBILE_WRITERINGOFILE == 1
	
            // Delete the application files
            ringapp_deleteappfiles();

        	// Copy Ring Object File (ringapp.ringo) from Resources to Temp Folder
        	QString path2 ;
        	path2 = path+"/pwct.ringo";
        	QFile::copy(":/pwct.ringo",path2);
        	ring_state_runobjectfile(pRingState,"pwct.ringo");

        	// Delete the application files
        	ringapp_deleteappfiles();

	#else	
		

        #if RINGFORMOBILE_RINGOFILEASCCODE == 0
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
        #else
                pRingState->argc = argc;
                pRingState->argv = argv;
                pRingState->pRingFilesList = ring_list_new_gc(pRingState,0);
                pRingState->pRingFilesStack = ring_list_new_gc(pRingState,0);
                ring_list_addstring_gc(pRingState,pRingState->pRingFilesList,"pwct.ringo");
                ring_list_addstring_gc(pRingState,pRingState->pRingFilesStack,"pwct.ringo");
                loadRingCode(pRingState);
                ring_objfile_updateclassespointers(pRingState);
                ring_scanner_runprogram(pRingState);
        #endif
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
