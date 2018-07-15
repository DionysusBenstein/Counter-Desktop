/*******************************************************************/

/* Original File Name: TitleBar.qml                                */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Замена системной шапке с основными кнопками
                управления окном.                                  */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Controls 2.4

Rectangle {
    id: titleBar
    height: 24
    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
    }

    color: darkColor

    //close
    Rectangle {
        id: closeButton
        width: 24
        height: 24
        anchors.right: parent.right
        color: darkColor

        Rectangle {
            width: 2
            height: 12
            anchors.centerIn: parent
            antialiasing: true
            rotation: 45
        }

        Rectangle {
            width: 2
            height: 12
            anchors.centerIn: parent
            antialiasing: true
            rotation: 135
        }

        MouseArea {
            id: closeButtonMoseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = closeButtonColor
            onExited: parent.color = darkColor
            onClicked: close()
        }

        MouseArea {
            anchors {
                right: rightArea.left
                left: leftArea.right
                top: topArea.bottom
                bottom: bottomArea.top
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
        width: 24
        height: 24
        anchors.right: closeButton.left
        color: darkColor

        Image {
            id: minMaxButtonIcon
            anchors.centerIn: parent
            source: isMaximize() ? "images/minimizeWindow.png" : "images/maximizeWindow.png"
        }

        MouseArea {
            id: minMaxButtonMoseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: isMaximize() ? mainWindow.showNormal() : mainWindow.showMaximized()
            onEntered: parent.color = lightColor
            onExited: parent.color = darkColor
        }
    }

    //hide
    Rectangle {
        id: hideButton
        width: 24
        height: 24
        anchors.right: minMaxButton.left
        color: darkColor

        Rectangle {
            width: 10
            height: 2
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 8
            }
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
        onPressed: previousY = mouseY
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

        cursorShape: Qt.SizeBDiagCursor
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
        onPressed: previousX = mouseX
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
        onPressed: previousX = mouseX
        onMouseXChanged: {
            var dx = mouseX - previousX
            if ((mainWindow.width + dx) >= mainWindow.minimumWidth) {
                mainWindow.setWidth(mainWindow.width + dx)
            }
        }
    }
}
