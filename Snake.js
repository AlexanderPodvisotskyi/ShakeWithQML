.import QtQuick 2.9 as QML
.import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

var head = null
var tail = null


// add Piece to Snake
function addPiece()
{
    var newPieceComponent = Qt.createComponent("qrc:/SnakePiece.qml")
    if (newPieceComponent.status === QML.Component.Ready) {
        var newPiece = newPieceComponent.createObject(snake)
        newPiece.x = tail.x
        newPiece.y = tail.y

        tail.next = newPiece
        tail = tail.next

        GameGroundLogic.listElement.push(newPiece)
    }
}
