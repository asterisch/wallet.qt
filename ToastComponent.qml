import QtQuick 2.2

//Thanks to : http://stackoverflow.com/questions/26879266/make-toast-in-android-by-qml

/**
A qml file to interact with the user
This file uses the Toast.qml to show the message on the screen
**/


Column{
    function show(text, duration){
        var toast = toastComponent.createObject(root);
        toast.selfDestroying = true;
        toast.show(text, duration);
    }

    id: root

    z: Infinity
    spacing: 5
    anchors.centerIn: parent

    property var toastComponent

    Component.onCompleted: toastComponent = Qt.createComponent("Toast.qml")
}
