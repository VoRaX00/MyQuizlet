import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout{
    anchors.centerIn: parent
    spacing: 1 //пространство между элементами
    width: parent.width / 6
    height: parent.width / 6
    Layout.maximumHeight: 120
    Layout.maximumWidth: 400

    Text {
//        Layout.leftMargin: parent.width / 2 - width / 2
        horizontalAlignment: Text.AlignHCenter
        text: "Регистрация:"
        Layout.fillWidth: true
        font.pointSize: 13
    }

    TextField {
        //Layout.leftMargin: parent.width / 2 - width / 2
        placeholderText: "Имя"
        Layout.fillWidth: true
        //Layout.fillHeight: true
    }

    Button {
        id: buttonEnter
        //Layout.leftMargin: parent.width / 2 - width / 2
        Text {
            text: qsTr("Войти")
            anchors.centerIn: buttonEnter
        }
        //Layout.fillHeight: true
        Layout.fillWidth: true
        
    }
}

