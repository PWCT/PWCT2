/****************************************************************************
** Meta object code from reading C++ file 'gtextedit.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gtextedit.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gtextedit.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GTextEdit_t {
    QByteArrayData data[9];
    char stringdata0[153];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GTextEdit_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GTextEdit_t qt_meta_stringdata_GTextEdit = {
    {
QT_MOC_LITERAL(0, 0, 9), // "GTextEdit"
QT_MOC_LITERAL(1, 10, 17), // "copyAvailableSlot"
QT_MOC_LITERAL(2, 28, 0), // ""
QT_MOC_LITERAL(3, 29, 28), // "currentCharFormatChangedSlot"
QT_MOC_LITERAL(4, 58, 25), // "cursorPositionChangedSlot"
QT_MOC_LITERAL(5, 84, 17), // "redoAvailableSlot"
QT_MOC_LITERAL(6, 102, 16), // "selectionChanged"
QT_MOC_LITERAL(7, 119, 15), // "textChangedSlot"
QT_MOC_LITERAL(8, 135, 17) // "undoAvailableSlot"

    },
    "GTextEdit\0copyAvailableSlot\0\0"
    "currentCharFormatChangedSlot\0"
    "cursorPositionChangedSlot\0redoAvailableSlot\0"
    "selectionChanged\0textChangedSlot\0"
    "undoAvailableSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GTextEdit[] = {

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

void GTextEdit::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GTextEdit *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->copyAvailableSlot(); break;
        case 1: _t->currentCharFormatChangedSlot(); break;
        case 2: _t->cursorPositionChangedSlot(); break;
        case 3: _t->redoAvailableSlot(); break;
        case 4: _t->selectionChanged(); break;
        case 5: _t->textChangedSlot(); break;
        case 6: _t->undoAvailableSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GTextEdit::staticMetaObject = { {
    QMetaObject::SuperData::link<QTextEdit::staticMetaObject>(),
    qt_meta_stringdata_GTextEdit.data,
    qt_meta_data_GTextEdit,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GTextEdit::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GTextEdit::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GTextEdit.stringdata0))
        return static_cast<void*>(this);
    return QTextEdit::qt_metacast(_clname);
}

int GTextEdit::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QTextEdit::qt_metacall(_c, _id, _a);
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
