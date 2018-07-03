/*******************************************************************/

/* Original File Name: About.qml                                   */

/* Date: 02-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Страница с информацией о программе и разработчиках.*/

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Dialogs 1.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

Popup {
    id: popup
    x: Math.round((parent.width - width) / 2)
    y: Math.round((parent.height - height) / 2)
    parent: Overlay.overlay
    width: 426
    height: 320
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    padding: 0

    Rectangle {
        id: aboutWndRect
        width: aboutWndTitle.width + 50
        color: primaryColor
        clip: true
        anchors {
            left: parent.left
            top:parent.top
            bottom: parent.bottom
        }

        //for material design click animation
        Button {
            anchors.fill: parent
            scale: 1.1
            flat: true
        }
    }

    Text {
        id: aboutWndTitle
        anchors {
            left: parent.left
            top: parent.top
            margins: 25
        }

        text: qsTr("О программе")
        color: "white"
        font {
            pixelSize: 20
            family: robotoMediumFont.name
        }
    }

    Image {
        id: icon
        anchors {
            top: aboutWndTitle.bottom
            topMargin: 25
            horizontalCenter: aboutWndRect.horizontalCenter
        }
        source: "images/icon-100px.png"
    }

    Text {
        id: appName
        text: "<b>Counter</b>"
        color: "white"
        wrapMode: Text.WordWrap
        font {
            pixelSize: 18
            family: robotoMediumFont.name
        }

        anchors {
            top: icon.bottom
            left: parent.left
            topMargin: 25
            leftMargin: 25
        }
    }

    Text {
        id: version
        text: qsTr("Версия: 2.7.1")
        color: "white"
        wrapMode: Text.WordWrap
        font {
            pixelSize: 16
            family: robotoMediumFont.name
        }

        anchors {
            top: appName.bottom
            left: parent.left
            topMargin: 5
            leftMargin: 25
        }
    }

    Text {
        id: author
        text: "Автор: \nDionysus Benstein"
        color: "white"
        wrapMode: Text.WordWrap
        font {
            pixelSize: 16
            family: robotoMediumFont.name
        }

        anchors {
            top: version.bottom
            left: parent.left
            topMargin: 5
            leftMargin: 25
        }
    }

    Text {
        id: about
        text: qsTr("<b>Counter</b> — бесплатное настольное кроссплатформенное приложение,
                    которое подсчитывает количество символов и слов в тексте.")
        color: Material.theme === Material.Dark ? "white" : darkFontColor
        wrapMode: Text.WordWrap
        font {
            pixelSize: 16
            family: robotoMediumFont.name
        }

        anchors {
            right: parent.right
            left: aboutWndRect.right
            top: parent.top
            topMargin: 25
            leftMargin: 19
            rightMargin: 19
        }
    }

    MouseArea {
        anchors.fill: copyright
        cursorShape: Qt.PointingHandCursor
    }

    Text {
        id: copyright
        color: darkFontColor
        onLinkActivated: Qt.openUrlExternally("https://github.com/DionysusBenstein")
        text: qsTr("<a href=\"https://github.com/DionysusBenstein\">Copyright © 2018 Dionysus Benstein. Все права защищены.</a>")
        wrapMode: Text.WordWrap
        font {
            pixelSize: 15
            family: robotoMediumFont.name
        }

        anchors {
            right: parent.right
            left: aboutWndRect.right
            top: about.bottom
            topMargin: 25
            leftMargin: 19
            rightMargin: 19
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
}
