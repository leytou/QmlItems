import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

MyWindow {
    window_width: 600
    window_height: 360
    visible: true
    title: "Hello World"
    scale_factor: Screen.height/1080
    flags : Qt.Window | Qt.FramelessWindowHint

    MyBusyIndicator {
        width: 240
        height: 240
        lines: 8
        llength: 66
        lwidth: 15
        omin: 0.3
        omax: 1.0
        color: "#888888"
        speed: 480
        clock_wise: true

        anchors.centerIn: parent
    }
}
