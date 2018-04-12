import QtQuick 2.9
import "qrc:/JavaScript/Snake.js" as SnakeLogic
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

Item {
    id: snake

    property int score: 0

    property int direction: 0
    readonly property int directionUp: 1
    readonly property int directionDown: 2
    readonly property int directionLeft: 3
    readonly property int directionRight: 4

    property alias timerInterval: timer.interval
    property alias scoresText: scores.text

    Keys.onPressed:{

        if(event.key === Qt.Key_Up){
            direction = directionUp
        }
        if(event.key === Qt.Key_Down){
            direction = directionDown
        }
        if(event.key === Qt.Key_Left){
            direction = directionLeft
        }
        if(event.key === Qt.Key_Right){
            direction = directionRight
        }
        if(event.key === Qt.Key_G){
            SnakeLogic.restartGame()
        }
        if(event.key === Qt.Key_Alt)
        {
            if(timer.running)
                timer.stop();
            else
                timer.start();
        }
        SnakeLogic.control(direction)
    }

    Timer {
        id: timer
        interval: 200
        running: true
        repeat: true

        onTriggered: {
            SnakeLogic.onTimerDirection()
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


