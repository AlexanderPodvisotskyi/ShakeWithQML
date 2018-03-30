import QtQuick 2.0


Item {
    focus: true

    property string dir: ""

    Keys.onPressed: {

        if(event.key === Qt.Key_Up){
            event.acceptable = true;
            dir = "UP"
        }
        if(event.key === Qt.Key_Down){
            event.acceptable = true;
            dir = "DOWN"
        }
        if(event.key === Qt.Key_Right){
            event.acceptable = true;
            dir = "RIGHT"
        }
        if(event.key === Qt.Key_Left){
            event.acceptable = true;
            dir = "LEFT"
        }
    }

    Timer {
        interval: 150; running: true; repeat: true;
        onTriggered:
            if (dir === "UP"){
                snake.y = (snake.y) - 40
            }
            else  if (dir === "DOWN"){
                snake.y = (snake.y) + 40
            }
            else  if (dir === "RIGHT"){
                snake.x = (snake.x) + 40
            }
            else  if (dir === "LEFT"){
                snake.x = (snake.x) - 40
            }
    }

    Image {
        id: snake
        source: "image/hed.jpg"
    }
}

