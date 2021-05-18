/****************************************************************************
** Meta object code from reading C++ file 'gvalueaxis.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gvalueaxis.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gvalueaxis.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GValueAxis_t {
    QByteArrayData data[11];
    char stringdata0[195];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GValueAxis_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GValueAxis_t qt_meta_stringdata_GValueAxis = {
    {
QT_MOC_LITERAL(0, 0, 10), // "GValueAxis"
QT_MOC_LITERAL(1, 11, 22), // "labelFormatChangedSlot"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 14), // "maxChangedSlot"
QT_MOC_LITERAL(4, 50, 14), // "minChangedSlot"
QT_MOC_LITERAL(5, 65, 25), // "minorTickCountChangedSlot"
QT_MOC_LITERAL(6, 91, 16), // "rangeChangedSlot"
QT_MOC_LITERAL(7, 108, 21), // "tickAnchorChangedSlot"
QT_MOC_LITERAL(8, 130, 20), // "tickCountChangedSlot"
QT_MOC_LITERAL(9, 151, 23), // "tickIntervalChangedSlot"
QT_MOC_LITERAL(10, 175, 19) // "tickTypeChangedSlot"

    },
    "GValueAxis\0labelFormatChangedSlot\0\0"
    "maxChangedSlot\0minChangedSlot\0"
    "minorTickCountChangedSlot\0rangeChangedSlot\0"
    "tickAnchorChangedSlot\0tickCountChangedSlot\0"
    "tickIntervalChangedSlot\0tickTypeChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GValueAxis[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x0a /* Public */,
       3,    0,   60,    2, 0x0a /* Public */,
       4,    0,   61,    2, 0x0a /* Public */,
       5,    0,   62,    2, 0x0a /* Public */,
       6,    0,   63,    2, 0x0a /* Public */,
       7,    0,   64,    2, 0x0a /* Public */,
       8,    0,   65,    2, 0x0a /* Public */,
       9,    0,   66,    2, 0x0a /* Public */,
      10,    0,   67,    2, 0x0a /* Public */,

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

       0        // eod
};

void GValueAxis::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GValueAxis *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->labelFormatChangedSlot(); break;
        case 1: _t->maxChangedSlot(); break;
        case 2: _t->minChangedSlot(); break;
        case 3: _t->minorTickCountChangedSlot(); break;
        case 4: _t->rangeChangedSlot(); break;
        case 5: _t->tickAnchorChangedSlot(); break;
        case 6: _t->tickCountChangedSlot(); break;
        case 7: _t->tickIntervalChangedSlot(); break;
        case 8: _t->tickTypeChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GValueAxis::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QValueAxis::staticMetaObject>(),
    qt_meta_stringdata_GValueAxis.data,
    qt_meta_data_GValueAxis,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GValueAxis::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GValueAxis::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GValueAxis.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QValueAxis::qt_metacast(_clname);
}

int GValueAxis::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QValueAxis::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
