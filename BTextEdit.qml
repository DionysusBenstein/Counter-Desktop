import QtQuick 2.10

Item {

    FocusScope {
        id: focusScope
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: "#ff6090"
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

        TextEdit {
            id: input
            anchors.fill: parent
            anchors.margins: 4
            focus: true
        }
    }
}
