import QtQuick 2.10

Item {

    FocusScope {
        id: focusScope
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            //color: "#ffb7b7"
            border.color: {
                if (focusScope.focus) {
                    "#e91e63"
                } else {
                    "white"
                }
            }
        }

        property alias text: input.text
        property alias input: input
        property alias placeholderText: pt

        TextEdit {
            id: input
            anchors.fill: parent
            anchors.margins: 4
            font.pixelSize: 14
            font.family: "Roboto Regular"
            focus: true

            Text {
                id: pt
                text: "Введите текст..."
                color: "#aaa"
                font.family: "Roboto Regular"
                font.pixelSize: 14
                visible: !input.text
            }
        }
    }
}
