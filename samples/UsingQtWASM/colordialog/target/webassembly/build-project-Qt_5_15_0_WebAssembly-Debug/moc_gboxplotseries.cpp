/****************************************************************************
** Meta object code from reading C++ file 'gboxplotseries.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gboxplotseries.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gboxplotseries.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GBoxPlotSeries_t {
    QByteArrayData data[14];
    char stringdata0[220];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GBoxPlotSeries_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GBoxPlotSeries_t qt_meta_stringdata_GBoxPlotSeries = {
    {
QT_MOC_LITERAL(0, 0, 14), // "GBoxPlotSeries"
QT_MOC_LITERAL(1, 15, 31), // "boxOutlineVisibilityChangedSlot"
QT_MOC_LITERAL(2, 47, 0), // ""
QT_MOC_LITERAL(3, 48, 19), // "boxWidthChangedSlot"
QT_MOC_LITERAL(4, 68, 16), // "boxsetsAddedSlot"
QT_MOC_LITERAL(5, 85, 18), // "boxsetsRemovedSlot"
QT_MOC_LITERAL(6, 104, 16), // "brushChangedSlot"
QT_MOC_LITERAL(7, 121, 11), // "clickedSlot"
QT_MOC_LITERAL(8, 133, 16), // "countChangedSlot"
QT_MOC_LITERAL(9, 150, 17), // "doubleClickedSlot"
QT_MOC_LITERAL(10, 168, 11), // "hoveredSlot"
QT_MOC_LITERAL(11, 180, 14), // "penChangedSlot"
QT_MOC_LITERAL(12, 195, 11), // "pressedSlot"
QT_MOC_LITERAL(13, 207, 12) // "releasedSlot"

    },
    "GBoxPlotSeries\0boxOutlineVisibilityChangedSlot\0"
    "\0boxWidthChangedSlot\0boxsetsAddedSlot\0"
    "boxsetsRemovedSlot\0brushChangedSlot\0"
    "clickedSlot\0countChangedSlot\0"
    "doubleClickedSlot\0hoveredSlot\0"
    "penChangedSlot\0pressedSlot\0releasedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GBoxPlotSeries[] = {

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

void GBoxPlotSeries::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GBoxPlotSeries *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->boxOutlineVisibilityChangedSlot(); break;
        case 1: _t->boxWidthChangedSlot(); break;
        case 2: _t->boxsetsAddedSlot(); break;
        case 3: _t->boxsetsRemovedSlot(); break;
        case 4: _t->brushChangedSlot(); break;
        case 5: _t->clickedSlot(); break;
        case 6: _t->countChangedSlot(); break;
        case 7: _t->doubleClickedSlot(); break;
        case 8: _t->hoveredSlot(); break;
        case 9: _t->penChangedSlot(); break;
        case 10: _t->pressedSlot(); break;
        case 11: _t->releasedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GBoxPlotSeries::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QBoxPlotSeries::staticMetaObject>(),
    qt_meta_stringdata_GBoxPlotSeries.data,
    qt_meta_data_GBoxPlotSeries,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GBoxPlotSeries::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GBoxPlotSeries::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GBoxPlotSeries.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QBoxPlotSeries::qt_metacast(_clname);
}

int GBoxPlotSeries::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QBoxPlotSeries::qt_metacall(_c, _id, _a);
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
