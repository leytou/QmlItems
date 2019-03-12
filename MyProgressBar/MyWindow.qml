import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.0

Window {
    id: root

    property real window_width: 600             // content width
    property real window_height: 360            // content height
    property real scale_factor: 1               // content scale facotr
    property alias window_color: window.color   // content background
    property alias radius: window.radius        // window radius
    property alias drop_shadow: shadow          // shadow

    default property alias content: container.children

    width: window.width + 2*shadow.radius       //window real width
    height: window.height + 2*shadow.radius     //window real height
    color: "transparent"
    flags : Qt.Window | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    MouseArea {
        acceptedButtons: Qt.LeftButton
        anchors.fill: window
        property point clickPos: Qt.point(0, 0)
        onPressed: {
           clickPos  = Qt.point(mouse.x,mouse.y)
        }
        onPositionChanged: {
           var delta = Qt.point(mouseX-clickPos.x, mouseY-clickPos.y)
            root.x += delta.x
            root.y += delta.y
        }
   }

    Rectangle{
        id: window
        width: window_width * scale_factor
        height: window_height * scale_factor
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: -shadow.horizontalOffset
        anchors.verticalCenterOffset: -shadow.verticalOffset
        radius: 18 * scale_factor

        Item{
            id: container
            width: window_width
            height: window_height
            transformOrigin: "TopLeft"
            scale: scale_factor
        }
    }

    DropShadow{
        id: shadow
        anchors.fill: window
        source: window
        horizontalOffset: 0
        verticalOffset: 6
        radius: 30
        samples: 60
        color: "#40000000"
    }
}
