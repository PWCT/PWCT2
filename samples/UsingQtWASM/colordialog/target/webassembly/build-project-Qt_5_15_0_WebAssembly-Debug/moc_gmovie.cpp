/****************************************************************************
** Meta object code from reading C++ file 'gmovie.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gmovie.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gmovie.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GMovie_t {
    QByteArrayData data[9];
    char stringdata0[101];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GMovie_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GMovie_t qt_meta_stringdata_GMovie = {
    {
QT_MOC_LITERAL(0, 0, 6), // "GMovie"
QT_MOC_LITERAL(1, 7, 9), // "errorSlot"
QT_MOC_LITERAL(2, 17, 0), // ""
QT_MOC_LITERAL(3, 18, 12), // "finishedSlot"
QT_MOC_LITERAL(4, 31, 16), // "frameChangedSlot"
QT_MOC_LITERAL(5, 48, 11), // "resizedSlot"
QT_MOC_LITERAL(6, 60, 11), // "startedSlot"
QT_MOC_LITERAL(7, 72, 16), // "stateChangedSlot"
QT_MOC_LITERAL(8, 89, 11) // "updatedSlot"

    },
    "GMovie\0errorSlot\0\0finishedSlot\0"
    "frameChangedSlot\0resizedSlot\0startedSlot\0"
    "stateChangedSlot\0updatedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GMovie[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x0a /* Public */,
       3,    0,   50,    2, 0x0a /* Public */,
       4,    0,   51,    2, 0x0a /* Public */,
       5,    0,   52,    2, 0x0a /* Public */,
       6,    0,   53,    2, 0x0a /* Public */,
       7,    0,   54,    2, 0x0a /* Public */,
       8,    0,   55,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void GMovie::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GMovie *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->errorSlot(); break;
        case 1: _t->finishedSlot(); break;
        case 2: _t->frameChangedSlot(); break;
        case 3: _t->resizedSlot(); break;
        case 4: _t->startedSlot(); break;
        case 5: _t->stateChangedSlot(); break;
        case 6: _t->updatedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GMovie::staticMetaObject = { {
    QMetaObject::SuperData::link<QMovie::staticMetaObject>(),
    qt_meta_stringdata_GMovie.data,
    qt_meta_data_GMovie,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GMovie::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GMovie::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GMovie.stringdata0))
        return static_cast<void*>(this);
    return QMovie::qt_metacast(_clname);
}

int GMovie::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMovie::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
