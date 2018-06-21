import QtQuick 2.10
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

//Main:  #e91e63
//Dark:  #b0003a
//Light: #ff6090

ApplicationWindow {
    id: mainWindow
    visible: true

    width: 640
    height: 480

    Material.accent: "#e91e63"

    header: ToolBar {
        id: appBar
        height: 56

        Rectangle {
            id: appBarRect
            anchors.fill: parent
            color: "#e91e63"

            Text {
                id: headerText
                text: qsTr("Counter")
                font.family: "Roboto Medium"
                font.pointSize: 15
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.margins: 19
            }
        }
    }

    TextField {
        id: input
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: appBar.bottom
        anchors.bottom: cbGrid.top
        anchors.margins: 19
        wrapMode: Text.WrapAnywhere
    }



    Grid {
        id: cbGrid
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 19

        rows: 2
        columns: 2

        CheckBox { text: "Не считать пробелы"         }
        CheckBox { text: "Не считать знаки"           }
        CheckBox { text: "Посчитать количество строк" }
        CheckBox { text: "Посчитать количество слов"  }
    }

    Item {
        anchors.right: parent.right
        anchors.left: cbGrid.right
        anchors.top: input.bottom
        anchors.bottom: parent.bottom
        anchors.margins: 19

        Text {
            anchors.centerIn: parent

            text: "0"
            font.pixelSize: 40
        }
    }
}
