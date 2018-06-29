/*******************************************************************/

/* Original File Name: TitleBar.qml                                */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Замена системной шапке с основными кнопками
                управления.                                        */


/*******************************************************************/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Rectangle {
    id: titleBar
    height: 24
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    color: darkColor

    function isMaximize() {
        return mainWindow.visibility === ApplicationWindow.Maximized
    }

    //close
    Rectangle {
        id: closeButton
        anchors.right: parent.right
        width: 24
        height: 24
        color: titleBar.color

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
            onEntered: parent.color = closeButtonColor
            onExited: parent.color = titleBar.color
            onClicked: close()
        }

        MouseArea {
            anchors {
                top: topArea.bottom
                bottom: bottomArea.top
                left: leftArea.right
                right: rightArea.left
            }

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
    }

    //min max
    Rectangle {
        id: minMaxButton
        anchors.right: closeButton.left
        width: 24
        height: 24
        color: parent.color

        Image {
            id: minMaxButtonIcon
            source: isMaximize() ? "img/minimizeWindow.png" : "img/maximizeWindow.png"
            anchors.centerIn: parent
        }

        MouseArea {
            id: minMaxButtonMoseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = lightColor
            onExited: parent.color = darkColor
            onClicked: {
                isMaximize() ? mainWindow.showNormal() : mainWindow.showMaximized()
            }
        }
    }

    //hide
    Rectangle {
        id: hideButton
        anchors.right: minMaxButton.left
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
            onEntered: parent.color = lightColor
            onExited: parent.color = darkColor
            onClicked: mainWindow.showMinimized()
        }
    }

    //position change area
    MouseArea {
        id: posChangedMouseArea
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            right: hideButton.left
        }

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
        id: topArea
        height: borderSize

        anchors {
            top: parent.top
            left: parent.left
            leftMargin: cornerSize
            right: parent.right
            rightMargin: cornerSize
        }

        cursorShape: Qt.SizeVerCursor

        onPressed: {
            previousY = mouseY
        }

        onMouseYChanged: {
            var dy = mouseY - previousY
            if ((mainWindow.height - dy) >= mainWindow.minimumHeight) {
                mainWindow.setY(mainWindow.y + dy)
                mainWindow.setHeight(mainWindow.height - dy)
            }
        }
    }

    MouseArea {
        id: topLeftArea
        height: cornerSize
        width: cornerSize
        anchors {
            top: parent.top
            left: parent.left
        }

        cursorShape:  Qt.SizeFDiagCursor

        onPressed: {
            previousX = mouseX
            previousY = mouseY
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            if ((mainWindow.width - dx) >= mainWindow.minimumWidth) {
                mainWindow.setX(mainWindow.x + dx)
                mainWindow.setWidth(mainWindow.width - dx)
            }
        }

        onMouseYChanged: {
            var dy = mouseY - previousY
            if ((mainWindow.height - dy) >= mainWindow.minimumHeight) {
                mainWindow.setY(mainWindow.y + dy)
                mainWindow.setHeight(mainWindow.height - dy)
            }
        }
    }

    MouseArea {
        id: topRightArea
        height: cornerSize
        width: cornerSize
        anchors {
            top: parent.top
            right: parent.right
        }

        cursorShape:  Qt.SizeBDiagCursor

        onPressed: {
            previousX = mouseX
            previousY = mouseY
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            if ((mainWindow.width + dx) >= mainWindow.minimumWidth) {
                mainWindow.setWidth(mainWindow.width + dx)
            }
        }

        onMouseYChanged: {
            var dy = mouseY - previousY
            if ((mainWindow.height - dy) >= mainWindow.minimumHeight) {
                mainWindow.setY(mainWindow.y + dy)
                mainWindow.setHeight(mainWindow.height - dy)
            }
        }
    }

    MouseArea {
        id: leftArea
        width: borderSize
        anchors {
            left: parent.left
            top: topLeftArea.bottom
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
            top: topRightArea.bottom
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
}
