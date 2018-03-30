import QtQuick 2.0

Rectangle {

    Image {
        id:background

        height:  root.height - Buttons.height
        width:   root.width


        source: "image/background.jpg"
    }
}
