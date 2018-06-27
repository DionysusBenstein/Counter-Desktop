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

//Main:  #e91e63
//Dark:  #b0003a
//Light: #ff6090

ApplicationWindow {
    id: mainWindow
    visible: true
    width: 640
    height: 480
    minimumWidth: 550
    minimumHeight: 350
    title: "Counter v2.3.4-beta1"
    color: "#eeeeee"

    flags: Qt.FramelessWindowHint | Qt.Window

    Material.accent: "#e91e63"

    property int previousX
    property int previousY
    property int borderSize: 3
    property int cornerSize: 5

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
            top: topArea.bottom
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
            top: topArea.bottom
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

    TitleBar { id: titleBar }
    AppBar { id: appBar }

    Counter { id: counterBackEnd }

    ScrollView {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: appBar.bottom
        anchors.bottom: cbGrid.top
        anchors.margins: 19

        TextArea {
            id: input
            wrapMode: Text.WrapAnywhere
            placeholderText: "Введите текст..."
        }
    }

    Grid {
        id: cbGrid
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 19

        rows: 2
        columns: 2

        CheckBox {
            id: spacesCounter
            text: "Не считать пробелы"
            checkState: {
                if (linesCounter.checked || wordsCounter.checked) {
                    Qt.Unchecked
                }
            }
        }

        CheckBox {
            id: signsCounter
            text:  "Не считать знаки"
            checkState: {
                if (linesCounter.checked || wordsCounter.checked) {
                    Qt.Unchecked
                }
            }
        }

        CheckBox {
            id: linesCounter;
            text:  "Посчитать количество строк"
            checkState: {
                if (wordsCounter.checked || signsCounter.checked || spacesCounter.checked) {
                    Qt.Unchecked
                }
            }
        }

        CheckBox {
            id: wordsCounter;
            text:  "Посчитать количество слов"
            checkState: {
                if (linesCounter.checked || signsCounter.checked || spacesCounter.checked) {
                    Qt.Unchecked
                }
            }
        }


        Rectangle {
            anchors {
                left: cbGrid.right
                right: rightArea.left
                top: input.bottom
                bottom: bottomArea.top
                margins: 19
            }

            //width: 50
            //height: 50
            color: "red"

            Text {
                anchors.centerIn: parent

                text: {
                    if (spacesCounter.checked) {
                        counterBackEnd.spacesCounter(input.text)
                    } else if (signsCounter.checked) {
                        //
                    } else if (linesCounter.checked) {
                        counterBackEnd.linesCounter(input.text)
                    } else if (wordsCounter.checked) {
                        counterBackEnd.wordsCounter(input.text)
                    } else {
                        input.text.length
                    }
                }

                font.pixelSize: 40
            }
        }
    }
}
