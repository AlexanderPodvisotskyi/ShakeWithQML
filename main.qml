import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("Snake Game")
    //    flags: Qt.FramelessWindowHint

    SystemPalette { id:activePallette }

    GameGround {
        id: gameGroundMain

        height: root.height
        width: root.width
    }
}
