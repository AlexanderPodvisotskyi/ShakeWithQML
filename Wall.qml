import QtQuick 2.0


Item {

    id:wall

    Rectangle {
        id: topWall

        height: 40
        width:  root.width
        color: "brown"

        anchors.top: toolbar.bottom
    }

    Rectangle {
        id: bottomWall

        height: 40
        width:  root.width
        color: "brown"

        anchors.bottom: root.bottom
    }

    Rectangle {
        id: rightWall

        height: root.height
        width:  40
        color: "brown"

        anchors.right: root.right
    }

    Rectangle {
        id: leftWall

        height: root.height
        width:  40
        color: "brown"

        anchors.left: root.left
    }
}
