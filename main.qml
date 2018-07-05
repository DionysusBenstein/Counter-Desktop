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
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3

import com.benstein.counter 1.4
import com.benstein.settings 1.1

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    minimumWidth: 550
    minimumHeight: 350
    flags: Qt.FramelessWindowHint | Qt.Window

    Material.accent: primaryColor
    Material.theme: appBar.popupMenu.currentTheme === 1 ? Material.Dark : Material.Light

    property color closeButtonColor: "#e81123"
    property color lightFontColor: "#9a9a9a"
    property color darkFontColor: "#404040"
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

    FontLoader { id: robotoLightFont; source: "fonts/Roboto-Light.ttf"       }
    FontLoader { id: robotoMediumFont; source: "fonts/Roboto-Medium.ttf"     }
    FontLoader { id: robotoRegularFont; source: "fonts/Roboto-Regular_0.ttf" }
    FontLoader { id: robotoThinFont; source: "fonts/Roboto-Thin_0.ttf"       }

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
        onPressed: previousY = mouseY
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
            bottom: bottomArea.top
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
            top: appBar.bottom
            bottom: bottomArea.top
        }

        cursorShape: Qt.SizeHorCursor
        onPressed: previousX = mouseX
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

        onPositionChanged: if (isMaximize()) mainWindow.showNormal()
        onDoubleClicked: {
            previousX = mouseX
            previousY = mouseY
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

    TitleBar { id: titleBar }
    AppBar   { id: appBar   }
    Counter  { id: backEnd  }
    Settings { id: setting  }

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
            text: setting.value
            focus: true
            anchors.fill: input
            selectByMouse: true
            persistentSelection: true
            wrapMode: Text.WrapAnywhere
            placeholderText: qsTr("Введите текст...")
            ContextMenu { id: contextMenu; anchors.fill: parent }
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
            text: qsTr(" Не учитывать пробелы")
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
            text: qsTr(" Не учитывать знаки")
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
            text: qsTr(" Посчитать количество строк")
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
            text: qsTr(" Посчитать количество слов")
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

    Item {
        anchors {
            right: rightArea.left
            left: cbGrid.right
            top: input.bottom
            bottom: bottomArea.top
            margins: 19
        }

        width: 100
        height: 100

        Text {
            id: counter
            anchors.centerIn: parent
            color: Material.theme === Material.Dark ? "white" : darkFontColor
            text: {
                if (spacesCounter.checked) {
                    backEnd.lengthWithoutSpaces(input.text)
                } else if (signsCounter.checked) {
                    backEnd.lengthWithoutSigns(input.text)
                } else if (wordsCounter.checked) {
                    backEnd.wordsCounter(input.text)
                } else if (linesCounter.checked) {
                    input.lineCount.toString()
                } else {
                    input.text.length.toString()
                }
            }

            font.pixelSize: 40
            onTextChanged: {
                textOpacityAnim.running = true
                textScaleAnim.running = true
            }
        }
    }

    ScaleAnimator {
        id: textScaleAnim
        easing.type: Easing.OutCubic
        target: counter
        from: 0; to: 1
        running: false
        duration: 100
    }

    OpacityAnimator {
        id: textOpacityAnim
        easing.type: Easing.OutCubic
        target: counter
        from: 0; to: 1
        running: false
        duration: 100
    }
}
