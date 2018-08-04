/*******************************************************************/

/* Original File Name: About.qml                                   */

/* Date: 02-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Страница с информацией о программе и разработчиках.*/

/*******************************************************************/

import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3

Popup {
    id: popup
    x: Math.round((parent.width - width) / 2)
    y: Math.round((parent.height - height) / 2)
    width: 426; height: 320
    parent: Overlay.overlay
    modal: true
    focus: true
    clip:  true
    padding: 0

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
            left: parent.left
            top: icon.bottom
            leftMargin: 25
            topMargin: 25
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
            left: parent.left
            top: appName.bottom
            leftMargin: 25
            topMargin: 5
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
            left: parent.left
            top: version.bottom
            leftMargin: 25
            topMargin: 5
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
            left: aboutWndRect.right
            right: parent.right
            top: parent.top
            leftMargin: 19
            rightMargin: 19
            topMargin: 25
        }

        color: Material.theme === Material.Dark ? "white" : darkFontColor
        wrapMode: Text.WordWrap
        text: qsTr("<b>Counter</b> — бесплатное настольное кроссплатформенное приложение с открытыми
                    исходным кодом, которое подсчитывает количество символов и слов в тексте.")

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
            left: aboutWndRect.right
            right: parent.right
            top: about.bottom
            leftMargin: 19
            rightMargin: 19
            topMargin: 25
        }

        text: qsTr("<a href=\"https://github.com/DionysusBenstein\">Copyright © 2018 Dionysus Benstein. Все права защищены.</a>")
        linkColor: primaryColor
        onLinkActivated: {
            Qt.openUrlExternally("https://github.com/DionysusBenstein")
            popup.close()
        }

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
            rightMargin: 8
            bottomMargin: 2
        }

        flat: true
        text: qsTr("OK")
        Material.foreground: primaryColor
        onClicked: popup.close()
    }
}
