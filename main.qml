/*******************************************************************/

/* Original File Name: main.qml                                    */

/* Date: 21-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Основное окно программы.                           */

/*******************************************************************/

import QtQuick 2.10
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
    minimumWidth: 640
    minimumHeight: 480
    title: "Counter v2.1.6-beta1"
    color: "#eeeeee"

    flags: Qt.FramelessWindowHint

    property int previousX
    property int previousY

    MouseArea {
        id: topArea
        height: 5
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        cursorShape: Qt.SizeVerCursor
        onPressed: previousY = mouseY

        onMouseYChanged: {
            var dy = mouseY - previousY
            mainWindow.setY(mainWindow.y + dy)
            mainWindow.setHeight(mainWindow.height - dy)
        }
    }

    MouseArea {
        id: bottomArea
        height: 5
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        cursorShape: Qt.SizeVerCursor
        onPressed: previousY = mouseY

        onMouseYChanged: {
            var dy = mouseY - previousY
            mainWindow.setHeight(mainWindow.height + dy)
        }
    }

    MouseArea {
        id: bottomLeftArea
        width: 5
        height: 5

        Rectangle {
            anchors.fill: parent
            color: "red"
        }

        anchors {
            bottom: parent.bottom
            left: parent.left
        }

        cursorShape: Qt.SizeHorCursor | Qt.SizeVerCursor
        onPressed: previousY = mouseY

        onMouseYChanged: {
            var dy = mouseY - previousY
            mainWindow.setHeight(mainWindow.height + dy)
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            mainWindow.setX(mainWindow.x + dx)
            mainWindow.setWidth(mainWindow.width - dx)
        }
    }

    MouseArea {
        id: bottomRightArea
        width: 5
        height: 5

        Rectangle {
            anchors.fill: parent
            color: "red"
        }

        anchors {
            bottom: parent.bottom
            right: parent.right
        }

        cursorShape: Qt.SizeVerCursor | Qt.SizeHorCursor
        onPressed: previousY = mouseY

        onMouseYChanged: {
            var dy = mouseY - previousY
            mainWindow.setHeight(mainWindow.height + dy)
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            mainWindow.setWidth(mainWindow.width + dx)
        }
    }

    MouseArea {
        id: leftArea
        width: 5
        anchors {
            top: topArea.bottom
            bottom: bottomArea.top
            left: parent.left
        }

        cursorShape: Qt.SizeHorCursor
        onPressed: previousX = mouseX

        onMouseXChanged: {
            var dx = mouseX - previousX
            mainWindow.setX(mainWindow.x + dx)
            mainWindow.setWidth(mainWindow.width - dx)
        }
    }

    MouseArea {
        id: rightArea
        width: 5
        anchors {
            top: topArea.bottom
            bottom: bottomArea.top
            right: parent.right
        }

        cursorShape:  Qt.SizeHorCursor
        onPressed: previousX = mouseX

        onMouseXChanged: {
            var dx = mouseX - previousX
            mainWindow.setWidth(mainWindow.width + dx)
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

    Material.accent: "#e91e63"

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

        CheckBox { id: spacesCounter; text: "Не считать пробелы"         }
        CheckBox { id: signsCounter; text:  "Не считать знаки"           }
        CheckBox { id: linesCounter; text:  "Посчитать количество строк" }
        CheckBox { id: wordsCounter; text:  "Посчитать количество слов"  }
    }

    Item {
        anchors.right: rightArea.left
        anchors.left: cbGrid.right
        anchors.top: input.bottom
        anchors.bottom: bottomArea.top
        anchors.margins: 19

        Text {
            anchors.centerIn: parent

            text: {
                if (spacesCounter.checked) {
                    counterBackEnd.spacesCounter(input.text)
                } else if (signsCounter.checked) {
                    //
                } else if (linesCounter.checked) {
                    //
                } else if (wordsCounter.checked) {
                    //
                } else {
                    input.text.length
                }
            }

            font.pixelSize: 40
        }
    }
}
