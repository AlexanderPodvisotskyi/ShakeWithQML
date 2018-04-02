.pragma library
.import QtQuick 2.9 as QML

var listElement = []
var mainGameGround = null
var fruit = null

// check item collision on gameGround
// GG - GameGround



function collision(item) {
    var itemGG = mainGameGround.mapToItem(null, item.x, item.y, item.width, item.height)
    itemGG.x = itemGG.x + Math.round(itemGG.width / 2)
    itemGG.y = itemGG.y + Math.round(itemGG.height / 2)

    var foundElements = []

    for (var index = 0; index < listElement.length; index++) {
        var element = listElement[index];

        if(item === element)
            continue

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
    if (newFruitComponent.status === QML.Component.Ready) {
        var newFruit = newFruitComponent.createObject(mainGameGround)

        newFruit.x = Math.random() * mainGameGround.width
        newFruit.y = Math.random() * mainGameGround.height

        listElement.push(newFruit)
    }

}

