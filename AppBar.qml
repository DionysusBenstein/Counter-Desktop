/*******************************************************************/

/* Original File Name: AppBar.qml                                  */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация AppBar.                                 */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

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
            text: "Counter"/*+" v2.6.1"*/
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
            Action { text: qsTr("О программе"); icon.source: "images/aboutProjectIconBlack-24dp.png" }
        }
    }

    //    ToolButton {
    //        id: settingsButton
    //        anchors {
    //            right: moreButton.left
    //            verticalCenter: parent.verticalCenter
    //        }

    //        state: "hovered"
    //        onClicked: state = (state === "hovered") ? "notHovered" : "hovered"

    //        Image {
    //            id: settingsButtonIcon
    //            anchors.centerIn: parent
    //            source: "images/settings-24dp.png"
    //        }

    //        states: State {
    //            name: "notHovered"

    //            PropertyChanges {
    //                target: settingsButtonIcon
    //                rotation: 45
    //            }
    //        }

    //        State {
    //            name: "hovered"

    //            PropertyChanges {
    //                target: settingsButtonIcon
    //                rotation: -45
    //            }
    //        }

    //        transitions: [
    //            Transition {
    //                from: "notHovered"; to: "hovered"

    //                RotationAnimator {
    //                    target: settingsButton
    //                    duration: 100
    //                }
    //            },

    //            Transition {
    //                from: "hovered"; to: "notHovered"

    //                RotationAnimator {
    //                    target: settingsButton
    //                    duration: 100
    //                }
    //            }
    //        ]
    //    }

    ToolButton {
        id: paletteButton
        anchors {
            right: moreButton.left
            verticalCenter: parent.verticalCenter
        }

        onClicked: popup.open()

        Image {
            id: paletteButtonIcon
            anchors.centerIn: parent
            source: "images/palette-24.png"
        }
    }

    Popup {
        id: popup
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        parent: Overlay.overlay
        width: 300
        height: 300
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
        bottomPadding: 0
        topPadding: 25
        leftPadding: 25

        //        Rectangle {
        //            anchors.fill: parent
        //            color: lightColor
        //        }

        Text {
            id: popupTitle
            anchors {
                left: parent.left
                top: parent.top
            }

            text: qsTr("Выбрать цвет")
            color: darkFontColor
            font {
                pixelSize: 20
                family: robotoMediumFont.name
            }
        }

        ComboBox {
            id: popupComboBox
            width: 150
            model: ["Light Theme", "Dark Theme"]
            anchors {
                left: parent.left
                top: popupTitle.bottom
                topMargin: 25
            }
        }

        Grid {
            anchors {
                left: parent.left
                right: parent.right
                top: popupComboBox.bottom
                bottom: doneButton.top
                topMargin: 16
            }

            spacing: 4
            columns: 7
            rows: 3

            Rectangle {
                width: 32
                height: 32
                color: "#e91e63"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#F44336"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#9C27B0"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#673AB7"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#3F51B5"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#2196F3"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#009688"
                radius: width / 2
            }
            //
            Rectangle {
                width: 32
                height: 32
                color: "#4CAF50"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#FF9800"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#FF5722"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#795548"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#9E9E9E"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#607D8B"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#EF9A9A"
                radius: width / 2
            }
            //
            Rectangle {
                width: 32
                height: 32
                color: "#F48FB1"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#CE93D8"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#B39DDB"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#616161"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#424242"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#263238"
                radius: width / 2
            }

            Rectangle {
                width: 32
                height: 32
                color: "#757575"
                radius: width / 2
            }
        }


        Button {
            id: doneButton
            text: qsTr("OK")
            anchors {
                right: parent.right
                bottom: parent.bottom
            }

            flat: true
            Material.foreground: primaryColor
            onClicked: popup.close()
        }

        Button {
            id: cancelButton
            text: qsTr("Отмена"/*"Cancel"*/)
            anchors {
                right: doneButton.left
                bottom: parent.bottom
                rightMargin: 8
            }

            flat: true
            Material.foreground: primaryColor
            onClicked: popup.close()
        }
    }
}

