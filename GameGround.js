.pragma library
.import QtQuick 2.9 as QML

var score = 0
var listFruit = []
var listElement = []
var mainGameGround = null

function random(min, max) {

   return Math.random() * (max - min) + min;
}

// check item collision on gameGround
// GG - GameGround
function collision(item) {
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

        score += 10
    }
}

function deleteFruit(fruit) {

    listElement.splice(listElement.indexOf(fruit),1)
    listFruit.splice(listFruit.indexOf(fruit),1)
    fruit.destroy()
}


function gameOver(timer,text) {

    console.log("It s a tail")
    timer.interval = 0
    if (score >= 100) {
        text.text = "Nice try"
    }else{
        text.text = "Bad try"
    }
}

