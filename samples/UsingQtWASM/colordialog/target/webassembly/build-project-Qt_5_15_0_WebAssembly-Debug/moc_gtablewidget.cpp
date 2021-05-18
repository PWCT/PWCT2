/****************************************************************************
** Meta object code from reading C++ file 'gtablewidget.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gtablewidget.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gtablewidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GTableWidget_t {
    QByteArrayData data[17];
    char stringdata0[293];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GTableWidget_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GTableWidget_t qt_meta_stringdata_GTableWidget = {
    {
QT_MOC_LITERAL(0, 0, 12), // "GTableWidget"
QT_MOC_LITERAL(1, 13, 17), // "cellActivatedSlot"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 15), // "cellChangedSlot"
QT_MOC_LITERAL(4, 48, 15), // "cellClickedSlot"
QT_MOC_LITERAL(5, 64, 21), // "cellDoubleClickedSlot"
QT_MOC_LITERAL(6, 86, 15), // "cellEnteredSlot"
QT_MOC_LITERAL(7, 102, 15), // "cellPressedSlot"
QT_MOC_LITERAL(8, 118, 22), // "currentCellChangedSlot"
QT_MOC_LITERAL(9, 141, 22), // "currentItemChangedSlot"
QT_MOC_LITERAL(10, 164, 17), // "itemActivatedSlot"
QT_MOC_LITERAL(11, 182, 15), // "itemChangedSlot"
QT_MOC_LITERAL(12, 198, 15), // "itemClickedSlot"
QT_MOC_LITERAL(13, 214, 21), // "itemDoubleClickedSlot"
QT_MOC_LITERAL(14, 236, 15), // "itemEnteredSlot"
QT_MOC_LITERAL(15, 252, 15), // "itemPressedSlot"
QT_MOC_LITERAL(16, 268, 24) // "itemSelectionChangedSlot"

    },
    "GTableWidget\0cellActivatedSlot\0\0"
    "cellChangedSlot\0cellClickedSlot\0"
    "cellDoubleClickedSlot\0cellEnteredSlot\0"
    "cellPressedSlot\0currentCellChangedSlot\0"
    "currentItemChangedSlot\0itemActivatedSlot\0"
    "itemChangedSlot\0itemClickedSlot\0"
    "itemDoubleClickedSlot\0itemEnteredSlot\0"
    "itemPressedSlot\0itemSelectionChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GTableWidget[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      15,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   89,    2, 0x0a /* Public */,
       3,    0,   90,    2, 0x0a /* Public */,
       4,    0,   91,    2, 0x0a /* Public */,
       5,    0,   92,    2, 0x0a /* Public */,
       6,    0,   93,    2, 0x0a /* Public */,
       7,    0,   94,    2, 0x0a /* Public */,
       8,    0,   95,    2, 0x0a /* Public */,
       9,    0,   96,    2, 0x0a /* Public */,
      10,    0,   97,    2, 0x0a /* Public */,
      11,    0,   98,    2, 0x0a /* Public */,
      12,    0,   99,    2, 0x0a /* Public */,
      13,    0,  100,    2, 0x0a /* Public */,
      14,    0,  101,    2, 0x0a /* Public */,
      15,    0,  102,    2, 0x0a /* Public */,
      16,    0,  103,    2, 0x0a /* Public */,

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

       0        // eod
};

void GTableWidget::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GTableWidget *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->cellActivatedSlot(); break;
        case 1: _t->cellChangedSlot(); break;
        case 2: _t->cellClickedSlot(); break;
        case 3: _t->cellDoubleClickedSlot(); break;
        case 4: _t->cellEnteredSlot(); break;
        case 5: _t->cellPressedSlot(); break;
        case 6: _t->currentCellChangedSlot(); break;
        case 7: _t->currentItemChangedSlot(); break;
        case 8: _t->itemActivatedSlot(); break;
        case 9: _t->itemChangedSlot(); break;
        case 10: _t->itemClickedSlot(); break;
        case 11: _t->itemDoubleClickedSlot(); break;
        case 12: _t->itemEnteredSlot(); break;
        case 13: _t->itemPressedSlot(); break;
        case 14: _t->itemSelectionChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GTableWidget::staticMetaObject = { {
    QMetaObject::SuperData::link<QTableWidget::staticMetaObject>(),
    qt_meta_stringdata_GTableWidget.data,
    qt_meta_data_GTableWidget,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GTableWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GTableWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GTableWidget.stringdata0))
        return static_cast<void*>(this);
    return QTableWidget::qt_metacast(_clname);
}

int GTableWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QTableWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 15)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 15)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 15;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
