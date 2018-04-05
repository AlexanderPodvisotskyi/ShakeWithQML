import QtQuick 2.0
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

Rectangle {

    Text {
        id:text

        text: GameGroundLogic.score
        font.pointSize: 25
        color : "#ECEC0D"
    }

}
