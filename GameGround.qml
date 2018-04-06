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

        source: "Image/image/background.jpg"
    }

    Snake{
        id: snake
        focus: true
    }
//    Snake{

//        x:0
//        y:0
//        focus: false
//        id: snakes
//    }

//    Keys.onPressed: {

//        if(event.key === Qt.Key_H){


//        }
//        else if (snake.focus === false){
//            snake.focus = true
//            snakes.focus = false
//        }
//        else if(snake.focus === true){
//            snake.focus = false
//            snakes.focus = true

//        }
    }




