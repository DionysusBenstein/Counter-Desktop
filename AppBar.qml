/*******************************************************************/

/* Original File Name: AppBar.qml                                  */

/* Date: 23-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Верхняя панель приложения.                         */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

ToolBar {
    id: appBar
    height: 56
    anchors {
        left: parent.left
        right: parent.right
        top: titleBar.bottom
    }


    property alias popupMenu: popupMenu

    PopupMenu { id: popupMenu }
    About     { id: aboutWnd  }

    Rectangle {
        id: appBarRect
        anchors.fill: parent
        color: primaryColor

        Text {
            id: headerText
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                margins: 19
            }

            text: "Counter"
            color: "white"
            font {
                family: robotoMediumFont.name
                pointSize: 15
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
            bottom: parent.bottom
            topMargin: cornerSize
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
            bottom: parent.bottom
            topMargin: cornerSize
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

        onClicked: moreButtonMenu.open()

        Image {
            id: moreButtonIcon
            anchors.centerIn: parent
            source: "images/more_vert-24dp.png"
        }

        Menu {
            id: moreButtonMenu

            MenuItem {
                text: qsTr("Язык")
                icon.source: "images/language-24dp.png"
                onTriggered: popupLang.open()

                Popup {
                    id: popupLang
                    x: Math.round((parent.width - width) / 2)
                    y: Math.round((parent.height - height) / 2)
                    width: 300; height: 200
                    //closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                    parent: Overlay.overlay
                    modal: true
                    focus: true
                    topPadding: 25
                    leftPadding: 25
                    rightPadding: 0
                    bottomPadding: 0

                    Text {
                        id: popupLangTitle
                        anchors {
                            left: parent.left
                            top: parent.top
                        }

                        text: qsTr("Язык"/*"Language"*/)
                        color: Material.theme === Material.Dark ? "white" : darkFontColor
                        font {
                            pixelSize: 20
                            family: robotoMediumFont.name
                        }
                    }

                    ComboBox {
                        id: popupLangComboBox
                        width: 160
                        anchors {
                            left: parent.left
                            top: popupLangTitle.bottom
                            topMargin: 25
                        }
                        model: [qsTr("English"), qsTr("Русский")]
                    }

                    Button {
                        id: doneButton
                        anchors {
                            right: parent.right
                            bottom: parent.bottom
                            bottomMargin: 2
                            rightMargin: 8
                        }

                        text: qsTr("OK")
                        Material.foreground: primaryColor
                        onClicked: popupLang.close()
                        flat: true
                    }

                    Button {
                        id: cancelButton
                        anchors {
                            right: doneButton.left
                            bottom: parent.bottom
                            rightMargin: 8
                            bottomMargin: 2
                        }

                        text: qsTr("Отмена"/*"Cancel"*/)
                        Material.foreground: primaryColor
                        onClicked: popupLang.close()
                        flat: true
                    }
                }
            }

            MenuItem {
                text: qsTr("О программе")
                icon.source: "images/aboutProjectIconBlack-24dp.png"
                onTriggered: aboutWnd.open()
            }
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

        onClicked: popupMenu.open()

        Image {
            id: paletteButtonIcon
            anchors.centerIn: parent
            source: "images/palette-24.png"
        }
    }
}

