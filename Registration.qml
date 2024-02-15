import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: firstRectangle
    property color textColor: "#535353"// This is available in all editors.
    property int regularSpacing: 32
    color: "white"
    anchors.centerIn: parent
    radius: 5
    width: 300
    height: 250

    Column{
        anchors.fill: parent
        padding: firstRectangle.regularSpacing
        spacing: firstRectangle.regularSpacing

        TextField {
            id: loginTextField
            placeholderText: qsTr("Логин")
            anchors.horizontalCenter: parent.horizontalCenter
            color: firstRectangle.textColor
            width: buttonEnter.width
            height: buttonEnter.height
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
        }

        TextField {
            id: passwordTextField
            echoMode: TextInput.Password
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderText: qsTr("Пароль")
            color: firstRectangle.textColor
            width: buttonEnter.width
            height: buttonEnter.height
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: buttonEnter
            width:  200
            height: 40
            background: Rectangle {
                color: parent.down ? "#bbbbbb" : (parent.hovered ? "d6d6d6" : "#f6f6f6")
            }
            text: qsTr("Войти")
            font.pointSize: 14
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: checkCredentials()
            Keys.onEnterPressed: checkCredentials()
            Keys.onReturnPressed: checkCredentials()
        }
    }

    SequentialAnimation{
        id: successAnimation
        PropertyAnimation {
            targets: [loginTextField, passwordTextField, buttonEnter]
            property: "opacity"
            to: 0
            duration: 400
        }

        PropertyAnimation {
            target: firstRectangle
            property: "opacity"
            to: 0
            duration: 600
        }
    }

    ParallelAnimation { //обе анимации исполняются одновременно
        id: failAnimation
        SequentialAnimation {
            PropertyAnimation { //становится красного цвета
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: "dark red"
                duration: 0
            }

            PropertyAnimation { //через 400мс становится прежним
                targets: [loginTextField, passwordTextField]
                property: "color"
                to: firstRectangle.textColor
                duration: 400
            }
        }

        SequentialAnimation { //анимация потрясывания
            NumberAnimation {
                target: firstRectangle
                property: "anchors.horizontalCenterOffset"
                to: -5
                duration: 50
            }

            NumberAnimation {
                target: firstRectangle
                property: "anchors.horizontalCenterOffset"
                to: 5
                duration: 100
            }

            NumberAnimation {
                target: firstRectangle
                property: "anchors.horizontalCenterOffset"
                to: 0
                duration: 50
            }
        }
    }

    function checkCredentials(){
        if(loginTextField.text == root.login && passwordTextField.text == root.password){
            successAnimation.start()
        }
        else{
            failAnimation.start()
        }
    }
}
