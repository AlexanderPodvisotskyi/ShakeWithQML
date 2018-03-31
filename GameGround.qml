import QtQuick 2.9
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

Rectangle {
    id: gameGround

    Component.onCompleted: {
        GameGroundLogic.mainGameGround = gameGround
    }

    Image {
        id:background

        height:  root.height - Buttons.height
        width:   root.width

        source: "image/background.jpg"
    }



    //    Image {
    //        id: fruit

    //        x: Math.random() * 640
    //        y: Math.random() * 480

    //        source:"image/fruit.png"
    //    }
}
