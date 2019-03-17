import QtQuick 2.12
import QtQuick.Controls 2.5

ProgressBar {
    id: progress_bar

    property alias minimum: progress_bar.from
    property alias maximum: progress_bar.to
    // 注意：因使用了NumberAnimation, progress无法使用动态绑定
    property alias progress: progress_bar.value
    property alias backgroundColor: background.color
    property alias foregroundColor: foreground.color

    from: 0
    to: 100
    value: 0

    function reset(){
        transition_animation.enabled = false
        progress = 0
        transition_animation.enabled = true
    }

    onVisibleChanged:{
        if(visible){
            reset()
        }
    }

    background: Rectangle {
        id: background
        implicitWidth: 200
        implicitHeight: 10
        color: "#e6e6e6"
        radius: height/2
    }

    contentItem: Item {
        implicitWidth: background.width
        implicitHeight: background.implicitHeight

        Rectangle {
            id: foreground
            width: progress_bar.visualPosition * parent.width
            height: parent.height
            radius: height/2
            color: "#17a81a"
        }
    }

    Behavior on value {
        id: transition_animation
        NumberAnimation {
            target: progress_bar
            property: "value"
            duration: 500
        }
    }
}



