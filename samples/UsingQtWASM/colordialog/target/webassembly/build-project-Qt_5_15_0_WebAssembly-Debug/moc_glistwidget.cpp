/****************************************************************************
** Meta object code from reading C++ file 'glistwidget.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/glistwidget.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'glistwidget.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GListWidget_t {
    QByteArrayData data[12];
    char stringdata0[210];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GListWidget_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GListWidget_t qt_meta_stringdata_GListWidget = {
    {
QT_MOC_LITERAL(0, 0, 11), // "GListWidget"
QT_MOC_LITERAL(1, 12, 22), // "currentItemChangedSlot"
QT_MOC_LITERAL(2, 35, 0), // ""
QT_MOC_LITERAL(3, 36, 21), // "currentRowChangedSlot"
QT_MOC_LITERAL(4, 58, 22), // "currentTextChangedSlot"
QT_MOC_LITERAL(5, 81, 17), // "itemActivatedSlot"
QT_MOC_LITERAL(6, 99, 15), // "itemChangedSlot"
QT_MOC_LITERAL(7, 115, 15), // "itemClickedSlot"
QT_MOC_LITERAL(8, 131, 21), // "itemDoubleClickedSlot"
QT_MOC_LITERAL(9, 153, 15), // "itemEnteredSlot"
QT_MOC_LITERAL(10, 169, 15), // "itemPressedSlot"
QT_MOC_LITERAL(11, 185, 24) // "itemSelectionChangedSlot"

    },
    "GListWidget\0currentItemChangedSlot\0\0"
    "currentRowChangedSlot\0currentTextChangedSlot\0"
    "itemActivatedSlot\0itemChangedSlot\0"
    "itemClickedSlot\0itemDoubleClickedSlot\0"
    "itemEnteredSlot\0itemPressedSlot\0"
    "itemSelectionChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GListWidget[] = {

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
       3,    0,   65,    2, 0x0a /* Public */,
       4,    0,   66,    2, 0x0a /* Public */,
       5,    0,   67,    2, 0x0a /* Public */,
       6,    0,   68,    2, 0x0a /* Public */,
       7,    0,   69,    2, 0x0a /* Public */,
       8,    0,   70,    2, 0x0a /* Public */,
       9,    0,   71,    2, 0x0a /* Public */,
      10,    0,   72,    2, 0x0a /* Public */,
      11,    0,   73,    2, 0x0a /* Public */,

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

       0        // eod
};

void GListWidget::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GListWidget *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->currentItemChangedSlot(); break;
        case 1: _t->currentRowChangedSlot(); break;
        case 2: _t->currentTextChangedSlot(); break;
        case 3: _t->itemActivatedSlot(); break;
        case 4: _t->itemChangedSlot(); break;
        case 5: _t->itemClickedSlot(); break;
        case 6: _t->itemDoubleClickedSlot(); break;
        case 7: _t->itemEnteredSlot(); break;
        case 8: _t->itemPressedSlot(); break;
        case 9: _t->itemSelectionChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GListWidget::staticMetaObject = { {
    QMetaObject::SuperData::link<QListWidget::staticMetaObject>(),
    qt_meta_stringdata_GListWidget.data,
    qt_meta_data_GListWidget,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GListWidget::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GListWidget::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GListWidget.stringdata0))
        return static_cast<void*>(this);
    return QListWidget::qt_metacast(_clname);
}

int GListWidget::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QListWidget::qt_metacall(_c, _id, _a);
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
