/*******************************************************************/

/* Original File Name: AppBar.qml                                  */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация AppBar.                                 */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

ToolBar {
    id: appBar
    height: 56
    anchors {
        top: titleBar.bottom
        left: parent.left
        right: parent.right
    }

    Rectangle {
        id: appBarRect
        anchors.fill: parent
        color: primaryColor

        Text {
            id: headerText
            text: "Counter"/*+" v2.5.1"*/
            color: "white"
            font {
                family: robotoMediumFont.name
                pointSize: 15
            }

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                margins: 19
            }
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
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        onClicked: moreButtonContextMenu.open()

        Image {
            id: moreButtonIcon
            anchors.centerIn: parent
            source: "images/more_vert-24dp.png"
        }

        Menu {
            id: moreButtonContextMenu
            Action { text: qsTr("Язык"); icon.source: "images/language-24dp.png"; }
            Action { text: qsTr("О программе") }
        }
    }

    ToolButton {
        id: settingsButton
        anchors {
            right: moreButton.left
            verticalCenter: parent.verticalCenter
        }

        state: "hovered"
        onClicked: state = (state === "hovered") ? "notHovered" : "hovered"

        Image {
            id: settingsButtonIcon
            anchors.centerIn: parent
            source: "images/settings-24dp.png"
        }

        states: State {
            name: "notHovered"

            PropertyChanges {
                target: settingsButtonIcon
                rotation: 45
            }
        }

        State {
            name: "hovered"

            PropertyChanges {
                target: settingsButtonIcon
                rotation: -45
            }
        }

        transitions: [
            Transition {
                from: "notHovered"; to: "hovered"

                RotationAnimator {
                    target: settingsButton
                    duration: 100
                }
            },

            Transition {
                from: "hovered"; to: "notHovered"

                RotationAnimator {
                    target: settingsButton
                    duration: 100
                }
            }
        ]
    }

    ToolButton {
        id: paletteButton
        anchors {
            right: settingsButton.left
            verticalCenter: parent.verticalCenter
        }

        Image {
            id: paletteButtonIcon
            anchors.centerIn: parent
            source: "images/palette-24.png"
        }
    }
}

