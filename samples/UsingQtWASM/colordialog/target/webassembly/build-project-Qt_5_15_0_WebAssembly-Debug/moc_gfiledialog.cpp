/****************************************************************************
** Meta object code from reading C++ file 'gfiledialog.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/gfiledialog.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'gfiledialog.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GFileDialog_t {
    QByteArrayData data[11];
    char stringdata0[186];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GFileDialog_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GFileDialog_t qt_meta_stringdata_GFileDialog = {
    {
QT_MOC_LITERAL(0, 0, 11), // "GFileDialog"
QT_MOC_LITERAL(1, 12, 18), // "currentChangedSlot"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 21), // "currentUrlChangedSlot"
QT_MOC_LITERAL(4, 54, 20), // "directoryEnteredSlot"
QT_MOC_LITERAL(5, 75, 23), // "directoryUrlEnteredSlot"
QT_MOC_LITERAL(6, 99, 16), // "fileSelectedSlot"
QT_MOC_LITERAL(7, 116, 17), // "filesSelectedSlot"
QT_MOC_LITERAL(8, 134, 18), // "filterSelectedSlot"
QT_MOC_LITERAL(9, 153, 15), // "urlSelectedSlot"
QT_MOC_LITERAL(10, 169, 16) // "urlsSelectedSlot"

    },
    "GFileDialog\0currentChangedSlot\0\0"
    "currentUrlChangedSlot\0directoryEnteredSlot\0"
    "directoryUrlEnteredSlot\0fileSelectedSlot\0"
    "filesSelectedSlot\0filterSelectedSlot\0"
    "urlSelectedSlot\0urlsSelectedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GFileDialog[] = {

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

void GFileDialog::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GFileDialog *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->currentChangedSlot(); break;
        case 1: _t->currentUrlChangedSlot(); break;
        case 2: _t->directoryEnteredSlot(); break;
        case 3: _t->directoryUrlEnteredSlot(); break;
        case 4: _t->fileSelectedSlot(); break;
        case 5: _t->filesSelectedSlot(); break;
        case 6: _t->filterSelectedSlot(); break;
        case 7: _t->urlSelectedSlot(); break;
        case 8: _t->urlsSelectedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GFileDialog::staticMetaObject = { {
    QMetaObject::SuperData::link<QFileDialog::staticMetaObject>(),
    qt_meta_stringdata_GFileDialog.data,
    qt_meta_data_GFileDialog,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GFileDialog::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GFileDialog::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GFileDialog.stringdata0))
        return static_cast<void*>(this);
    return QFileDialog::qt_metacast(_clname);
}

int GFileDialog::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QFileDialog::qt_metacall(_c, _id, _a);
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
