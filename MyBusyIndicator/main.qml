import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

MyWindow {
    windowWidth: 600
    windowHeight: 360
    visible: true
    title: "Hello World"
    scaleFactor: Screen.height/1080
    flags : Qt.Window | Qt.FramelessWindowHint

    MyBusyIndicator {
        width: 240
        height: 240
        lines: 8
        lineLength: 66
        lineLwidth: 15
        minOpacity: 0.3
        maxOpacity: 1.0
        color: "#888888"
        speed: 480
        clockWise: true

        anchors.centerIn: parent
    }
}
