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
        MenuItem { text: qsTr("Вырезать"/*"Cut"*/); enabled: input.selectedText; onTriggered: input.cut()     }
        MenuItem { text: qsTr("Копировать"/*"Copy"*/); enabled: input.selectedText; onTriggered: input.copy() }
        MenuItem { text: qsTr("Вставить"/*"Paste"*/); enabled: input.canPaste; onTriggered: input.paste()     }
    }
}
