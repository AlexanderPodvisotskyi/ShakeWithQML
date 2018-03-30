import QtQuick 2.0

Item {
    focus: true

    property Rectangle next: null
    property int prevX: 0
    property int prevY: 0

    Keys.onPressed: {

        if(event.key === Qt.Key_Up){
            event.acceptable = true;
            snake.y = (snake.y) - 40
        }
        if(event.key === Qt.Key_Down){
            event.acceptable = true;
            snake.y = (snake.y) + 40
        }
        if(event.key === Qt.Key_Right){
            event.acceptable = true;
            snake.x = (snake.x) + 55
        }
        if(event.key === Qt.Key_Left){
            event.acceptable = true;
            snake.x = (snake.x) - 55
        }
    }

/*
    Component.onCompleted: {

        prevX = x
        prevY = y
    }

    onXChanged: {
        if(next !== null)
        {
            next.x = prevX
            next.y = y
        }

        prevX = x
    }

    onYChanged: {
        if(next !== null)
        {
            next.x = x
            next.y = prevY
        }

        prevY = y
    } */


    Image {
        id: snake
        source: "image/hed.png"

        width: background.width * 0.05
        height: background.height * 0.05
    }
}

