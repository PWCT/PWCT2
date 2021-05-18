/****************************************************************************
** Meta object code from reading C++ file 'gtreewidget.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gtreewidget.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gtreewidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GTreeWidget_t {
    QByteArrayData data[20];
    char stringdata0[315];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GTreeWidget_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GTreeWidget_t qt_meta_stringdata_GTreeWidget = {
    {
QT_MOC_LITERAL(0, 0, 11), // "GTreeWidget"
QT_MOC_LITERAL(1, 12, 13), // "collapsedSlot"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 12), // "expandedSlot"
QT_MOC_LITERAL(4, 40, 13), // "activatedSlot"
QT_MOC_LITERAL(5, 54, 11), // "clickedSlot"
QT_MOC_LITERAL(6, 66, 17), // "doubleClickedSlot"
QT_MOC_LITERAL(7, 84, 11), // "enteredSlot"
QT_MOC_LITERAL(8, 96, 11), // "pressedSlot"
QT_MOC_LITERAL(9, 108, 19), // "viewportEnteredSlot"
QT_MOC_LITERAL(10, 128, 22), // "currentItemChangedSlot"
QT_MOC_LITERAL(11, 151, 17), // "itemActivatedSlot"
QT_MOC_LITERAL(12, 169, 15), // "itemChangedSlot"
QT_MOC_LITERAL(13, 185, 15), // "itemClickedSlot"
QT_MOC_LITERAL(14, 201, 17), // "itemCollapsedSlot"
QT_MOC_LITERAL(15, 219, 21), // "itemDoubleClickedSlot"
QT_MOC_LITERAL(16, 241, 15), // "itemEnteredSlot"
QT_MOC_LITERAL(17, 257, 16), // "itemExpandedSlot"
QT_MOC_LITERAL(18, 274, 15), // "itemPressedSlot"
QT_MOC_LITERAL(19, 290, 24) // "itemSelectionChangedSlot"

    },
    "GTreeWidget\0collapsedSlot\0\0expandedSlot\0"
    "activatedSlot\0clickedSlot\0doubleClickedSlot\0"
    "enteredSlot\0pressedSlot\0viewportEnteredSlot\0"
    "currentItemChangedSlot\0itemActivatedSlot\0"
    "itemChangedSlot\0itemClickedSlot\0"
    "itemCollapsedSlot\0itemDoubleClickedSlot\0"
    "itemEnteredSlot\0itemExpandedSlot\0"
    "itemPressedSlot\0itemSelectionChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GTreeWidget[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      18,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,  104,    2, 0x0a /* Public */,
       3,    0,  105,    2, 0x0a /* Public */,
       4,    0,  106,    2, 0x0a /* Public */,
       5,    0,  107,    2, 0x0a /* Public */,
       6,    0,  108,    2, 0x0a /* Public */,
       7,    0,  109,    2, 0x0a /* Public */,
       8,    0,  110,    2, 0x0a /* Public */,
       9,    0,  111,    2, 0x0a /* Public */,
      10,    0,  112,    2, 0x0a /* Public */,
      11,    0,  113,    2, 0x0a /* Public */,
      12,    0,  114,    2, 0x0a /* Public */,
      13,    0,  115,    2, 0x0a /* Public */,
      14,    0,  116,    2, 0x0a /* Public */,
      15,    0,  117,    2, 0x0a /* Public */,
      16,    0,  118,    2, 0x0a /* Public */,
      17,    0,  119,    2, 0x0a /* Public */,
      18,    0,  120,    2, 0x0a /* Public */,
      19,    0,  121,    2, 0x0a /* Public */,

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
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GTreeWidget::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GTreeWidget *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->collapsedSlot(); break;
        case 1: _t->expandedSlot(); break;
        case 2: _t->activatedSlot(); break;
        case 3: _t->clickedSlot(); break;
        case 4: _t->doubleClickedSlot(); break;
        case 5: _t->enteredSlot(); break;
        case 6: _t->pressedSlot(); break;
        case 7: _t->viewportEnteredSlot(); break;
        case 8: _t->currentItemChangedSlot(); break;
        case 9: _t->itemActivatedSlot(); break;
        case 10: _t->itemChangedSlot(); break;
        case 11: _t->itemClickedSlot(); break;
        case 12: _t->itemCollapsedSlot(); break;
        case 13: _t->itemDoubleClickedSlot(); break;
        case 14: _t->itemEnteredSlot(); break;
        case 15: _t->itemExpandedSlot(); break;
        case 16: _t->itemPressedSlot(); break;
        case 17: _t->itemSelectionChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GTreeWidget::staticMetaObject = { {
    QMetaObject::SuperData::link<QTreeWidget::staticMetaObject>(),
    qt_meta_stringdata_GTreeWidget.data,
    qt_meta_data_GTreeWidget,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GTreeWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GTreeWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GTreeWidget.stringdata0))
        return static_cast<void*>(this);
    return QTreeWidget::qt_metacast(_clname);
}

int GTreeWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QTreeWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 18)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 18;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 18)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 18;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
