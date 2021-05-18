/****************************************************************************
** Meta object code from reading C++ file 'gplaintextedit.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gplaintextedit.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gplaintextedit.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GPlainTextEdit_t {
    QByteArrayData data[11];
    char stringdata0[193];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GPlainTextEdit_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GPlainTextEdit_t qt_meta_stringdata_GPlainTextEdit = {
    {
QT_MOC_LITERAL(0, 0, 14), // "GPlainTextEdit"
QT_MOC_LITERAL(1, 15, 21), // "blockCountChangedSlot"
QT_MOC_LITERAL(2, 37, 0), // ""
QT_MOC_LITERAL(3, 38, 17), // "copyAvailableSlot"
QT_MOC_LITERAL(4, 56, 25), // "cursorPositionChangedSlot"
QT_MOC_LITERAL(5, 82, 23), // "modificationChangedSlot"
QT_MOC_LITERAL(6, 106, 17), // "redoAvailableSlot"
QT_MOC_LITERAL(7, 124, 16), // "selectionChanged"
QT_MOC_LITERAL(8, 141, 15), // "textChangedSlot"
QT_MOC_LITERAL(9, 157, 17), // "undoAvailableSlot"
QT_MOC_LITERAL(10, 175, 17) // "updateRequestSlot"

    },
    "GPlainTextEdit\0blockCountChangedSlot\0"
    "\0copyAvailableSlot\0cursorPositionChangedSlot\0"
    "modificationChangedSlot\0redoAvailableSlot\0"
    "selectionChanged\0textChangedSlot\0"
    "undoAvailableSlot\0updateRequestSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GPlainTextEdit[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x0a /* Public */,
       3,    0,   60,    2, 0x0a /* Public */,
       4,    0,   61,    2, 0x0a /* Public */,
       5,    0,   62,    2, 0x0a /* Public */,
       6,    0,   63,    2, 0x0a /* Public */,
       7,    0,   64,    2, 0x0a /* Public */,
       8,    0,   65,    2, 0x0a /* Public */,
       9,    0,   66,    2, 0x0a /* Public */,
      10,    0,   67,    2, 0x0a /* Public */,

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

       0        // eod
};

void GPlainTextEdit::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GPlainTextEdit *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->blockCountChangedSlot(); break;
        case 1: _t->copyAvailableSlot(); break;
        case 2: _t->cursorPositionChangedSlot(); break;
        case 3: _t->modificationChangedSlot(); break;
        case 4: _t->redoAvailableSlot(); break;
        case 5: _t->selectionChanged(); break;
        case 6: _t->textChangedSlot(); break;
        case 7: _t->undoAvailableSlot(); break;
        case 8: _t->updateRequestSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GPlainTextEdit::staticMetaObject = { {
    QMetaObject::SuperData::link<QPlainTextEdit::staticMetaObject>(),
    qt_meta_stringdata_GPlainTextEdit.data,
    qt_meta_data_GPlainTextEdit,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GPlainTextEdit::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GPlainTextEdit::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GPlainTextEdit.stringdata0))
        return static_cast<void*>(this);
    return QPlainTextEdit::qt_metacast(_clname);
}

int GPlainTextEdit::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QPlainTextEdit::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
