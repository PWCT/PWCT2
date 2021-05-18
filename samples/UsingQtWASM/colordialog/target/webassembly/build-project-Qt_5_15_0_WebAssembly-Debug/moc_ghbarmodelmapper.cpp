/****************************************************************************
** Meta object code from reading C++ file 'ghbarmodelmapper.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/ghbarmodelmapper.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ghbarmodelmapper.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GHBarModelMapper_t {
    QByteArrayData data[8];
    char stringdata0[152];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GHBarModelMapper_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GHBarModelMapper_t qt_meta_stringdata_GHBarModelMapper = {
    {
QT_MOC_LITERAL(0, 0, 16), // "GHBarModelMapper"
QT_MOC_LITERAL(1, 17, 22), // "columnCountChangedSlot"
QT_MOC_LITERAL(2, 40, 0), // ""
QT_MOC_LITERAL(3, 41, 25), // "firstBarSetRowChangedSlot"
QT_MOC_LITERAL(4, 67, 22), // "firstColumnChangedSlot"
QT_MOC_LITERAL(5, 90, 24), // "lastBarSetRowChangedSlot"
QT_MOC_LITERAL(6, 115, 17), // "modelReplacedSlot"
QT_MOC_LITERAL(7, 133, 18) // "seriesReplacedSlot"

    },
    "GHBarModelMapper\0columnCountChangedSlot\0"
    "\0firstBarSetRowChangedSlot\0"
    "firstColumnChangedSlot\0lastBarSetRowChangedSlot\0"
    "modelReplacedSlot\0seriesReplacedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GHBarModelMapper[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x0a /* Public */,
       3,    0,   45,    2, 0x0a /* Public */,
       4,    0,   46,    2, 0x0a /* Public */,
       5,    0,   47,    2, 0x0a /* Public */,
       6,    0,   48,    2, 0x0a /* Public */,
       7,    0,   49,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GHBarModelMapper::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GHBarModelMapper *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->columnCountChangedSlot(); break;
        case 1: _t->firstBarSetRowChangedSlot(); break;
        case 2: _t->firstColumnChangedSlot(); break;
        case 3: _t->lastBarSetRowChangedSlot(); break;
        case 4: _t->modelReplacedSlot(); break;
        case 5: _t->seriesReplacedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GHBarModelMapper::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QHBarModelMapper::staticMetaObject>(),
    qt_meta_stringdata_GHBarModelMapper.data,
    qt_meta_data_GHBarModelMapper,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GHBarModelMapper::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GHBarModelMapper::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GHBarModelMapper.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QHBarModelMapper::qt_metacast(_clname);
}

int GHBarModelMapper::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QHBarModelMapper::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
