/****************************************************************************
** Meta object code from reading C++ file 'gabstractsocket.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gabstractsocket.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gabstractsocket.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GAbstractSocket_t {
    QByteArrayData data[8];
    char stringdata0[121];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GAbstractSocket_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GAbstractSocket_t qt_meta_stringdata_GAbstractSocket = {
    {
QT_MOC_LITERAL(0, 0, 15), // "GAbstractSocket"
QT_MOC_LITERAL(1, 16, 13), // "connectedSlot"
QT_MOC_LITERAL(2, 30, 0), // ""
QT_MOC_LITERAL(3, 31, 16), // "disconnectedSlot"
QT_MOC_LITERAL(4, 48, 9), // "errorSlot"
QT_MOC_LITERAL(5, 58, 13), // "hostFoundSlot"
QT_MOC_LITERAL(6, 72, 31), // "proxyAuthenticationRequiredSlot"
QT_MOC_LITERAL(7, 104, 16) // "stateChangedSlot"

    },
    "GAbstractSocket\0connectedSlot\0\0"
    "disconnectedSlot\0errorSlot\0hostFoundSlot\0"
    "proxyAuthenticationRequiredSlot\0"
    "stateChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GAbstractSocket[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   44,    2, 0x0a /* Public */,
       3,    0,   45,    2, 0x0a /* Public */,
       4,    0,   46,    2, 0x0a /* Public */,
       5,    0,   47,    2, 0x0a /* Public */,
       6,    0,   48,    2, 0x0a /* Public */,
       7,    0,   49,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GAbstractSocket::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GAbstractSocket *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->connectedSlot(); break;
        case 1: _t->disconnectedSlot(); break;
        case 2: _t->errorSlot(); break;
        case 3: _t->hostFoundSlot(); break;
        case 4: _t->proxyAuthenticationRequiredSlot(); break;
        case 5: _t->stateChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GAbstractSocket::staticMetaObject = { {
    QMetaObject::SuperData::link<QAbstractSocket::staticMetaObject>(),
    qt_meta_stringdata_GAbstractSocket.data,
    qt_meta_data_GAbstractSocket,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GAbstractSocket::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GAbstractSocket::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GAbstractSocket.stringdata0))
        return static_cast<void*>(this);
    return QAbstractSocket::qt_metacast(_clname);
}

int GAbstractSocket::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractSocket::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
