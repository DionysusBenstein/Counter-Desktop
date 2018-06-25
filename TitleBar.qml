/*******************************************************************/

/* Original File Name: TitleBar.qml                                */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Замена системной шапке с основными кнопками
                управления.                                        */


/*******************************************************************/

import QtQuick 2.10

Rectangle {
    id: actionBar
    height: 24
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    color: "#b0003a"

    property int windowSizeCheck: 0

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

    //min max
    Rectangle {
        id: minMaxButton
        anchors.right: closeButton.left
        width: 24
        height: 24
        color: parent.color

        Image {
            source: windowSizeCheck % 2 === 0 ? "img/maximizeWindow.png" : "img/minimizeWindow.png"
            anchors.centerIn: parent
        }

        MouseArea {
            id: minMaxButtonMoseArea
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.color = "#ff6090"
            onExited: parent.color = "#b0003a"
            onClicked: {
                windowSizeCheck++
                windowSizeCheck % 2 === 0 ? mainWindow.showNormal() : mainWindow.showMaximized()
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
            onEntered: parent.color = "#ff6090"
            onExited: parent.color = "#b0003a"
            onClicked: mainWindow.showMinimized()
        }
    }
}
