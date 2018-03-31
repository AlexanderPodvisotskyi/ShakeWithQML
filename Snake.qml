import QtQuick 2.0


Item {
    id: snake
    focus: true

    property string direction: ""

    Keys.onPressed: {

        if(event.key === Qt.Key_Up){
            event.acceptable = true;
            direction = "UP"
        }
        if(event.key === Qt.Key_Down){
            event.acceptable = true;
            direction = "DOWN"
        }
        if(event.key === Qt.Key_Right){
            event.acceptable = true;
            direction = "RIGHT"
        }
        if(event.key === Qt.Key_Left){
            event.acceptable = true;
            direction = "LEFT"
        }
    }

    Timer {
        interval: 150; running: true; repeat: true;
        onTriggered:
            if (direction === "UP"){
                snakeHead.y = (snakeHead.y) - 40
            }
            else  if (direction === "DOWN"){
                snakeHead.y = (snakeHead.y) + 40
            }
            else  if (direction === "RIGHT"){
                snakeHead.x = (snakeHead.x) + 40
            }
            else  if (direction === "LEFT"){
                snakeHead.x = (snakeHead.x) - 40
            }
    }

    SnakePiece {
        id: snakeHead

        x:40
        y:40

        color: "blue"
    }
}

