

import QtQuick 2.0
import QtCharts 2.0

ChartView {

    width: 600
    height: 600
    theme: ChartView.ChartThemeBrownSand
    antialiasing: true

    PieSeries {
        id: pieSeries
        PieSlice { label: "Volkswagen"; value: 13.5 }
        PieSlice { label: "Toyota"; value: 10.9 }
        PieSlice { label: "Ford"; value: 8.6 }
        PieSlice { label: "Skoda"; value: 8.2 }
        PieSlice { label: "Volvo"; value: 6.8 }
        PieSlice { label: "Volkswagen2"; value: 13.5 }
        PieSlice { label: "Toyota2"; value: 10.9 }
        PieSlice { label: "Ford2"; value: 8.6 }
        PieSlice { label: "Skod2a"; value: 8.2 }
        PieSlice { label: "Volvo2"; value: 6.8 }
    }
}

