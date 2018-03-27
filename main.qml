import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

ApplicationWindow {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Snake Game")


    Rectangle {
        Column {
            Row {
                id: toolbar
                spacing: 5

                Button
                {
                  id: newGame
                  text: "New Game"

                  width: root.width * 0.25
                  height: 25
                }

                Button
                {
                  id: setting
                  text: "Setting"

                  height: 25
                  width: root.width * 0.25
                }

                Button
                {
                    id: exit
                    text : "Exit"

                    height: 25
                    width: root.width * 0.25
                }
            }
        }

    }

}
