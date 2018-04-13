import QtQuick 2.9
import "qrc:/JavaScript/Snake.js" as SnakeLogic
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

Item {
    id: snake

    property int score: 0

    property alias timerInterval: timer.interval
    property alias scoresText: scores.text

    Keys.onPressed: SnakeLogic.control(event.key)

    Timer {
        id: timer
        interval: 200
        running: true
        repeat: true

        onTriggered: {
            SnakeLogic.control()
            SnakeLogic.timeDirection()
            SnakeLogic.foundsItem()
        }
    }
    Text {
        id:scores
        text: score
        font.pointSize: 25

        color : "#ECEC0D"
    }

    SnakePiece {
        id: snakeHead

        x:40
        y:40
        radius: 15

        color: "red"
    }

    Component.onCompleted: {
        SnakeLogic.head = snakeHead
        SnakeLogic.tail = snakeHead

        GameGroundLogic.listElement.push(snakeHead)
    }
}


