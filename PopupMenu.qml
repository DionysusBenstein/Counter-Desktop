/*******************************************************************/

/* Original File Name: PopupMenu.qml                               */

/* Date: 21-06-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Всплывающее окно с кастомизацией интерфейса.       */

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

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
    rightPadding: 0

    property alias currentTheme: popupComboBox.currentIndex

    Text {
        id: popupTitle
        anchors {
            left: parent.left
            top: parent.top
        }

        text: qsTr("Выбрать цвет")
        color: Material.theme === Material.Dark ? "white" : darkFontColor
        font {
            pixelSize: 20
            family: robotoMediumFont.name
        }
    }

    ComboBox {
        id: popupComboBox
        width: 160
        model: [qsTr("Светлая тема"), qsTr("Тёмная тема")]
        anchors {
            left: parent.left
            top: popupTitle.bottom
            topMargin: 25
        }
    }

    GridView {
        id: colorsView
        cellWidth: 36
        cellHeight: 36
        clip: true
        anchors {
            left: parent.left
            right: parent.right
            top: popupComboBox.bottom
            bottom: doneButton.top
            topMargin: 16
            rightMargin: 23
        }
        delegate: colorsViewDelegate
        model: colorsViewModel
    }

    ListModel {
        id: colorsViewModel
        ListElement { customPrimaryColor: "#e91e63"; customLightColor: "#ff6090"; customDarkColor: "#b0003a" } // 1
        ListElement { customPrimaryColor: "#F44336"; customLightColor: "#ff7961"; customDarkColor: "#ba000d" } // 2
        ListElement { customPrimaryColor: "#9C27B0"; customLightColor: "#d05ce3"; customDarkColor: "#6a0080" } // 3
        ListElement { customPrimaryColor: "#673AB7" } // 4
        ListElement { customPrimaryColor: "#3F51B5" } // 5
        ListElement { customPrimaryColor: "#2196F3" } // 6
        ListElement { customPrimaryColor: "#009688" } // 7
        ListElement { customPrimaryColor: "#4CAF50" } // 8
        ListElement { customPrimaryColor: "#FF9800" } // 9
        ListElement { customPrimaryColor: "#FF5722" } // 10
        ListElement { customPrimaryColor: "#795548" } // 11
        ListElement { customPrimaryColor: "#9E9E9E" } // 12
        ListElement { customPrimaryColor: "#607D8B" } // 13
        ListElement { customPrimaryColor: "#EF9A9A" } // 14
        ListElement { customPrimaryColor: "#F48FB1" } // 15
        ListElement { customPrimaryColor: "#CE93D8" } // 16
        ListElement { customPrimaryColor: "#B39DDB" } // 17
        ListElement { customPrimaryColor: "#616161" } // 18
        ListElement { customPrimaryColor: "#282E33" } // 19
        ListElement { customPrimaryColor: "#263238" } // 20
        ListElement { customPrimaryColor: "#757575" } // 21
    }

    Component  {
        id: colorsViewDelegate
        Rectangle {
            width: 32; height: 32
            color: customPrimaryColor
            radius: width / 2
            //clip: true

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    primaryColor = customPrimaryColor
                    lightColor = customLightColor
                    darkColor = customDarkColor
                }
            }
        }
    }

    Button {
        id: doneButton
        text: qsTr("OK")
        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 2
            rightMargin: 8
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
            bottomMargin: 2
        }

        flat: true
        Material.foreground: primaryColor
        onClicked: {

            popup.close()
        }
    }
}
