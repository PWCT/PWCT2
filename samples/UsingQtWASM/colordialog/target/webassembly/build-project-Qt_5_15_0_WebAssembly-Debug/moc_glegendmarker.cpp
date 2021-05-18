/****************************************************************************
** Meta object code from reading C++ file 'glegendmarker.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../qtproject/ringqt/include/glegendmarker.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'glegendmarker.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_GLegendMarker_t {
    QByteArrayData data[11];
    char stringdata0[162];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_GLegendMarker_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_GLegendMarker_t qt_meta_stringdata_GLegendMarker = {
    {
QT_MOC_LITERAL(0, 0, 13), // "GLegendMarker"
QT_MOC_LITERAL(1, 14, 16), // "brushChangedSlot"
QT_MOC_LITERAL(2, 31, 0), // ""
QT_MOC_LITERAL(3, 32, 11), // "clickedSlot"
QT_MOC_LITERAL(4, 44, 15), // "fontChangedSlot"
QT_MOC_LITERAL(5, 60, 11), // "hoveredSlot"
QT_MOC_LITERAL(6, 72, 21), // "labelBrushChangedSlot"
QT_MOC_LITERAL(7, 94, 16), // "labelChangedSlot"
QT_MOC_LITERAL(8, 111, 14), // "penChangedSlot"
QT_MOC_LITERAL(9, 126, 16), // "shapeChangedSlot"
QT_MOC_LITERAL(10, 143, 18) // "visibleChangedSlot"

    },
    "GLegendMarker\0brushChangedSlot\0\0"
    "clickedSlot\0fontChangedSlot\0hoveredSlot\0"
    "labelBrushChangedSlot\0labelChangedSlot\0"
    "penChangedSlot\0shapeChangedSlot\0"
    "visibleChangedSlot"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_GLegendMarker[] = {

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

void GLegendMarker::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<GLegendMarker *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->brushChangedSlot(); break;
        case 1: _t->clickedSlot(); break;
        case 2: _t->fontChangedSlot(); break;
        case 3: _t->hoveredSlot(); break;
        case 4: _t->labelBrushChangedSlot(); break;
        case 5: _t->labelChangedSlot(); break;
        case 6: _t->penChangedSlot(); break;
        case 7: _t->shapeChangedSlot(); break;
        case 8: _t->visibleChangedSlot(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject GLegendMarker::staticMetaObject = { {
    QMetaObject::SuperData::link<QtCharts::QLegendMarker::staticMetaObject>(),
    qt_meta_stringdata_GLegendMarker.data,
    qt_meta_data_GLegendMarker,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *GLegendMarker::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *GLegendMarker::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_GLegendMarker.stringdata0))
        return static_cast<void*>(this);
    return QtCharts::QLegendMarker::qt_metacast(_clname);
}

int GLegendMarker::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QtCharts::QLegendMarker::qt_metacall(_c, _id, _a);
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
