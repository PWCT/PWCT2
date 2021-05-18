/****************************************************************************
** Meta object code from reading C++ file 'gcandlestickset.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gcandlestickset.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gcandlestickset.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GCandlestickSet_t {
    QByteArrayData data[14];
    char stringdata0[201];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GCandlestickSet_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GCandlestickSet_t qt_meta_stringdata_GCandlestickSet = {
    {
QT_MOC_LITERAL(0, 0, 15), // "GCandlestickSet"
QT_MOC_LITERAL(1, 16, 16), // "brushChangedSlot"
QT_MOC_LITERAL(2, 33, 0), // ""
QT_MOC_LITERAL(3, 34, 11), // "clickedSlot"
QT_MOC_LITERAL(4, 46, 16), // "closeChangedSlot"
QT_MOC_LITERAL(5, 63, 17), // "doubleClickedSlot"
QT_MOC_LITERAL(6, 81, 15), // "highChangedSlot"
QT_MOC_LITERAL(7, 97, 11), // "hoveredSlot"
QT_MOC_LITERAL(8, 109, 14), // "lowChangedSlot"
QT_MOC_LITERAL(9, 124, 15), // "openChangedSlot"
QT_MOC_LITERAL(10, 140, 14), // "penChangedSlot"
QT_MOC_LITERAL(11, 155, 11), // "pressedSlot"
QT_MOC_LITERAL(12, 167, 12), // "releasedSlot"
QT_MOC_LITERAL(13, 180, 20) // "timestampChangedSlot"

    },
    "GCandlestickSet\0brushChangedSlot\0\0"
    "clickedSlot\0closeChangedSlot\0"
    "doubleClickedSlot\0highChangedSlot\0"
    "hoveredSlot\0lowChangedSlot\0openChangedSlot\0"
    "penChangedSlot\0pressedSlot\0releasedSlot\0"
    "timestampChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GCandlestickSet[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   74,    2, 0x0a /* Public */,
       3,    0,   75,    2, 0x0a /* Public */,
       4,    0,   76,    2, 0x0a /* Public */,
       5,    0,   77,    2, 0x0a /* Public */,
       6,    0,   78,    2, 0x0a /* Public */,
       7,    0,   79,    2, 0x0a /* Public */,
       8,    0,   80,    2, 0x0a /* Public */,
       9,    0,   81,    2, 0x0a /* Public */,
      10,    0,   82,    2, 0x0a /* Public */,
      11,    0,   83,    2, 0x0a /* Public */,
      12,    0,   84,    2, 0x0a /* Public */,
      13,    0,   85,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GCandlestickSet::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GCandlestickSet *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->brushChangedSlot(); break;
        case 1: _t->clickedSlot(); break;
        case 2: _t->closeChangedSlot(); break;
        case 3: _t->doubleClickedSlot(); break;
        case 4: _t->highChangedSlot(); break;
        case 5: _t->hoveredSlot(); break;
        case 6: _t->lowChangedSlot(); break;
        case 7: _t->openChangedSlot(); break;
        case 8: _t->penChangedSlot(); break;
        case 9: _t->pressedSlot(); break;
        case 10: _t->releasedSlot(); break;
        case 11: _t->timestampChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GCandlestickSet::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QCandlestickSet::staticMetaObject>(),
    qt_meta_stringdata_GCandlestickSet.data,
    qt_meta_data_GCandlestickSet,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GCandlestickSet::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GCandlestickSet::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GCandlestickSet.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QCandlestickSet::qt_metacast(_clname);
}

int GCandlestickSet::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QCandlestickSet::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 12;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
