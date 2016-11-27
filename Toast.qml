import QtQuick 2.2

//Thanks to : http://stackoverflow.com/questions/26879266/make-toast-in-android-by-qml



/**
A qml file to interact with the user
An android like toast is shown in the middle of the screen when something is wrong
**/

Rectangle{

    function show(text, duration){
        theText.text = text;
        if(typeof duration !== "undefined"){
            if(duration >= 2*fadeTime)
                time = duration;
            else
                time = 2*fadeTime;
            }
        else
            time = defaultTime;
        anim.start();
    }

    property bool selfDestroying: false

    id: root

    property real time: defaultTime
    readonly property real defaultTime: 3000
    readonly property real fadeTime: 300

    property real margin: 10

    width: childrenRect.width + 2*margin
    height: childrenRect.height + 2*margin
    radius: margin

    anchors.horizontalCenter: parent.horizontalCenter

    opacity: 0
    color: "lightgrey"

    Text{
        id: theText
        text: ""

        horizontalAlignment: Text.AlignHCenter
        x: margin
        y: margin
    }

    SequentialAnimation on opacity{
        id: anim

        running: false

        NumberAnimation{
            to: 0.9
            duration: fadeTime
        }
        PauseAnimation{
            duration: time - 2*fadeTime
        }
        NumberAnimation{
            to: 0
            duration: fadeTime
        }

        onRunningChanged:{
            if(!running && selfDestroying)
                root.destroy();
        }
    }
}

