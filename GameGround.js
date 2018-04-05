.pragma library
.import QtQuick 2.9 as QML

var level = 0
var listFruit = []
var listElement = []
var mainGameGround = null

function random(min, max)
{
    return Math.random() * (max - min) + min;
}

// check item collision on gameGround
// GG - GameGround
function collision(item)
{
    var itemGG = mainGameGround.mapToItem(null, item.x, item.y, item.width, item.height)
    itemGG.x = itemGG.x + Math.round(itemGG.width / 2)
    itemGG.y = itemGG.y + Math.round(itemGG.height / 2)

    var foundElements = []

    for (var index = 0; index < listElement.length; index++) {
        var element = listElement[index];

        // if Item solo in GameGround, it s Hat, seacrh next element
        if(item === element)
            continue

        // Search element in GameGround (tail) and compares with HeadSnake, if he equal return indexelement
        var elementGG = mainGameGround.mapToItem(null, element.x, element.y, element.width, element.height)
        if(elementGG.x <= itemGG.x && elementGG.x + elementGG.width >= itemGG.x)
            if(elementGG.y <= itemGG.y && elementGG.y + elementGG.height >= itemGG.y)
                foundElements.push(element)
    }
    return foundElements
}

function createFruit()
{
    var newFruitComponent = Qt.createComponent("qrc:/Fruit.qml")
    if (newFruitComponent !== null) {
        var  newFruit = newFruitComponent.createObject(mainGameGround)

        newFruit.x = Math.floor(random(newFruit.width * 2,mainGameGround.width) / newFruit.width) * newFruit.width - newFruit.width
        newFruit.y = Math.floor(random(newFruit.height * 2 ,mainGameGround.height) / newFruit.height) * newFruit.height - newFruit.height

        listElement.push(newFruit)
        listFruit.push(newFruit)
    }
}

function deleteFruit(fruit)
{
    listElement.splice(listElement.indexOf(fruit),1)
    listFruit.splice(listFruit.indexOf(fruit),1)
    fruit.destroy()
}

function deletePiece(rezult){
    for(var i = 0 ; i< listElement.length;i++){
        for(var j = 0 ; j< listFruit.length;j++){
            if((listElement[i] !== listFruit[j]))
                rezult = listElement[i]
        }}

    listElement.splice(listElement.indexOf(rezult),1)
 rezult.destroy()

    console.log(listElement)
    console.log(listFruit)

}

function gameOver(contextObj)
{
    console.log("It s a tail")
    contextObj.timerInterval = 0

    if (contextObj.scoresText >= 100) {
        contextObj.scoresText = "Nice try"
    }else{
        contextObj.scoresText = "Bad try"
    }
}

function gameLogic(contextObj)
{
    if(contextObj.scoresText % 50 === 0){
        contextObj.timerInterval -=25
        level++;
        console.log(contextObj.scoresText)
        console.log(level)
    }
    if(level === 5)
    {
        contextObj.textText  = "You win this game"
        contextObj.timerInterval = 0
    }
}

