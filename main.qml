import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("Snake Game")

    GameGround {
        id: gameGroundMain

        height: parent.height
        width: parent.width
    }
}
