
	
	import QtQuick 2.0
	import QtCharts 2.0
	
	ChartView {
	    width: 600
	    height: 600
	    antialiasing: true
	
	    PieSeries {
	        id: pieSeries
	        PieSlice { label: "fifteen"; value: 2166 }
	        PieSlice { label: "Other"; value: 25890 }
	    }
	}
	
	