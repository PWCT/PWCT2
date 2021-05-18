/****************************************************************************
** Meta object code from reading C++ file 'gguiapplication.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gguiapplication.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gguiapplication.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GGuiApplication_t {
    QByteArrayData data[15];
    char stringdata0[318];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GGuiApplication_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GGuiApplication_t qt_meta_stringdata_GGuiApplication = {
    {
QT_MOC_LITERAL(0, 0, 15), // "GGuiApplication"
QT_MOC_LITERAL(1, 16, 33), // "applicationDisplayNameChanged..."
QT_MOC_LITERAL(2, 50, 0), // ""
QT_MOC_LITERAL(3, 51, 27), // "applicationStateChangedSlot"
QT_MOC_LITERAL(4, 79, 21), // "commitDataRequestSlot"
QT_MOC_LITERAL(5, 101, 22), // "focusObjectChangedSlot"
QT_MOC_LITERAL(6, 124, 22), // "focusWindowChangedSlot"
QT_MOC_LITERAL(7, 147, 23), // "fontDatabaseChangedSlot"
QT_MOC_LITERAL(8, 171, 20), // "lastWindowClosedSlot"
QT_MOC_LITERAL(9, 192, 26), // "layoutDirectionChangedSlot"
QT_MOC_LITERAL(10, 219, 18), // "paletteChangedSlot"
QT_MOC_LITERAL(11, 238, 24), // "primaryScreenChangedSlot"
QT_MOC_LITERAL(12, 263, 20), // "saveStateRequestSlot"
QT_MOC_LITERAL(13, 284, 15), // "screenAddedSlot"
QT_MOC_LITERAL(14, 300, 17) // "screenRemovedSlot"

    },
    "GGuiApplication\0applicationDisplayNameChangedSlot\0"
    "\0applicationStateChangedSlot\0"
    "commitDataRequestSlot\0focusObjectChangedSlot\0"
    "focusWindowChangedSlot\0fontDatabaseChangedSlot\0"
    "lastWindowClosedSlot\0layoutDirectionChangedSlot\0"
    "paletteChangedSlot\0primaryScreenChangedSlot\0"
    "saveStateRequestSlot\0screenAddedSlot\0"
    "screenRemovedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GGuiApplication[] = {

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

void GGuiApplication::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GGuiApplication *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->applicationDisplayNameChangedSlot(); break;
        case 1: _t->applicationStateChangedSlot(); break;
        case 2: _t->commitDataRequestSlot(); break;
        case 3: _t->focusObjectChangedSlot(); break;
        case 4: _t->focusWindowChangedSlot(); break;
        case 5: _t->fontDatabaseChangedSlot(); break;
        case 6: _t->lastWindowClosedSlot(); break;
        case 7: _t->layoutDirectionChangedSlot(); break;
        case 8: _t->paletteChangedSlot(); break;
        case 9: _t->primaryScreenChangedSlot(); break;
        case 10: _t->saveStateRequestSlot(); break;
        case 11: _t->screenAddedSlot(); break;
        case 12: _t->screenRemovedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GGuiApplication::staticMetaObject = { {
    QMetaObject::SuperData::link<QGuiApplication::staticMetaObject>(),
    qt_meta_stringdata_GGuiApplication.data,
    qt_meta_data_GGuiApplication,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GGuiApplication::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GGuiApplication::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GGuiApplication.stringdata0))
        return static_cast<void*>(this);
    return QGuiApplication::qt_metacast(_clname);
}

int GGuiApplication::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QGuiApplication::qt_metacall(_c, _id, _a);
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
