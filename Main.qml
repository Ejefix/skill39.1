import QtQuick
import QtQuick.Window
import QtQuick.VirtualKeyboard


Window{
    id : root
    minimumWidth: 600
    minimumHeight: 480
    visible: true
    title : "Make"
Rectangle{
    id : scena
    anchors.fill: parent
    state:  "Lstate"


    Rectangle{
        id : l_Rectangle
        x:100
        y:200
        color : "green"
        border.color: "black"
        border.width: 5
        width: 100
        height: 100
        MouseArea{
            anchors.fill: parent
            onClicked: {
                ballAnimation.start();
            }

        }
        Text {
            anchors.centerIn: parent
            text: "move"
        }
    }
Rectangle{
    id : r_Rectangle
    x:l_Rectangle.x*3 + 125
    y:l_Rectangle.y
    color : "orange"
    border.color: "black"
    border.width: 5
    width: 100
    height: 100
    MouseArea{
    anchors.fill: parent
    onClicked: {
         ball_return.start();
    }
    Text {
        anchors.centerIn: parent
        text: "return"
    }
    }
}
Rectangle{
    id : ball
    x:l_Rectangle.x+10
    y:l_Rectangle.y+10
    color : "red"
    width: 80
    height: 80
    radius: width/2
    NumberAnimation {
        id: ballAnimation
        target: ball
        property: "x"
        to: ball.x + 35
        duration: 500
        easing.type: Easing.InOutBack

        onStopped: {
            if (ball.x+10 >= r_Rectangle.x) {
                ball_return.start();
            }
        }
    }
    NumberAnimation {
        id: ball_return
        target: ball
        property: "x"
        to: ball.x = l_Rectangle.x + 10
        duration: 2500
        easing.type: Easing.OutInSine
    }
}
}
}
