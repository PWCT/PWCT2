/*
**	Project : Programming Without Coding Technology (PWCT) Version 2.0
**	File Purpose :  qpixmapclass Component
**	Date : 2018.03.18
**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
*/

T_CT_QPIXMAPCLASS_IP_TITLE = "PixMap Class Component"
T_CT_QPIXMAPCLASS_IP_VALUE = "Object"
T_CT_QPIXMAPCLASS_IP_VALUE2 = "Method"

T_CT_QPIXMAPCLASS_IP_VALUE2FUNC = [
	"cachekey",
	"convertfromimage",
	"copy",
	"copy_2",
	"createheuristicmask",
	"createmaskfromcolor",
	"defaultdepth",
	"delete",
	"depth",
	"detach",
	"devicepixelratio",
	"fill",
	"fromimage",
	"fromimage_2",
	"fromimagereader",
	"hasalpha",
	"hasalphachannel",
	"height",
	"init",
	"isnull",
	"isqbitmap",
	"loadfromdata",
	"loadfromdata_2",
	"loadpixmap",
	"mask",
	"objectpointer",
	"rect",
	"save",
	"save_2",
	"scaled",
	"scaled_2",
	"scaledtoheight",
	"scaledtowidth",
	"scroll",
	"scroll_2",
	"setdevicepixelratio",
	"setmask",
	"size",
	"swap",
	"toimage",
	"transformed",
	"transformed_2",
	"truematrix",
	"truematrix_2",
	"width"
]
# Copy the list to support changing the generated method name in the Steps Tree
T_CT_QPIXMAPCLASS_IP_VALUE2STEPFUNC = T_CT_QPIXMAPCLASS_IP_VALUE2FUNC
T_CT_QPIXMAPCLASS_IP_VALUE2LIST = [
	"cacheKey(void) --> qint64",
	"convertFromImage(QImage image, Qt::ImageConversionFlags flags) --> bool",
	"copy(int x, int y, int width, int height) --> QPixmap",
	"copy_2(QRect rectangle) --> QPixmap",
	"createHeuristicMask(bool clipTight) --> QBitmap",
	"createMaskFromColor(QColor , Qt::MaskMode) --> QBitmap",
	"defaultDepth(void) --> int",
	"delete(void) --> void",
	"depth(void) --> int",
	"detach(void) --> void",
	"devicePixelRatio(void) --> qreal",
	"fill(QColor) --> void",
	"fromImage(QImage,Qt::ImageConversionFlags) --> QPixmap",
	"fromImage_2(QImage image, Qt::ImageConversionFlags flags) --> QPixmap",
	"fromImageReader(QImageReader *imageReader, Qt::ImageConversionFlags flags) --> QPixmap",
	"hasAlpha(void) --> bool",
	"hasAlphaChannel(void) --> bool",
	"height(void) --> int",
	"init(parent) --> object",
	"isNull(void) --> bool",
	"isQBitmap(void) --> bool",
	"loadFromData(uchar *data, uint len, char *format, Qt::ImageConversionFlags flags) --> bool",
	"loadFromData_2(QByteArray data, char *format, Qt::ImageConversionFlags flags) --> bool",
	"loadpixmap(QString, char *, Qt::ImageConversionFlags ) --> bool",
	"mask(void) --> QBitmap",
	"objectpointer(void) --> pointer",
	"rect(void) --> QRect",
	"save(QString fileName, char *format, int quality) --> bool",
	"save_2(QIODevice *device, char *format, int quality) --> bool",
	"scaled(int width, int height, Qt::AspectRatioMode aspectRatioMode, Qt::TransformationMode transformMode) --> QPixmap",
	"scaled_2(QSize size, Qt::AspectRatioMode aspectRatioMode, Qt::TransformationMode transformMode) --> QPixmap",
	"scaledToHeight(int height, Qt::TransformationMode mode) --> QPixmap",
	"scaledToWidth(int width, Qt::TransformationMode mode) --> QPixmap",
	"scroll(int dx, int dy, int x, int y, int width, int height, QRegion *exposed) --> void",
	"scroll_2(int dx, int dy, QRect rect, QRegion *exposed) --> void",
	"setDevicePixelRatio(qreal scaleFactor) --> void",
	"setMask(QBitmap) --> void",
	"size(void) --> QSize",
	"swap(QPixmap other) --> void",
	"toImage(void) --> QImage",
	"transformed(QTransform transform, Qt::TransformationMode mode) --> QPixmap",
	"transformed_2(QMatrix matrix, Qt::TransformationMode mode) --> QPixmap",
	"trueMatrix(QTransform matrix, int width, int height) --> QTransform",
	"trueMatrix_2(QMatrix m, int w, int h) --> QMatrix",
	"width(void) --> int"
]
T_CT_QPIXMAPCLASS_IP_VALUE3 = "Parameters"
T_CT_QPIXMAPCLASS_IP_VALUE4 = "Output"