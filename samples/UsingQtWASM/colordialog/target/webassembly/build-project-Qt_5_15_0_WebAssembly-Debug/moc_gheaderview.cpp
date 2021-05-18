/****************************************************************************
** Meta object code from reading C++ file 'gheaderview.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gheaderview.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gheaderview.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GHeaderView_t {
    QByteArrayData data[13];
    char stringdata0[236];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GHeaderView_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GHeaderView_t qt_meta_stringdata_GHeaderView = {
    {
QT_MOC_LITERAL(0, 0, 11), // "GHeaderView"
QT_MOC_LITERAL(1, 12, 21), // "geometriesChangedSlot"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 18), // "sectionClickedSlot"
QT_MOC_LITERAL(4, 54, 2), // "p1"
QT_MOC_LITERAL(5, 57, 23), // "sectionCountChangedSlot"
QT_MOC_LITERAL(6, 81, 24), // "sectionDoubleClickedSlot"
QT_MOC_LITERAL(7, 106, 18), // "sectionEnteredSlot"
QT_MOC_LITERAL(8, 125, 30), // "sectionHandleDoubleClickedSlot"
QT_MOC_LITERAL(9, 156, 16), // "sectionMovedSlot"
QT_MOC_LITERAL(10, 173, 18), // "sectionPressedSlot"
QT_MOC_LITERAL(11, 192, 18), // "sectionResizedSlot"
QT_MOC_LITERAL(12, 211, 24) // "sortIndicatorChangedSlot"

    },
    "GHeaderView\0geometriesChangedSlot\0\0"
    "sectionClickedSlot\0p1\0sectionCountChangedSlot\0"
    "sectionDoubleClickedSlot\0sectionEnteredSlot\0"
    "sectionHandleDoubleClickedSlot\0"
    "sectionMovedSlot\0sectionPressedSlot\0"
    "sectionResizedSlot\0sortIndicatorChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GHeaderView[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   64,    2, 0x0a /* Public */,
       3,    1,   65,    2, 0x0a /* Public */,
       5,    0,   68,    2, 0x0a /* Public */,
       6,    0,   69,    2, 0x0a /* Public */,
       7,    0,   70,    2, 0x0a /* Public */,
       8,    0,   71,    2, 0x0a /* Public */,
       9,    0,   72,    2, 0x0a /* Public */,
      10,    0,   73,    2, 0x0a /* Public */,
      11,    0,   74,    2, 0x0a /* Public */,
      12,    0,   75,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    4,
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

void GHeaderView::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GHeaderView *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->geometriesChangedSlot(); break;
        case 1: _t->sectionClickedSlot((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->sectionCountChangedSlot(); break;
        case 3: _t->sectionDoubleClickedSlot(); break;
        case 4: _t->sectionEnteredSlot(); break;
        case 5: _t->sectionHandleDoubleClickedSlot(); break;
        case 6: _t->sectionMovedSlot(); break;
        case 7: _t->sectionPressedSlot(); break;
        case 8: _t->sectionResizedSlot(); break;
        case 9: _t->sortIndicatorChangedSlot(); break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject GHeaderView::staticMetaObject = { {
    QMetaObject::SuperData::link<QHeaderView::staticMetaObject>(),
    qt_meta_stringdata_GHeaderView.data,
    qt_meta_data_GHeaderView,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GHeaderView::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GHeaderView::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GHeaderView.stringdata0))
        return static_cast<void*>(this);
    return QHeaderView::qt_metacast(_clname);
}

int GHeaderView::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QHeaderView::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
