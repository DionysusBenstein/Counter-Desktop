/*******************************************************************/

/* Original File Name: main.qml                                    */

/* Date: 21-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Основное окно программы.                           */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

import com.benstein.counter 1.3

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    minimumWidth: 550
    minimumHeight: 350
    title: "Counter v2.3.8-beta1"

    flags: Qt.FramelessWindowHint | Qt.Window

    Material.accent: primaryColor

    property color closeButtonColor: "#e81123"
    property color primaryColor: "#e91e63"
    property color lightColor: "#ff6090"
    property color darkColor: "#b0003a"
    property int borderSize: 3
    property int cornerSize: 5
    property int previousX
    property int previousY

    function isMaximize() {
        return mainWindow.visibility === ApplicationWindow.Maximized
    }

    MouseArea {
        id: bottomArea
        height: borderSize

        anchors {
            bottom: parent.bottom
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
            if ((mainWindow.height + dy) >= mainWindow.minimumHeight) {
                mainWindow.setHeight(mainWindow.height + dy)
            }
        }
    }

    MouseArea {
        id: leftArea
        width: borderSize
        anchors {
            left: parent.left
            top: appBar.bottom
            topMargin: cornerSize
            bottom: bottomArea.top
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
            top: appBar.bottom
            topMargin: cornerSize
            bottom: bottomArea.top
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

    MouseArea {
        id: bottomLeftArea
        height: cornerSize
        width: cornerSize

        anchors {
            bottom: parent.bottom
            left: parent.left
        }

        cursorShape:  Qt.SizeBDiagCursor

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
            if ((mainWindow.height + dy) >= mainWindow.minimumHeight) {
                mainWindow.setHeight(mainWindow.height + dy)
            }
        }
    }

    MouseArea {
        id: bottomRightArea
        height: cornerSize
        width: cornerSize

        anchors {
            bottom: parent.bottom
            right: parent.right
        }

        cursorShape:  Qt.SizeFDiagCursor

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
            if ((mainWindow.height + dy) >= mainWindow.minimumHeight) {
                mainWindow.setHeight(mainWindow.height + dy)
            }
        }
    }

    MouseArea {
        id: posChangedMouseArea
        anchors {
            top: appBar.bottom
            bottom: bottomArea.top
            left: leftArea.right
            right: rightArea.left
        }

        onDoubleClicked: {
            isMaximize() ? mainWindow.showNormal() : mainWindow.showMaximized()
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

    TitleBar { id: titleBar       }
    AppBar   { id: appBar         }
    Counter  { id: counterBackEnd }

    ScrollView {
        anchors {
            left: parent.left
            right: parent.right
            top: appBar.bottom
            bottom: cbGrid.top
            margins: 19
        }

        TextArea {
            id: input
            wrapMode: Text.WrapAnywhere
            placeholderText: "Введите текст..."
        }
    }

    GridLayout {
        id: cbGrid
        anchors {
            bottom: parent.bottom
            left: parent.left
            margins: 19
        }

        rows: 2
        columns: 2

        CheckBox {
            id: spacesCounter
            text: "Не считать пробелы"

            onClicked: {
                if (linesCounter.checked || wordsCounter.checked) {
                    wordsCounter.checked = false
                    linesCounter.checked = false
                    spacesCounter.checked = true
                }
            }
        }

        CheckBox {
            id: signsCounter
            text:  "Не считать знаки"

            onClicked: {
                if (linesCounter.checked || wordsCounter.checked) {
                    wordsCounter.checked = false
                    linesCounter.checked = false
                    signsCounter.checked = true
                }
            }
        }

        CheckBox {
            id: linesCounter
            text:  "Посчитать количество строк"

            onClicked: {
                if (wordsCounter.checked || signsCounter.checked || spacesCounter.checked) {
                    wordsCounter.checked = false
                    signsCounter.checked = false
                    spacesCounter.checked = false
                    linesCounter.checked = true
                }
            }
        }

        CheckBox {
            id: wordsCounter;
            text:  "Посчитать количество слов"

            onClicked: {
                if (linesCounter.checked || signsCounter.checked || spacesCounter.checked) {
                    linesCounter.checked = false
                    signsCounter.checked = false
                    spacesCounter.checked = false
                    wordsCounter.checked = true
                }
            }
        }
    }

    Rectangle {
        anchors {
            right: rightArea.left
            left: cbGrid.right
            top: input.bottom
            bottom: bottomArea.top
            margins: 19
        }
        color: parent.color
        width: 100
        height: 100

        Text {
            anchors.centerIn: parent
            text: {
                if (spacesCounter.checked) {
                    counterBackEnd.lengthWithoutSpaces(input.text)
                } else if (signsCounter.checked) {
                    counterBackEnd.lengthWithoutSigns(input.text)
                } else if (linesCounter.checked) {
                    counterBackEnd.linesCounter(input.text)
                } else if (wordsCounter.checked) {
                    counterBackEnd.wordsCounter(input.text)
                } else {
                    input.text.length.toString()
                }
            }
            font.pixelSize: 40
        }
    }
}
