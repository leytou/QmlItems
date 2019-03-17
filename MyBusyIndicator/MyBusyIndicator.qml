import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

BusyIndicator {
    id: indicator

    property alias lines: repeatr.model      //  条条数量
    property real lineLength: 22            //  条条长途
    property real lineLwidth: 5             //  条条宽度
    property real minOpacity: 0.3           //  最小透明度
    property real maxOpacity: 1.0           //  最大透明度
    property color color: "black"            //  条条颜色
    property real speed: 360                 //  度/秒
    property bool clockWise: true           //  顺时针

    contentItem: Item {
        id: content
        property int rotatingIndex: 0

        anchors.fill: indicator

        Repeater {
            id: repeatr
            model: 8
            Rectangle {
                x: content.width / 2 - width / 2
                y: content.height / 2 - height / 2
                width: indicator.lineLwidth
                height: indicator.lineLength
                radius: height / 2
                color: indicator.color
                opacity: indicator.minOpacity + (indicator.maxOpacity-indicator.minOpacity)/
                         (repeatr.count-1)*((repeatr.count-1-index + content.rotatingIndex )%repeatr.count)

                transform: [
                    Translate {
                        y: -Math.min(content.width, content.height)/2 + height/2
                    },
                    Rotation {
                        origin.x: width / 2
                        origin.y: height / 2
                        angle: index / repeatr.count * 360
                    }
                ]

                Behavior on opacity {
                    OpacityAnimator {
                        duration: timer.interval
                    }
                }
            }
        }

        Timer {
            id: timer
            running: indicator.visible && indicator.running
            interval: 360/repeatr.count/indicator.speed * 1000
            repeat: true
            onTriggered: {
                if(indicator.clockWise){
                    content.rotatingIndex = (content.rotatingIndex + 1) % repeatr.count
                }else{
                    content.rotatingIndex = (content.rotatingIndex == 0) ? (repeatr.count-1) : (content.rotatingIndex-1)
                }
            }
        }
    }
}
