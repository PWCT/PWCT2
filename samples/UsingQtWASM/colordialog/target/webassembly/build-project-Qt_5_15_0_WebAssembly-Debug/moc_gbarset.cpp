/****************************************************************************
** Meta object code from reading C++ file 'gbarset.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gbarset.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gbarset.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GBarSet_t {
    QByteArrayData data[18];
    char stringdata0[281];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GBarSet_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GBarSet_t qt_meta_stringdata_GBarSet = {
    {
QT_MOC_LITERAL(0, 0, 7), // "GBarSet"
QT_MOC_LITERAL(1, 8, 22), // "borderColorChangedSlot"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 16), // "brushChangedSlot"
QT_MOC_LITERAL(4, 49, 11), // "clickedSlot"
QT_MOC_LITERAL(5, 61, 16), // "colorChangedSlot"
QT_MOC_LITERAL(6, 78, 17), // "doubleClickedSlot"
QT_MOC_LITERAL(7, 96, 11), // "hoveredSlot"
QT_MOC_LITERAL(8, 108, 21), // "labelBrushChangedSlot"
QT_MOC_LITERAL(9, 130, 16), // "labelChangedSlot"
QT_MOC_LITERAL(10, 147, 21), // "labelColorChangedSlot"
QT_MOC_LITERAL(11, 169, 20), // "labelFontChangedSlot"
QT_MOC_LITERAL(12, 190, 14), // "penChangedSlot"
QT_MOC_LITERAL(13, 205, 11), // "pressedSlot"
QT_MOC_LITERAL(14, 217, 12), // "releasedSlot"
QT_MOC_LITERAL(15, 230, 16), // "valueChangedSlot"
QT_MOC_LITERAL(16, 247, 15), // "valuesAddedSlot"
QT_MOC_LITERAL(17, 263, 17) // "valuesRemovedSlot"

    },
    "GBarSet\0borderColorChangedSlot\0\0"
    "brushChangedSlot\0clickedSlot\0"
    "colorChangedSlot\0doubleClickedSlot\0"
    "hoveredSlot\0labelBrushChangedSlot\0"
    "labelChangedSlot\0labelColorChangedSlot\0"
    "labelFontChangedSlot\0penChangedSlot\0"
    "pressedSlot\0releasedSlot\0valueChangedSlot\0"
    "valuesAddedSlot\0valuesRemovedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GBarSet[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      16,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   94,    2, 0x0a /* Public */,
       3,    0,   95,    2, 0x0a /* Public */,
       4,    0,   96,    2, 0x0a /* Public */,
       5,    0,   97,    2, 0x0a /* Public */,
       6,    0,   98,    2, 0x0a /* Public */,
       7,    0,   99,    2, 0x0a /* Public */,
       8,    0,  100,    2, 0x0a /* Public */,
       9,    0,  101,    2, 0x0a /* Public */,
      10,    0,  102,    2, 0x0a /* Public */,
      11,    0,  103,    2, 0x0a /* Public */,
      12,    0,  104,    2, 0x0a /* Public */,
      13,    0,  105,    2, 0x0a /* Public */,
      14,    0,  106,    2, 0x0a /* Public */,
      15,    0,  107,    2, 0x0a /* Public */,
      16,    0,  108,    2, 0x0a /* Public */,
      17,    0,  109,    2, 0x0a /* Public */,

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
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GBarSet::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GBarSet *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->borderColorChangedSlot(); break;
        case 1: _t->brushChangedSlot(); break;
        case 2: _t->clickedSlot(); break;
        case 3: _t->colorChangedSlot(); break;
        case 4: _t->doubleClickedSlot(); break;
        case 5: _t->hoveredSlot(); break;
        case 6: _t->labelBrushChangedSlot(); break;
        case 7: _t->labelChangedSlot(); break;
        case 8: _t->labelColorChangedSlot(); break;
        case 9: _t->labelFontChangedSlot(); break;
        case 10: _t->penChangedSlot(); break;
        case 11: _t->pressedSlot(); break;
        case 12: _t->releasedSlot(); break;
        case 13: _t->valueChangedSlot(); break;
        case 14: _t->valuesAddedSlot(); break;
        case 15: _t->valuesRemovedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GBarSet::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QBarSet::staticMetaObject>(),
    qt_meta_stringdata_GBarSet.data,
    qt_meta_data_GBarSet,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GBarSet::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GBarSet::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GBarSet.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QBarSet::qt_metacast(_clname);
}

int GBarSet::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QBarSet::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 16)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 16;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
