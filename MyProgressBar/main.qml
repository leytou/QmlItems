import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

MyWindow {
    windowWidth: 600
    windowHeight: 360
    visible: true
    title: "Hello World"
    scaleFactor: Screen.height/1080
    flags : Qt.Window | Qt.FramelessWindowHint

    Item{
        id: item
        width: 500
        anchors.centerIn: parent

        MyProgressBar {
            id: progress_bar

            width: 420
            height: 10
            anchors.verticalCenter: parent.verticalCenter

            minimum: 0
            maximum: 100
            progress: 0
            foregroundColor: "#0087FF"
            backgroundColor: "#E6E6E6"
        }

        Text{
            id: percent
            width: implicitWidth + leftPadding
            leftPadding: 10
            anchors.left: progress_bar.right
            anchors.verticalCenter: progress_bar.verticalCenter
            horizontalAlignment: Text.AlignRight
            color: "#0087FF"
            text: parseInt(progress_bar.position * 100) + "%"
            font {
                pixelSize: 32;
                family: "Microsoft YaHei"
            }
        }
    }

    Item{
        Timer {
            running: true
            repeat: true
            interval: 1000
            onTriggered: {
                if(progress_bar.progress == 100){
                    progress_bar.reset()
                }else{
                    progress_bar.progress += 30
                }
            }
        }
    }
}
