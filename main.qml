import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Login")
    color: "#e5ecef"

    Connections{
        target: client
    }

    readonly property string login: "login"
    readonly property string password: "password"
    Registration{}
}
