/****************************************************************************
** Meta object code from reading C++ file 'gdatetimeaxis.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gdatetimeaxis.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gdatetimeaxis.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GDateTimeAxis_t {
    QByteArrayData data[7];
    char stringdata0[101];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GDateTimeAxis_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GDateTimeAxis_t qt_meta_stringdata_GDateTimeAxis = {
    {
QT_MOC_LITERAL(0, 0, 13), // "GDateTimeAxis"
QT_MOC_LITERAL(1, 14, 17), // "formatChangedSlot"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 14), // "maxChangedSlot"
QT_MOC_LITERAL(4, 48, 14), // "minChangedSlot"
QT_MOC_LITERAL(5, 63, 16), // "rangeChangedSlot"
QT_MOC_LITERAL(6, 80, 20) // "tickCountChangedSlot"

    },
    "GDateTimeAxis\0formatChangedSlot\0\0"
    "maxChangedSlot\0minChangedSlot\0"
    "rangeChangedSlot\0tickCountChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GDateTimeAxis[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x0a /* Public */,
       3,    0,   40,    2, 0x0a /* Public */,
       4,    0,   41,    2, 0x0a /* Public */,
       5,    0,   42,    2, 0x0a /* Public */,
       6,    0,   43,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GDateTimeAxis::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GDateTimeAxis *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->formatChangedSlot(); break;
        case 1: _t->maxChangedSlot(); break;
        case 2: _t->minChangedSlot(); break;
        case 3: _t->rangeChangedSlot(); break;
        case 4: _t->tickCountChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GDateTimeAxis::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QDateTimeAxis::staticMetaObject>(),
    qt_meta_stringdata_GDateTimeAxis.data,
    qt_meta_data_GDateTimeAxis,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GDateTimeAxis::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GDateTimeAxis::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GDateTimeAxis.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QDateTimeAxis::qt_metacast(_clname);
}

int GDateTimeAxis::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QDateTimeAxis::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
