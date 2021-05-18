/****************************************************************************
** Meta object code from reading C++ file 'gwindow.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gwindow.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GWindow_t {
    QByteArrayData data[20];
    char stringdata0[383];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GWindow_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GWindow_t qt_meta_stringdata_GWindow = {
    {
QT_MOC_LITERAL(0, 0, 7), // "GWindow"
QT_MOC_LITERAL(1, 8, 17), // "activeChangedSlot"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 29), // "contentOrientationChangedSlot"
QT_MOC_LITERAL(4, 57, 22), // "focusObjectChangedSlot"
QT_MOC_LITERAL(5, 80, 17), // "heightChangedSlot"
QT_MOC_LITERAL(6, 98, 24), // "maximumHeightChangedSlot"
QT_MOC_LITERAL(7, 123, 23), // "maximumWidthChangedSlot"
QT_MOC_LITERAL(8, 147, 24), // "minimumHeightChangedSlot"
QT_MOC_LITERAL(9, 172, 23), // "minimumWidthChangedSlot"
QT_MOC_LITERAL(10, 196, 19), // "modalityChangedSlot"
QT_MOC_LITERAL(11, 216, 18), // "opacityChangedSlot"
QT_MOC_LITERAL(12, 235, 17), // "screenChangedSlot"
QT_MOC_LITERAL(13, 253, 21), // "visibilityChangedSlot"
QT_MOC_LITERAL(14, 275, 18), // "visibleChangedSlot"
QT_MOC_LITERAL(15, 294, 16), // "widthChangedSlot"
QT_MOC_LITERAL(16, 311, 22), // "windowStateChangedSlot"
QT_MOC_LITERAL(17, 334, 22), // "windowTitleChangedSlot"
QT_MOC_LITERAL(18, 357, 12), // "xChangedSlot"
QT_MOC_LITERAL(19, 370, 12) // "yChangedSlot"

    },
    "GWindow\0activeChangedSlot\0\0"
    "contentOrientationChangedSlot\0"
    "focusObjectChangedSlot\0heightChangedSlot\0"
    "maximumHeightChangedSlot\0"
    "maximumWidthChangedSlot\0"
    "minimumHeightChangedSlot\0"
    "minimumWidthChangedSlot\0modalityChangedSlot\0"
    "opacityChangedSlot\0screenChangedSlot\0"
    "visibilityChangedSlot\0visibleChangedSlot\0"
    "widthChangedSlot\0windowStateChangedSlot\0"
    "windowTitleChangedSlot\0xChangedSlot\0"
    "yChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GWindow[] = {

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

void GWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GWindow *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->activeChangedSlot(); break;
        case 1: _t->contentOrientationChangedSlot(); break;
        case 2: _t->focusObjectChangedSlot(); break;
        case 3: _t->heightChangedSlot(); break;
        case 4: _t->maximumHeightChangedSlot(); break;
        case 5: _t->maximumWidthChangedSlot(); break;
        case 6: _t->minimumHeightChangedSlot(); break;
        case 7: _t->minimumWidthChangedSlot(); break;
        case 8: _t->modalityChangedSlot(); break;
        case 9: _t->opacityChangedSlot(); break;
        case 10: _t->screenChangedSlot(); break;
        case 11: _t->visibilityChangedSlot(); break;
        case 12: _t->visibleChangedSlot(); break;
        case 13: _t->widthChangedSlot(); break;
        case 14: _t->windowStateChangedSlot(); break;
        case 15: _t->windowTitleChangedSlot(); break;
        case 16: _t->xChangedSlot(); break;
        case 17: _t->yChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GWindow::staticMetaObject = { {
    QMetaObject::SuperData::link<QWindow::staticMetaObject>(),
    qt_meta_stringdata_GWindow.data,
    qt_meta_data_GWindow,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GWindow.stringdata0))
        return static_cast<void*>(this);
    return QWindow::qt_metacast(_clname);
}

int GWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWindow::qt_metacall(_c, _id, _a);
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
