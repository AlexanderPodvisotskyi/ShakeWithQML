.import QtQuick 2.7 as QML

var head = null
var tail = null

function addPiece()
{
    var newPieceComponent = Qt.createComponent("qrc:/SnakePiece.qml")
    if (newPieceComponent.status === QML.Component.Ready) {
        var newPiece = newPieceComponent.createObject(snake)
        newPiece.x = tail.x
        newPiece.y = tail.y

        tail.next = newPiece
        tail = tail.next
    }
}
