import QtQuick 2.9
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic
import "qrc:/JavaScript/Snake.js" as SnakeLogic

Rectangle {
    id: gameGround

    z: -1

    Component.onCompleted: {
        GameGroundLogic.mainGameGround = gameGround             // set GameGround main
        GameGroundLogic.createFruit()                           // create Fruit
    }

    Image {
        id:background

        height: gameGround.height
        width:  gameGround.width

        source: "Image/image/background.jpg"
    }

    Snake{
        id: snake
        focus: true
        z:1
    }
}
