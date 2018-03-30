import QtQuick 2.0

Rectangle {

    Image {
        id:background

        height:  root.height - Buttons.height
        width:   root.width

        source: "image/background.jpg"
    }


    Image {
        id: fruit

        x: Math.random() * 640
        y: Math.random() * 480

        source:"image/fruit.png"
    }
}
