/****************************************************************************
** Meta object code from reading C++ file 'gabstractbarseries.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gabstractbarseries.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gabstractbarseries.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GAbstractBarSeries_t {
    QByteArrayData data[15];
    char stringdata0[265];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GAbstractBarSeries_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GAbstractBarSeries_t qt_meta_stringdata_GAbstractBarSeries = {
    {
QT_MOC_LITERAL(0, 0, 18), // "GAbstractBarSeries"
QT_MOC_LITERAL(1, 19, 16), // "barsetsAddedSlot"
QT_MOC_LITERAL(2, 36, 0), // ""
QT_MOC_LITERAL(3, 37, 18), // "barsetsRemovedSlot"
QT_MOC_LITERAL(4, 56, 11), // "clickedSlot"
QT_MOC_LITERAL(5, 68, 16), // "countChangedSlot"
QT_MOC_LITERAL(6, 85, 17), // "doubleClickedSlot"
QT_MOC_LITERAL(7, 103, 11), // "hoveredSlot"
QT_MOC_LITERAL(8, 115, 22), // "labelsAngleChangedSlot"
QT_MOC_LITERAL(9, 138, 23), // "labelsFormatChangedSlot"
QT_MOC_LITERAL(10, 162, 25), // "labelsPositionChangedSlot"
QT_MOC_LITERAL(11, 188, 26), // "labelsPrecisionChangedSlot"
QT_MOC_LITERAL(12, 215, 24), // "labelsVisibleChangedSlot"
QT_MOC_LITERAL(13, 240, 11), // "pressedSlot"
QT_MOC_LITERAL(14, 252, 12) // "releasedSlot"

    },
    "GAbstractBarSeries\0barsetsAddedSlot\0"
    "\0barsetsRemovedSlot\0clickedSlot\0"
    "countChangedSlot\0doubleClickedSlot\0"
    "hoveredSlot\0labelsAngleChangedSlot\0"
    "labelsFormatChangedSlot\0"
    "labelsPositionChangedSlot\0"
    "labelsPrecisionChangedSlot\0"
    "labelsVisibleChangedSlot\0pressedSlot\0"
    "releasedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GAbstractBarSeries[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   79,    2, 0x0a /* Public */,
       3,    0,   80,    2, 0x0a /* Public */,
       4,    0,   81,    2, 0x0a /* Public */,
       5,    0,   82,    2, 0x0a /* Public */,
       6,    0,   83,    2, 0x0a /* Public */,
       7,    0,   84,    2, 0x0a /* Public */,
       8,    0,   85,    2, 0x0a /* Public */,
       9,    0,   86,    2, 0x0a /* Public */,
      10,    0,   87,    2, 0x0a /* Public */,
      11,    0,   88,    2, 0x0a /* Public */,
      12,    0,   89,    2, 0x0a /* Public */,
      13,    0,   90,    2, 0x0a /* Public */,
      14,    0,   91,    2, 0x0a /* Public */,

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
    QMetaType::Void,

       0        // eod
};

void GAbstractBarSeries::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GAbstractBarSeries *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->barsetsAddedSlot(); break;
        case 1: _t->barsetsRemovedSlot(); break;
        case 2: _t->clickedSlot(); break;
        case 3: _t->countChangedSlot(); break;
        case 4: _t->doubleClickedSlot(); break;
        case 5: _t->hoveredSlot(); break;
        case 6: _t->labelsAngleChangedSlot(); break;
        case 7: _t->labelsFormatChangedSlot(); break;
        case 8: _t->labelsPositionChangedSlot(); break;
        case 9: _t->labelsPrecisionChangedSlot(); break;
        case 10: _t->labelsVisibleChangedSlot(); break;
        case 11: _t->pressedSlot(); break;
        case 12: _t->releasedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GAbstractBarSeries::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QAbstractBarSeries::staticMetaObject>(),
    qt_meta_stringdata_GAbstractBarSeries.data,
    qt_meta_data_GAbstractBarSeries,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GAbstractBarSeries::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GAbstractBarSeries::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GAbstractBarSeries.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QAbstractBarSeries::qt_metacast(_clname);
}

int GAbstractBarSeries::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QAbstractBarSeries::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 13)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 13;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
