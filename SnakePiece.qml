import QtQuick 2.9
import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

Rectangle {

    property Rectangle next: null

    property int prevX: 0
    property int prevY: 0

    Component.onCompleted: {
        prevX = x
        prevY = y

    }

    width: 40
    height: 40
    radius: 10
    color: "gray"

    onXChanged: {
        if(next !== null) {
            next.x = prevX
            next.y = y
        }
        prevX = x
    }

    onYChanged: {
        if(next !== null) {
            next.y = prevY
            next.x = x
        }
        prevY = y
    }
}
