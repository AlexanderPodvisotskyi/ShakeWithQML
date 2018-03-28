import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

import "logic.js" as gameLogic

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("Snake Game")

    SystemPalette { id:activePallette}

    Image {
        id:background
        anchors.fill: parent
        source: "image/background.jpg"
    }

    Buttons
    {
        id: toolbar
        anchors.left: root.left
        anchors.top : root.top

    }
}
