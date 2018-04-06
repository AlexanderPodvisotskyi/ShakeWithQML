import QtQuick 2.9
import "qrc:/JavaScript/Snake.js" as SnakeLogic
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

Item {
    id: snake
    focus: true

    property int score: 0
    property int direction: 0

    readonly property int directionUp: 1
    readonly property int directionDown: 2
    readonly property int directionLeft: 3
    readonly property int directionRight: 4

    property alias timerInterval: timer.interval
    property alias scoresText: scores.text

    function onTimerDirection() {
        if (direction === directionUp){
            snakeHead.y = snakeHead.y - snakeHead.height
            if(snakeHead.y < 0)
                snakeHead.y = Math.floor(root.height / snakeHead.height) * snakeHead.height - snakeHead.height
        }
        else  if (direction === directionDown){
            snakeHead.y = snakeHead.y + snakeHead.height
            if(snakeHead.y > Math.floor(root.height / snakeHead.height) * snakeHead.height - snakeHead.height)
                snakeHead.y = 0
        }
        else  if (direction === directionRight){
            snakeHead.x = snakeHead.x + snakeHead.width
            if(snakeHead.x > Math.floor(root.width / snakeHead.width) * snakeHead.width - snakeHead.width)
                snakeHead.x = 0
        }
        else  if (direction === directionLeft){
            snakeHead.x = snakeHead.x - snakeHead.width
            if(snakeHead.x < 0 )
                snakeHead.x  = Math.floor(root.width / snakeHead.width) * snakeHead.width - snakeHead.width
        }
    }

    Keys.onPressed: {

        if(event.key === Qt.Key_Up && direction !== directionDown) {
            direction = directionUp
        }
        if(event.key === Qt.Key_Down && direction !== directionUp) {
            direction = directionDown
        }
        if(event.key === Qt.Key_Right && direction !== directionLeft) {
            direction = directionRight
        }
        if(event.key === Qt.Key_Left && direction !== directionRight) {
            direction = directionLeft
        }
        if(event.key === Qt.Key_Alt)
        {
            if(timer.running)
                timer.stop()
            else
                timer.start()

      //      SnakeLogic.deletePiece()
        }
    }

    Timer {
        id: timer
        interval: 150
        running: true
        repeat: true

        onTriggered: {
            onTimerDirection()
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


