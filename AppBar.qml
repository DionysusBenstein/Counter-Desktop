import QtQuick 2.10

Rectangle {
    id: appBar
    anchors.top: header.bottom
    anchors.left: parent.left
    anchors.right: parent.right
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
