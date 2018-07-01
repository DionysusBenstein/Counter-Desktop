/*******************************************************************/

/* Original File Name: ContextMenu.qml                             */

/* Date: 01-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Реализация контекстного меню для Text Area.        */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    MouseArea {
        id: inputMouseArea
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        cursorShape: Qt.IBeamCursor
        onClicked: {
            if (mouse.button === Qt.RightButton) {
                contextMenu.popup()
            }
        }
    }

    Menu {
        id: contextMenu
        Action { text: qsTr("Вырезать"/*"Cut"*/); onTriggered: input.cut()     }
        Action { text: qsTr("Копировать"/*"Copy"*/); onTriggered: input.copy() }
        Action { text: qsTr("Вставить"/*"Paste"*/); onTriggered: input.paste() }
    }
}
