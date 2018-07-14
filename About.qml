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
//import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.3

Popup {
    id: popup
    x: Math.round((parent.width - width) / 2)
    y: Math.round((parent.height - height) / 2)
    width: 426; height: 320
    parent: Overlay.overlay
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    padding: 0
    modal: true
    focus: true
    clip:  true

    Rectangle {
        id: aboutWndRect
        width: aboutWndTitle.width + 50
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        color: primaryColor
        radius: 2
        clip: true

        //for hide right radius of parent rectangle
        Rectangle {
            width: 2
            height: parent.height
            anchors.right: parent.right
            color: parent.color
        }

        //for material design press animation
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

        color: "white"
        text: qsTr("О программе"/*"About"*/)
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
        anchors {
            top: icon.bottom
            left: parent.left
            topMargin: 25
            leftMargin: 25
        }

        color: "white"
        text: "<b>Counter</b>"
        wrapMode: Text.WordWrap
        font {
            pixelSize: 18
            family: robotoMediumFont.name
        }
    }

    Text {
        id: version
        anchors {
            top: appName.bottom
            left: parent.left
            topMargin: 5
            leftMargin: 25
        }

        color: "white"
        text: qsTr("Версия: " + appVersion)
        wrapMode: Text.WordWrap
        font {
            pixelSize: 16
            family: robotoMediumFont.name
        }
    }

    Text {
        id: author
        anchors {
            top: version.bottom
            left: parent.left
            topMargin: 5
            leftMargin: 25
        }

        color: "white"
        text: "Автор: \nDionysus Benstein"
        wrapMode: Text.WordWrap
        font {
            pixelSize: 16
            family: robotoMediumFont.name
        }
    }

    Text {
        id: about
        anchors {
            right: parent.right
            left: aboutWndRect.right
            top: parent.top
            topMargin: 25
            leftMargin: 19
            rightMargin: 19
        }

        color: Material.theme === Material.Dark ? "white" : darkFontColor
        wrapMode: Text.WordWrap
        text: qsTr("<b>Counter</b> — бесплатное настольное кроссплатформенное приложение,
                    которое подсчитывает количество символов и слов в тексте.")

        font {
            pixelSize: 16
            family: robotoMediumFont.name
        }
    }

    MouseArea {
        anchors.fill: copyright
        cursorShape: Qt.PointingHandCursor
    }

    Text {
        id: copyright
        anchors {
            right: parent.right
            left: aboutWndRect.right
            top: about.bottom
            topMargin: 25
            leftMargin: 19
            rightMargin: 19
        }

        linkColor: primaryColor
        text: qsTr("<a href=\"https://github.com/DionysusBenstein\">Copyright © 2018 Dionysus Benstein. Все права защищены.</a>")
        onLinkActivated: Qt.openUrlExternally("https://github.com/DionysusBenstein")
        wrapMode: Text.WordWrap
        font {
            pixelSize: 15
            family: robotoMediumFont.name
        }
    }

    Button {
        id: doneButton
        anchors {
            right: parent.right
            bottom: parent.bottom
            bottomMargin: 2
            rightMargin: 8
        }

        flat: true
        Material.foreground: primaryColor
        text: qsTr("OK")
        onClicked: popup.close()
    }
}
