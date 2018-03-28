import QtQuick 2.9
import QtQuick.Controls 2.2

Rectangle {
    id: toolbar
    height: root.height * 0.10
    width: root.width

    Button
    {
        id: newGame

        text: "New Game"
        highlighted: true
        width: toolbar.width * 0.25
        height: toolbar.height

        anchors.left: toolbar.left
        anchors.top: toolbar.top
    }

    Button
    {
        id: exit

        text: "Exit"
        highlighted: true
        width: toolbar.width * 0.25
        height: toolbar.height

        anchors.right:toolbar.right
        anchors.top: toolbar.top
        anchors.leftMargin: 1


        onClicked: {

            Qt.quit();
        }
    }
}

