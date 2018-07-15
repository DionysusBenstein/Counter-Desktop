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
import Qt.labs.settings 1.0
import QtQuick.Controls.Material 2.3

Popup {
    id: popup
    x: Math.round((parent.width - width) / 2)
    y: Math.round((parent.height - height) / 2)
    width: 300; height: 300
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    parent: Overlay.overlay
    modal: true
    focus: true
    bottomPadding: 0
    rightPadding: 0
    topPadding: 25
    leftPadding: 25

    property alias currentItem: popupComboBox.currentIndex

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
        //row 1
        ListElement { customPrimaryColor: "#e91e63"; customLightColor: "#ff6090"; customDarkColor: "#b0003a" } // 1
        ListElement { customPrimaryColor: "#F44336"; customLightColor: "#ff7961"; customDarkColor: "#ba000d" } // 2
        ListElement { customPrimaryColor: "#9C27B0"; customLightColor: "#d05ce3"; customDarkColor: "#6a0080" } // 3
        ListElement { customPrimaryColor: "#673AB7"; customLightColor: "#9a67ea"; customDarkColor: "#320b86" } // 4
        ListElement { customPrimaryColor: "#3F51B5"; customLightColor: "#757de8"; customDarkColor: "#002984" } // 5
        ListElement { customPrimaryColor: "#4285f4"; customLightColor: "#80b4ff"; customDarkColor: "#0059c1" } // 6
        ListElement { customPrimaryColor: "#009688"; customLightColor: "#52c7b8"; customDarkColor: "#00675b" } // 7
        //row 2
        ListElement { customPrimaryColor: "#4CAF50"; customLightColor: "#80e27e"; customDarkColor: "#087f23" } // 8
        ListElement { customPrimaryColor: "#FF9800"; customLightColor: "#ffc947"; customDarkColor: "#c66900" } // 9
        ListElement { customPrimaryColor: "#fa5770"; customLightColor: "#ff8b9e"; customDarkColor: "#c21a45" } // 10
        ListElement { customPrimaryColor: "#795548"; customLightColor: "#a98274"; customDarkColor: "#4b2c20" } // 11
        ListElement { customPrimaryColor: "#9E9E9E"; customLightColor: "#cfcfcf"; customDarkColor: "#707070" } // 12
        ListElement { customPrimaryColor: "#607D8B"; customLightColor: "#8eacbb"; customDarkColor: "#34515e" } // 13
        ListElement { customPrimaryColor: "#EF9A9A"; customLightColor: "#ffcccb"; customDarkColor: "#ba6b6c" } // 14
        //row 3
        ListElement { customPrimaryColor: "#F48FB1"; customLightColor: "#ffc1e3"; customDarkColor: "#bf5f82" } // 15
        ListElement { customPrimaryColor: "#CE93D8"; customLightColor: "#ffc4ff"; customDarkColor: "#9c64a6" } // 16
        ListElement { customPrimaryColor: "#B39DDB"; customLightColor: "#e6ceff"; customDarkColor: "#836fa9" } // 17
        ListElement { customPrimaryColor: "#004D40"; customLightColor: "#39796b"; customDarkColor: "#00251a" } // 18
        ListElement { customPrimaryColor: "#363640"; customLightColor: "#60606b"; customDarkColor: "#27272F" } // 19
        ListElement { customPrimaryColor: "#616161"; customLightColor: "#8e8e8e"; customDarkColor: "#373737" } // 20
        ListElement { customPrimaryColor: "#757575"; customLightColor: "#a4a4a4"; customDarkColor: "#494949" } // 21

    }

    Component  {
        id: colorsViewDelegate

        Rectangle {
            id: colorsViewDelegateMouseArea
            width: 32; height: 32
            color: customPrimaryColor
            radius: width / 2

            ToolButton {
                anchors.centerIn: parent
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
        Material.foreground: primaryColor
        onClicked: popup.close()
        flat: true
        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 2
            rightMargin: 8
        }
    }

    Button {
        id: cancelButton
        text: qsTr("Отмена"/*"Cancel"*/)
        Material.foreground: primaryColor
        onClicked: popup.close()
        flat: true
        anchors {
            right: doneButton.left
            bottom: parent.bottom
            rightMargin: 8
            bottomMargin: 2
        }
    }
}
