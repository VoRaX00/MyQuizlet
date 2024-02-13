import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
ColumnLayout{
    anchors.centerIn: parent
    spacing: 1 //пространство между элементами
    Text {
        Layout.leftMargin: parent.width / 2 - width / 2
        text: "Регистрация:"
    }

    TextField {
        Layout.leftMargin: parent.width / 2 - width / 2
        placeholderText: "Имя"
    }

    Button {
        Layout.leftMargin: parent.width / 2 - width / 2
        text: "Войти"
        
    }
}

