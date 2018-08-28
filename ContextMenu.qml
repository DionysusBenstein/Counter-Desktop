/*******************************************************************/

/* Original File Name: ContextMenu.qml                             */

/* Date: 01-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Контекстное меню для Text Area.                    */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Controls 2.4

Item {
    MouseArea {
        id: inputMouseArea
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        cursorShape: Qt.IBeamCursor
        onClicked: contextMenu.popup()
    }

    Menu {
        id: contextMenu
        MenuItem { text: qsTr("Отменить"/*"Undo"*/); onTriggered: input.undo()                                         }
        MenuItem { text: qsTr("Повторить"/*"Redo"*/); onTriggered: input.redo()                                        }
        MenuSeparator { contentItem: Rectangle { implicitHeight: 1; color: "#1E000000" }                               }
        MenuItem { text: qsTr("Вырезать"/*"Cut"*/); enabled: input.selectedText; onTriggered: input.cut()              }
        MenuItem { text: qsTr("Копировать"/*"Copy"*/); enabled: input.selectedText; onTriggered: input.copy()          }
        MenuItem { text: qsTr("Вставить"/*"Paste"*/); enabled: input.canPaste; onTriggered: input.paste()              }
        MenuItem { text: qsTr("Удалить"/*"Delete"*/); enabled: input.selectedText; onTriggered: input.clear()          }
        MenuSeparator { contentItem: Rectangle { implicitHeight: 1; color: "#1E000000" }                               }
        MenuItem { text: qsTr("Выделить всё"/*"Select All"*/); enabled: input.canPaste; onTriggered: input.selectAll() }
    }
}
