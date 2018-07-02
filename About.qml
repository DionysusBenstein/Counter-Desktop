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
    bottomPadding: 0
    topPadding: 25
    leftPadding: 25
    rightPadding: 0

//    DEBUG
//
//    Rectangle {
//        anchors.fill: parent
//        color: primaryColor
//    }

    Text {
        id: aboutWndTitle
        anchors {
            left: parent.left
            top: parent.top
        }

        text: qsTr("О программе")
        color: darkFontColor
        font {
            pixelSize: 20
            family: robotoMediumFont.name
        }
    }

    Label {

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
