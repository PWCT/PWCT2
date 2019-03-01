/* Copyright (c) 2013-2018 Mahmoud Fayed <msfclipper@yahoo.com> */

#include <QApplication>
#include <QWidget>
#include <QQuickWidget>
#include <QStandardPaths>
#include <QDir>
#include <QFile>
#include <QTextStream>
#include <QUrl>

// Load Ring

extern "C" {
#include "ring.h"
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

int main(int argc, char *argv[])
{
    QApplication a(argc,argv);

    QWidget waiting ;
    waiting.setStyleSheet("background-color:purple;");

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

    QFile oObjectFile(":/pwct.ringo");
    oObjectFile.open(QFile::ReadOnly);
    QTextStream in(&oObjectFile);
    QString cByteCode = in.readAll();
    pRingState->nRingInsideRing = 1 ;
    ring_state_runobjectstring(pRingState,(char *) cByteCode.toStdString().c_str(),"pwct.ringo");

    ring_state_delete(pRingState);

    return 0;

}
