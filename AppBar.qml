/*******************************************************************/

/* Original File Name: AppBar.qml                                  */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация AppBar.                                 */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4

ToolBar {
    id: appBar
    anchors.top: titleBar.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: 56

    Rectangle {
        id: appBarRect
        anchors.fill: parent
        color: primaryColor

        Text {
            id: headerText
            text: "Counter v2.5.1"
            font.family: robotoMediumFont.name
            font.pointSize: 15
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.margins: 19
        }
    }

    MouseArea {
        anchors.fill: parent
        onPositionChanged: if (isMaximize()) mainWindow.showNormal()
        onDoubleClicked: isMaximize() ? mainWindow.showNormal() : mainWindow.showMaximized()
        onPressed: {
            previousX = mouseX
            previousY = mouseY
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            mainWindow.setX(mainWindow.x + dx)
        }

        onMouseYChanged: {
            var dy = mouseY - previousY
            mainWindow.setY(mainWindow.y + dy)
        }
    }

    MouseArea {
        id: leftArea
        width: borderSize
        anchors {
            left: parent.left
            top: parent.top
            topMargin: cornerSize
            bottom: parent.bottom
            bottomMargin: cornerSize
        }
        cursorShape: Qt.SizeHorCursor

        onPressed: {
            previousX = mouseX
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            if ((mainWindow.width - dx) >= mainWindow.minimumWidth) {
                mainWindow.setX(mainWindow.x + dx)
                mainWindow.setWidth(mainWindow.width - dx)
            }
        }
    }

    MouseArea {
        id: rightArea
        width: borderSize
        anchors {
            right: parent.right
            top: parent.top
            topMargin: cornerSize
            bottom: parent.bottom
            bottomMargin: cornerSize
        }
        cursorShape:  Qt.SizeHorCursor

        onPressed: {
            previousX = mouseX
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            if ((mainWindow.width + dx) >= mainWindow.minimumWidth) {
                mainWindow.setWidth(mainWindow.width + dx)
            }
        }
    }

    ToolButton {
        id: moreButton
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: moreButtonIcon
            anchors.centerIn: parent
            source: "images/more_vert-24dp.png"
        }

        Menu {
            id: moreButtonContextMenu
            Action { text: qsTr("О программе"); }
        }

        onClicked: contextMenu.open()
    }

    ToolButton {
        id: settingsButton
        anchors.right: moreButton.left
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: settingsButtonIcon
            anchors.centerIn: parent
            source: "images/settings-24dp.png"
        }
    }

    ToolButton {
        id: paletteButton
        anchors.right: settingsButton.left
        anchors.verticalCenter: parent.verticalCenter

        Image {
            id: paletteButtonIcon
            anchors.centerIn: parent
            source: "images/palette-24.png"
        }
    }
}

