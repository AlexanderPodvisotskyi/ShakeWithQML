import QtQuick 2.9
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic
import "qrc:/JavaScript/Snake.js" as SnakeLogic

Rectangle {
    id: gameGround

    width: root.width
    height: root.height

    Component.onCompleted: {
        GameGroundLogic.mainGameGround = gameGround             // set GameGround main
        GameGroundLogic.createFruit()                           // create Fruit
    }

    Image {
        id:background

        height: gameGround.height
        width:  gameGround.width

        source: "image/background.jpg"
    }

    Snake{
        id: snake
    }
}

