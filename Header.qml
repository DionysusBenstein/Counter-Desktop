import QtQuick 2.10

Rectangle {
    id: actionBar
    height: 24
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    color: "#b0003a"

    //close
    Rectangle {
        id: closeButton
        anchors.right: parent.right
        width: 24
        height: 24
        color: actionBar.color

        Rectangle {
            anchors.centerIn: parent
            width: 2
            height: 12
            rotation: 45
            antialiasing: true
        }

        Rectangle {
            anchors.centerIn: parent
            width: 2
            height: 12
            rotation: 135
            antialiasing: true
        }

        MouseArea {
            id: closeButtonMoseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = "#e81123"
            onExited: parent.color = actionBar.color
            onClicked: close()
        }
    }

    //maximaze
    Rectangle {
        id: maxButton
        anchors.right: closeButton.left
        width: 24
        height: 24
        color: parent.color

        Rectangle {
            anchors.centerIn: parent
            width: 10
            height: 9
        }

        Rectangle {
            anchors.centerIn: parent
            width: 6
            height: 5
            color: parent.color
        }

        MouseArea {
            id: maxButtonMoseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = "#ff6090"
            onExited: parent.color = "#b0003a"
            onClicked: mainWindow.showFullScreen()

        }
    }

    //to curtail
    Rectangle {
        anchors.right: maxButton.left
        width: 24
        height: 24
        color: parent.color

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            width: 10
            height: 2
        }

        MouseArea {
            id: curButtonMoseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = "#ff6090"
            onExited: parent.color = "#b0003a"
            onClicked: {
                mainWindow.FullScreen
            }
        }
    }
}
