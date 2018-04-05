.import QtQuick 2.9 as QML
.import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

var head = null
var tail = null

// add Piece to Snake
function addPiece()
{
    var newPieceComponent = Qt.createComponent("qrc:/SnakePiece.qml")
    if (newPieceComponent !== null) {
        var newPiece = newPieceComponent.createObject(snake)
        newPiece.x = tail.x
        newPiece.y = tail.y

        tail.next = newPiece
        tail = tail.next

        GameGroundLogic.listElement.push(newPiece)
    }
}

function foundsItem(){
    var founds  = GameGroundLogic.collision(snakeHead)

    for (var indexFounds = 0; indexFounds < founds.length; indexFounds++) {
        if(GameGroundLogic.listFruit.indexOf(founds[indexFounds]) !== -1) {

            GameGroundLogic.createFruit()
            GameGroundLogic.deleteFruit(founds[indexFounds])
            addPiece()
            score += 10
            GameGroundLogic.gameLogic(snake)
            break;
        }else{
            GameGroundLogic.gameOver(snake)
        }
    }
}
