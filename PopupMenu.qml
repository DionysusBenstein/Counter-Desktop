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

    Text {
        id: popupTitle
        anchors {
            left: parent.left
            top: parent.top
        }

        text: qsTr("Выбрать цвет")
        color: darkFontColor
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

    Grid {
        anchors {
            left: parent.left
            right: parent.right
            top: popupComboBox.bottom
            bottom: doneButton.top
            topMargin: 16
        }

        spacing: 4
        columns: 7
        rows: 3

        Rectangle {
            width: 32
            height: 32
            color: "#e91e63"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#F44336"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#9C27B0"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#673AB7"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#3F51B5"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#2196F3"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#009688"
            radius: width / 2
        }
        //
        Rectangle {
            width: 32
            height: 32
            color: "#4CAF50"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#FF9800"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#FF5722"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#795548"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#9E9E9E"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#607D8B"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#EF9A9A"
            radius: width / 2
        }
        //
        Rectangle {
            width: 32
            height: 32
            color: "#F48FB1"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#CE93D8"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#B39DDB"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#616161"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#424242"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#263238"
            radius: width / 2
        }

        Rectangle {
            width: 32
            height: 32
            color: "#757575"
            radius: width / 2
        }
    }


    Button {
        id: doneButton
        text: qsTr("OK")
        anchors {
            right: parent.right
            bottom: parent.bottom
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
        }

        flat: true
        Material.foreground: primaryColor
        onClicked: popup.close()
    }
}
