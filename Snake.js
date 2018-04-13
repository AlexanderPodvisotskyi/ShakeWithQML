.import QtQuick 2.9 as QML
.import "qrc:/JavaScript/GameGround.js" as GameGroundLogic

var head = null
var tail = null

var  direction      =  0
var  directionUp    =  1
var  directionDown  =  2
var  directionLeft  =  3
var  directionRight =  4

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


function foundsItem()
{
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

function deletePiece(){
    if(tail === head)
        return;

    var tmp = head
    while(tmp.next && tmp.next !== tail)
        tmp = tmp.next

    if(tmp === null)
        return;

    tail.destroy()
    GameGroundLogic.listElement.splice(GameGroundLogic.listElement.indexOf(tail),1)

    tail = tmp
}

function restartGame()
{
    while(GameGroundLogic.listElement.length !== 2){

        deletePiece();
        score = 0;
        timer.interval = 200
        GameGroundLogic.level = 0;

        snakeHead.x = 40
        snakeHead.y = 40
        direction = directionRight
    }
}

function replase()
{
    var prevLast = head
    while(prevLast.next && prevLast.next !== tail)
        prevLast = prevLast.next

    if(prevLast === null)
        return;

    var temp = head
    head = tail
    head.next = temp.next
    tail = temp
    tail.next = null
    prevLast.next = tail

    if(direction === directionUp)
        direction = directionDown
    else if(direction === directionDown)
        direction = directionUp
    else if(direction === directionLeft)
        direction = directionRight
    else if(direction === directionRight)
        direction = directionLeft
}

function control (event){


    switch(event)
    {
    case Qt.Key_Up:
        if(direction !== directionDown)
            direction = directionUp
        break;
    case Qt.Key_Down:
        if(direction !== directionUp)
            direction = directionDown
        break;
    case Qt.Key_Left:
        if(direction !== directionRight)
            direction = directionLeft
        break;
    case Qt.Key_Right:
        if(direction !== directionLeft)
            direction = directionRight
        break;
    case Qt.Key_G:
        restartGame()
        break;
    case Qt.Key_H:
        replase()
        break;
    }

}

function timeDirection()
{
    if (direction === directionUp){
        head.y = head.y - head.height
        if(head.y < 0)
            head.y = Math.floor(GameGroundLogic.mainGameGround.height / head.height) * head.height - head.height
    }
    else  if (direction === directionDown){
        head.y = head.y + head.height
        if(head.y > Math.floor(GameGroundLogic.mainGameGround.height / head.height) * head.height - head.height)
            head.y = 0
    }
    else  if (direction === directionRight){
        head.x = head.x + head.width
        if(head.x > Math.floor(GameGroundLogic.mainGameGround.width / head.width) * head.width - head.width)
            head.x = 0
    }
    else  if (direction === directionLeft){
        head.x = head.x - head.width
        if(head.x < 0 )
            head.x  = Math.floor(GameGroundLogic.mainGameGround.width / head.width) * head.width - head.width
    }
}
