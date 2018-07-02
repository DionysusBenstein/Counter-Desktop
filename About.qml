/*******************************************************************/

/* Original File Name: About.qml                                   */

/* Date: 02-07-2018                                                */

/* Developer: Dionysus Benstein                                    */

/* Copyright © 2018 Dionysus Benstein. All rights reserved.        */

/* Description: Страница с информацией о программе и разработчиках.*/

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
    width: 426
    height: 320
    modal: true
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    padding: 0

    //    DEBUG
    //
    //    Rectangle {
    //        anchors.fill: parent
    //        color: primaryColor
    //    }

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
        text: "Counter"
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
        text: "Версия: 2.7.0"
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

    ScrollView {
        anchors {
            right: parent.right
            left: aboutWndRect.right
            top: parent.top
            topMargin: 25
            leftMargin: 19
            rightMargin: 19
        }
        ScrollBar.vertical.interactive: true

    Text {
        id: about
        text: "<b>Counter</b> — настольное приложение, которое подсчитывает количество символов и слов в тексте."
        color: darkFontColor
        wrapMode: Text.WordWrap
        font {
            pixelSize: 16
            family: robotoMediumFont.name
        }
        anchors.fill: parent

//        anchors {
//            right: parent.right
//            left: aboutWndRect.right
//            top: parent.top
//            topMargin: 25
//            leftMargin: 19
//            rightMargin: 19
//        }
    }

    Text {
        id: disclamer
        text: "Программа предоставляется на условиях «как есть» (as is). Автор не даёт никаких гарантий в отношении бесперебойной работы Программы и в отсутствии ошибок в Программе. Автор не несет ответственности за прямой, косвенный или другие виды ущерба, в т.ч. потерю данных, повреждения или любые другие виды потерь, связанные с использованием Программы (правильным или неправильным)."
        color: darkFontColor
        wrapMode: Text.WordWrap
        font {
            pixelSize: 15
            family: robotoMediumFont.name
        }
        anchors.fill: parent

//        anchors {
//            right: parent.right
//            left: aboutWndRect.right
//            top: about.bottom
//            topMargin: 5
//            leftMargin: 19
//            rightMargin: 19
//        }
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
