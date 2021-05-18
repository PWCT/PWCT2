/****************************************************************************
** Meta object code from reading C++ file 'gdial.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gdial.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gdial.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GDial_t {
    QByteArrayData data[8];
    char stringdata0[114];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GDial_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GDial_t qt_meta_stringdata_GDial = {
    {
QT_MOC_LITERAL(0, 0, 5), // "GDial"
QT_MOC_LITERAL(1, 6, 19), // "actionTriggeredSlot"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 16), // "rangeChangedSlot"
QT_MOC_LITERAL(4, 44, 15), // "sliderMovedSlot"
QT_MOC_LITERAL(5, 60, 17), // "sliderPressedSlot"
QT_MOC_LITERAL(6, 78, 18), // "sliderReleasedSlot"
QT_MOC_LITERAL(7, 97, 16) // "valueChangedSlot"

    },
    "GDial\0actionTriggeredSlot\0\0rangeChangedSlot\0"
    "sliderMovedSlot\0sliderPressedSlot\0"
    "sliderReleasedSlot\0valueChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GDial[] = {

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

void GDial::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GDial *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->actionTriggeredSlot(); break;
        case 1: _t->rangeChangedSlot(); break;
        case 2: _t->sliderMovedSlot(); break;
        case 3: _t->sliderPressedSlot(); break;
        case 4: _t->sliderReleasedSlot(); break;
        case 5: _t->valueChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GDial::staticMetaObject = { {
    QMetaObject::SuperData::link<QDial::staticMetaObject>(),
    qt_meta_stringdata_GDial.data,
    qt_meta_data_GDial,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GDial::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GDial::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GDial.stringdata0))
        return static_cast<void*>(this);
    return QDial::qt_metacast(_clname);
}

int GDial::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QDial::qt_metacall(_c, _id, _a);
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
