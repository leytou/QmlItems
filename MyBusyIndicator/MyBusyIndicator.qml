import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Window 2.0

BusyIndicator {
    id: indicator

    property int lines: repeatr.model       //  条条数量
    property real llength: 22               //  条条长途
    property real lwidth: 5                 //  条条宽度
    property real omin: 0.3                 //  最小透明度
    property real omax: 1.0                 //  最大透明度
    property color color: "black"           //  条条颜色
    property real speed: 300                //  度/秒
    property bool clock_wise: true          //  顺时针

    contentItem: Item {
        id: content
        property int cur: 0

        anchors.fill: indicator

        Repeater {
            id: repeatr
            model: 8
            Rectangle {
                x: content.width / 2 - width / 2
                y: content.height / 2 - height / 2
                width: indicator.lwidth
                height: indicator.llength
                radius: height / 2
                color: indicator.color
                opacity: indicator.omin + (indicator.omax-indicator.omin)/(repeatr.count-1)*
                         ((7-index + content.cur )%repeatr.count)

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
                if(indicator.clock_wise){
                    content.cur = (content.cur + 1) % repeatr.count
                }else{
                    content.cur = (content.cur == 0) ? (repeatr.count-1) : (content.cur-1)
                }
            }
        }
    }
}
