import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

MyWindow {
    windowWidth: 600
    windowHeight: 360
    visible: true
    title: "Hello World"
    scaleFactor: Screen.height/1080 //Scale according to screen resolution
    flags : Qt.Window | Qt.FramelessWindowHint

    ColumnLayout{
        anchors.fill: parent

        Image {
            source: "qrc:/smile.png"

            Layout.preferredWidth: 200
            Layout.preferredHeight: 200
            Layout.alignment: Qt.AlignHCenter
        }

        Text{
            id:tex
           text: "Hello World"
           horizontalAlignment: Text.AlignHCenter
           font{
               pixelSize: 48
               family: "Microsoft Yahei"
           }

           Layout.fillWidth: true
           Layout.alignment: Qt.AlignHCenter
           Layout.bottomMargin: 20
        }
     }
}
