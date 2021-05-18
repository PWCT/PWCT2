/****************************************************************************
** Meta object code from reading C++ file 'gpieseries.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gpieseries.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gpieseries.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GPieSeries_t {
    QByteArrayData data[11];
    char stringdata0[133];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GPieSeries_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GPieSeries_t qt_meta_stringdata_GPieSeries = {
    {
QT_MOC_LITERAL(0, 0, 10), // "GPieSeries"
QT_MOC_LITERAL(1, 11, 9), // "addedSlot"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 11), // "clickedSlot"
QT_MOC_LITERAL(4, 34, 16), // "countChangedSlot"
QT_MOC_LITERAL(5, 51, 17), // "doubleClickedSlot"
QT_MOC_LITERAL(6, 69, 11), // "hoveredSlot"
QT_MOC_LITERAL(7, 81, 11), // "pressedSlot"
QT_MOC_LITERAL(8, 93, 12), // "releasedSlot"
QT_MOC_LITERAL(9, 106, 11), // "removedSlot"
QT_MOC_LITERAL(10, 118, 14) // "sumChangedSlot"

    },
    "GPieSeries\0addedSlot\0\0clickedSlot\0"
    "countChangedSlot\0doubleClickedSlot\0"
    "hoveredSlot\0pressedSlot\0releasedSlot\0"
    "removedSlot\0sumChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GPieSeries[] = {

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

void GPieSeries::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GPieSeries *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->addedSlot(); break;
        case 1: _t->clickedSlot(); break;
        case 2: _t->countChangedSlot(); break;
        case 3: _t->doubleClickedSlot(); break;
        case 4: _t->hoveredSlot(); break;
        case 5: _t->pressedSlot(); break;
        case 6: _t->releasedSlot(); break;
        case 7: _t->removedSlot(); break;
        case 8: _t->sumChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GPieSeries::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QPieSeries::staticMetaObject>(),
    qt_meta_stringdata_GPieSeries.data,
    qt_meta_data_GPieSeries,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GPieSeries::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GPieSeries::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GPieSeries.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QPieSeries::qt_metacast(_clname);
}

int GPieSeries::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QPieSeries::qt_metacall(_c, _id, _a);
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
