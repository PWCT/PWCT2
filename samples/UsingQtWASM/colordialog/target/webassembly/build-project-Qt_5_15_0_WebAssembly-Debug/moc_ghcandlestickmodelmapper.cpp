/****************************************************************************
** Meta object code from reading C++ file 'ghcandlestickmodelmapper.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/ghcandlestickmodelmapper.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ghcandlestickmodelmapper.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GHCandlestickModelMapper_t {
    QByteArrayData data[9];
    char stringdata0[186];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GHCandlestickModelMapper_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GHCandlestickModelMapper_t qt_meta_stringdata_GHCandlestickModelMapper = {
    {
QT_MOC_LITERAL(0, 0, 24), // "GHCandlestickModelMapper"
QT_MOC_LITERAL(1, 25, 22), // "closeColumnChangedSlot"
QT_MOC_LITERAL(2, 48, 0), // ""
QT_MOC_LITERAL(3, 49, 22), // "firstSetRowChangedSlot"
QT_MOC_LITERAL(4, 72, 21), // "highColumnChangedSlot"
QT_MOC_LITERAL(5, 94, 21), // "lastSetRowChangedSlot"
QT_MOC_LITERAL(6, 116, 20), // "lowColumnChangedSlot"
QT_MOC_LITERAL(7, 137, 21), // "openColumnChangedSlot"
QT_MOC_LITERAL(8, 159, 26) // "timestampColumnChangedSlot"

    },
    "GHCandlestickModelMapper\0"
    "closeColumnChangedSlot\0\0firstSetRowChangedSlot\0"
    "highColumnChangedSlot\0lastSetRowChangedSlot\0"
    "lowColumnChangedSlot\0openColumnChangedSlot\0"
    "timestampColumnChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GHCandlestickModelMapper[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x0a /* Public */,
       3,    0,   50,    2, 0x0a /* Public */,
       4,    0,   51,    2, 0x0a /* Public */,
       5,    0,   52,    2, 0x0a /* Public */,
       6,    0,   53,    2, 0x0a /* Public */,
       7,    0,   54,    2, 0x0a /* Public */,
       8,    0,   55,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GHCandlestickModelMapper::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GHCandlestickModelMapper *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->closeColumnChangedSlot(); break;
        case 1: _t->firstSetRowChangedSlot(); break;
        case 2: _t->highColumnChangedSlot(); break;
        case 3: _t->lastSetRowChangedSlot(); break;
        case 4: _t->lowColumnChangedSlot(); break;
        case 5: _t->openColumnChangedSlot(); break;
        case 6: _t->timestampColumnChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GHCandlestickModelMapper::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QHCandlestickModelMapper::staticMetaObject>(),
    qt_meta_stringdata_GHCandlestickModelMapper.data,
    qt_meta_data_GHCandlestickModelMapper,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GHCandlestickModelMapper::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GHCandlestickModelMapper::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GHCandlestickModelMapper.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QHCandlestickModelMapper::qt_metacast(_clname);
}

int GHCandlestickModelMapper::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QHCandlestickModelMapper::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
