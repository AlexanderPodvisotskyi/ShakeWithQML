import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
// import "logic.js" as gameLogic

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Snake Game")

    SystemPalette { id:activePallette }


    GameGround {
        id: gameGround

        height: root.height
        width: root.width

        anchors.top: toolbar.bottom
    }

    Buttons {
        id: toolbar

        anchors.left: root.left
        anchors.top : root.top
    }

    Wall {

        id:wall
    }



    Snake {
        id: mySnake

        anchors.centerIn: gameGround
    }
}
